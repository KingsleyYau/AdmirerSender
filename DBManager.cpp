/*
 * DBManager.cpp
 *
 *  Created on: 2015-9-24
 *      Author: Max
 */

#include "DBManager.h"

#define MAXSQLSIZE 100 * 1024

DBManager::DBManager() {
	// TODO Auto-generated constructor stub
	mpDBManagerCallback = NULL;
}

DBManager::~DBManager() {
	// TODO Auto-generated destructor stub
}

bool DBManager::Init(
		const DBSTRUCT& dbMan,
		int iDbCount,
		const DBSTRUCT* dbLady
		) {

	bool bFlag = false;

	printf("# DBManager initializing... \n");

	mDbMan = dbMan;
	miDbCount = iDbCount;
	mpDbLady = (DBSTRUCT*)dbLady;

	bFlag = mDBSpool.SetConnection(2 * mDbMan.miMaxDatabaseThread);
	bFlag = bFlag && mDBSpool.SetDBparm(
			mDbMan.mHost.c_str(),
			mDbMan.mPort,
			mDbMan.mDbName.c_str(),
			mDbMan.mUser.c_str(),
			mDbMan.mPasswd.c_str()
			);
	bFlag = bFlag && mDBSpool.Connect();

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"DBManager::Init( "
			"mDbMan.mHost : %s, "
			"mDbMan.mPort : %d, "
			"mDbMan.mDbName : %s, "
			"mDbMan.mUser : %s, "
			"mDbMan.mPasswd : %s, "
			"mDbMan.miMaxDatabaseThread : %d, "
			"mDbMan.miSiteId : %d, "
			"mDbMan.miOverValue : %d, "
			"miDbCount : %d, "
			"bFlag : %s "
			")",
			mDbMan.mHost.c_str(),
			mDbMan.mPort,
			mDbMan.mDbName.c_str(),
			mDbMan.mUser.c_str(),
			mDbMan.mPasswd.c_str(),
			mDbMan.miMaxDatabaseThread,
			mDbMan.miSiteId,
			mDbMan.miOverValue,
			miDbCount,
			bFlag?"true":"false"
			);

	for(int i = 0; i < miDbCount && bFlag; i++) {
		bFlag = mDBSpoolLady[i].SetConnection(mpDbLady[i].miMaxDatabaseThread);
		bFlag = bFlag && mDBSpoolLady[i].SetDBparm(
				mpDbLady[i].mHost.c_str(),
				mpDbLady[i].mPort,
				mpDbLady[i].mDbName.c_str(),
				mpDbLady[i].mUser.c_str(),
				mpDbLady[i].mPasswd.c_str()
				);
		bFlag = bFlag && mDBSpoolLady[i].Connect();

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::Init( "
				"mpDbLady[%d].mHost : %s, "
				"mpDbLady[%d].mPort : %d, "
				"mpDbLady[%d].mDbName : %s, "
				"mpDbLady[%d].mUser : %s, "
				"mpDbLady[%d].mPasswd : %s, "
				"mpDbLady[%d].miMaxDatabaseThread : %d, "
				"mpDbLady[%d].miSiteId : %d, "
				"mpDbLady[%d].miOverValue : %d,"
				"bFlag : %s "
				")",
				i,
				mpDbLady[i].mHost.c_str(),
				i,
				mpDbLady[i].mPort,
				i,
				mpDbLady[i].mDbName.c_str(),
				i,
				mpDbLady[i].mUser.c_str(),
				i,
				mpDbLady[i].mPasswd.c_str(),
				i,
				mpDbLady[i].miMaxDatabaseThread,
				i,
				mpDbLady[i].miSiteId,
				i,
				mpDbLady[i].miOverValue,
				bFlag?"true":"false"
				);
	}

	printf("# DBManager initialize OK. \n");

	return bFlag;
}

void DBManager::SetDBManagerCallback(DBManagerCallback *pDBManagerCallback) {
	mpDBManagerCallback = pDBManagerCallback;
}

void DBManager::SyncLadyList(int siteId) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::SyncLadyList( "
			"tid : %d, "
			"siteId : %d "
			")",
			(int)syscall(SYS_gettid),
			siteId
			);

	bool bFlag = false;

	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};
	int iIndex = GetIndexBySiteId(siteId);

	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	/**
	 * 增量同步女士
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SyncLadyList( "
				"tid : %d, "
				"[增量同步女士] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT id, agentid, womanid, firstname, regulation, groupid, agent_follow_id, agent_follow_name, ip, computer_id "
				"FROM admire_assistant_send "
				"WHERE id > %d "
				";",
				mpDbLady[iIndex].miLastUpdate
		);
		LogManager::GetLogManager()->Log(
				LOG_MSG,
				"DBManager::SyncLadyList( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_MSG,
					"DBManager::SyncLadyList( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					Lady item;
					item.mSiteId = siteId;
					item.mAgentId = row[1];
					item.mWomanId = row[2];
					item.mWomanName = row[3];

					// 分割规制
					string regulations = row[4];
					regulations += ",";

					item.mGroupId = row[5];
					item.mAagentStaff = row[6];
					item.mAagentStaffName = row[7];
					item.mIp = row[8];
					item.mComputerId = row[9];

					string regulation;
				    int index = 0;
				    string::size_type pos;
				    pos = regulations.find(",", index);
				    while( pos != string::npos ) {
				    	regulation = regulations.substr(index, pos - index);
				    	if( regulation.length() > 0 ) {
				    		item.mRegulationList.push_back(regulation);
				    	}

				    	index = pos + 1;
						pos = regulations.find(",", index);
				    }

					if( mpDBManagerCallback != NULL ) {
						mpDBManagerCallback->OnGetLady(this, item);
					}

					if( i == iRows - 1 ) {
						mpDbLady[iIndex].miLastUpdate = atoi(row[0]);
					}
				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}
}

bool DBManager::CanSendLetter(
		const Lady& lady
		) {
	const string womanId = lady.mWomanId;
	const string agentId = lady.mAgentId;
	int siteId = lady.mSiteId;

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"DBManager::CanSendLetter( "
			"tid : %d, "
			"womanId : %s, "
			"agentId : %s, "
			"siteId : %d, "
			"start "
			")",
			(int)syscall(SYS_gettid),
			womanId.c_str(),
			agentId.c_str(),
			siteId
			);

	bool bFlag = false;

	RESDataList res;
	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};

	int iAdmireMax = 0;
	int iAdmireSumBalance = 0;

	int iIndex = GetIndexBySiteId(siteId);
	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	/**
	 * 1.检查女士资料
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"[1.检查女士资料] "
				")",
				(int)syscall(SYS_gettid)
				);
		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT groupid "
				"FROM woman "
				"WHERE womanid = '%s' "
				"AND status1 IN ('0','2') "
				"AND deleted = '0' "
				"AND owner = '%s' "
				"AND black = 'N' "
				"AND problem = '0' "
				"AND ordervalue >= %d "
				";",
				womanId.c_str(),
				agentId.c_str(),
				mpDbLady[iIndex].miOverValue
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanSendLetter( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					bFlag = true;

					string groupId;
				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}

	/**
	 * 4.检查代理机构是否开通意向信
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"[4.检查代理机构是否开通意向信] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT admire_max, admire_sum_balance "
				"FROM agent "
				"WHERE agentid = '%s' "
				"AND admirers = 'Y' "
				";",
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_MSG,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_MSG,
					"DBManager::CanSendLetter( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					iAdmireMax = atoi(row[0]);
					iAdmireSumBalance = atoi(row[1]);

					if( iAdmireSumBalance > 0 ) {
						bFlag = true;
					}
				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}

	/**
	 * 1.1检查女士是否由发送意向信的权限（我司设定）
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"[1.1检查女士是否由发送意向信的权限] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT count(*) "
				"FROM woman_priv "
				"WHERE womanid = '%s' "
				"AND admirer2 = 0 "
				";",
				womanId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanSendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 检测女士所在机构是否已开启自动发送意向信的权限
	 */
	/**
	 * 检测女士是否已开启自动发送意向信的权限
	 */

	/**
	 * 7.同一女士一天內發送意向信不能超過机构设定值
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"[7.同一女士一天內發送意向信不能超過机构设定值] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT count(*) "
				"FROM admire_temp "
				"WHERE womanid = '%s' "
				"AND agent = '%s' "
				"AND adddate >= CURDATE() "
				";",
				womanId.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanSendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( atoi(res.front().c_str()) >= iAdmireMax ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 9.女士在5天內EMF通信关系不超过8对
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"[9.女士在5天內EMF通信关系不超过8对] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT count(*) "
				"FROM hotmember "
				"WHERE memberid = '%s' "
				"AND mbtype = 'w' "
				"AND mw_num > 2 "
				"AND num > 15 "
				";",
				womanId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanSendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanSendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::CanSendLetter( "
			"tid : %d, "
			"bFlag : %s "
			")",
			(int)syscall(SYS_gettid),
			bFlag?"true":"false"
			);

	return bFlag;
}

bool DBManager::GetTemplateList(
		const Lady& lady,
		const string& regulation,
		list<string>& templateList
		) {
	const string womanId = lady.mWomanId;
	const string agentId = lady.mAgentId;
	int siteId = lady.mSiteId;

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"DBManager::GetTemplateList( "
			"tid : %d, "
			"womanId : %s, "
			"agentId : %s, "
			"regulation : %s, "
			"siteId : %d "
			")",
			(int)syscall(SYS_gettid),
			womanId.c_str(),
			agentId.c_str(),
			regulation.c_str(),
			siteId
			);

	bool bFlag = false;

	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};

	int iIndex = GetIndexBySiteId(siteId);
	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::GetTemplateList( "
				"tid : %d, "
				"[获取模板] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT template "
				"FROM admire_assistant_regulation "
				"WHERE id = %s "
				"AND womanid = '%s' "
				"AND agentid = '%s' "
				"LIMIT 1 "
				";",
				regulation.c_str(),
				womanId.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::GetTemplateList( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::GetTemplateList( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					// 分割模板
					string templates = row[0];
					templates += ",";

					string templateCode;
				    int index = 0;
				    string::size_type pos;
				    pos = templates.find(",", index);
				    while( pos != string::npos ) {
				    	templateCode = templates.substr(index, pos - index);
				    	if( templateCode.length() > 0 ) {
				    		templateList.push_back(templateCode);
				    	}

				    	index = pos + 1;
						pos = templates.find(",", index);
				    }

				    bFlag = true;
				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}

	return bFlag;
}

bool DBManager::CanRecvLetter(
		const Lady& lady,
		const Man& man
		) {

	const string womanId = lady.mWomanId;
	const string womanName = lady.mWomanName;
	const string agentId = lady.mAgentId;
	const string agentStaff = lady.mAagentStaff;
	const string agentStaffName = lady.mAagentStaffName;
	const string groupId = lady.mGroupId;
	int siteId = lady.mSiteId;

	const string manId = man.mManId;
	const string manName = man.mManName;
	int paidAmount = man.mPaidAmount;

	bool bPayMember = (paidAmount > 0)?true:false;
	int iAgentMaxnumin24hour = (paidAmount > 0)?5:100;

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::CanRecvLetter( "
			"tid : %d, "
			"womanId : %s, "
			"manId : %s "
			")",
			(int)syscall(SYS_gettid),
			womanId.c_str(),
			manId.c_str()
			);

	bool bFlag = false;

	RESDataList res;
	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};
	int iIndex = GetIndexBySiteId(siteId);

	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	/**
	 * 3.检查是否有EMF通信关系或者女士是否给男士发过发过首封EMF
	 * 检查男士是否发过BP信件给女士
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[3.检查是否有EMF通信关系或者女士是否给男士发过发过首封EMF, 检查男士是否发过BP信件给女士] "
				")",
				(int)syscall(SYS_gettid)
				);
		sprintf(
				sql,
				"SELECT mw_num, wm_reply_num, integral "
				"FROM relation "
				"WHERE womanid = '%s' "
				"AND manid = '%s' "
				";",
				womanId.c_str(),
				manId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					if( strcmp(row[0], "0") != 0 || strcmp(row[1], "0") != 0 ) {
						// 检查是否有EMF通信关系或者女士是否给男士发过发过首封EMF
						UpdateFAV(lady, man);
						bFlag = false;
					} else if( strcmp(row[1], "0") != 0 ){
						// 检查男士是否发过BP信件给女士
						bFlag = false;
					}
				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}

	/**
	 * 5.同一机构多个女士在短时间內向男士提交过意向信
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[5.同一机构多个女士在短时间內向男士提交过意向信] "
				")",
				(int)syscall(SYS_gettid)
				);

		sprintf(
				sql,
				"SELECT count(*) "
				"FROM admire_temp "
				"WHERE adddate >= DATE_SUB(NOW(), INTERVAL 1 DAY)"
				"AND manid = '%s' "
				"AND agent = '%s' "
				";",
				manId.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);

			if( !res.empty() ) {
				if( atoi(res.front().c_str()) >= iAgentMaxnumin24hour ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 5.1.检查该女士与该男士24小时内有没有提交过意向信
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[5.1.检查该女士与该男士24小时内有没有提交过意向信] "
				")",
				(int)syscall(SYS_gettid)
				);

		sprintf(
				sql,
				"SELECT count(*) "
				"FROM admire_temp "
				"WHERE adddate >= DATE_SUB(NOW(), INTERVAL 1 DAY) "
				"AND manid = '%s' "
				"AND womanid = '%s' "
				";",
				manId.c_str(),
				womanId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 6.男士当天收到多于manmaxnumoneday封意向信即禁发
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[6.男士当天收到多于manmaxnumoneday封意向信即禁发] "
				")",
				(int)syscall(SYS_gettid)
				);
		sprintf(
				sql,
				"SELECT count(*) "
				"FROM stats_admire_%s "
				"WHERE manid = '%s' "
				"AND sent >= 6 "
				";",
				mpDbLady[iIndex].mPostfix.c_str(),
				manId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpool.ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 8.男士在5天內EMF通信关系超过50对
	 * 只有是付费会员时才检测这个条件
	 */
	if( bFlag && bPayMember ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[8.男士在5天內EMF通信关系超过50对] "
				")",
				(int)syscall(SYS_gettid)
				);
		sprintf(
				sql,
				"SELECT count(*) "
				"FROM hotmember "
				"WHERE mbtype = 'm' "
				"AND num > 50 "
				"AND memberid = '%s' "
				";",
				manId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpool.ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	/**
	 * 10.检查是否男士发过CupidNote给女士
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[10.检查是否男士发过CupidNote给女士] "
				")",
				(int)syscall(SYS_gettid)
				);
		sprintf(
				sql,
				"SELECT count(*) "
				"FROM cupid1 "
				"WHERE manid = '%s' "
				"AND womanid = '%s' "
				"AND agentid = '%s' "
				"AND review IN('N','Y') "
				";",
				manId.c_str(),
				womanId.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
					UpdateFAV(lady, man);
				}
			}
		}
	}

	/**
	 * 11.检查是否发过意向信
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"[11.检查是否发过意向信] "
				")",
				(int)syscall(SYS_gettid)
				);
		sprintf(
				sql,
				"SELECT count(*) "
				"FROM ammsg01_new "
				"WHERE submit_date > DATE_SUB(NOW(), INTERVAL 1 MONTH) "
				"AND manid = '%s' "
				"AND womanid = '%s' "
				"AND hideflag = 'N' "
				";",
				manId.c_str(),
				womanId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::CanRecvLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::CanRecvLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( !res.empty() ) {
				if( res.front() != "0" ) {
					bFlag = false;
				}
			}
		}
	}

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::CanRecvLetter( "
			"tid : %d, "
			"bFlag : %s "
			")",
			(int)syscall(SYS_gettid),
			bFlag?"true":"false"
			);

	return bFlag;
}

bool DBManager::SendLetter(
		const Lady& lady,
		const string& regulation,
		const string& templateCode
		) {
	const string womanId = lady.mWomanId;
	const string agentId = lady.mAgentId;
	int siteId = lady.mSiteId;

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"DBManager::SendLetter( "
			"tid : %d, "
			"womanId : %s, "
			"regulation : %s, "
			"templateCode : %s "
			")",
			(int)syscall(SYS_gettid),
			womanId.c_str(),
			regulation.c_str(),
			templateCode.c_str()
			);

	bool bFlag = false;

	int iIndex = GetIndexBySiteId(siteId);
	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	RESDataList res;
	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};

	if( bFlag ) {
		bFlag = false;

		/**
		 * 2.获取男士列表(检查男士资料情况)
		 */
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[2.获取男士列表(检查男士资料情况)] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT info_core.manid, info_basic.firstname, info_core.paid_amount "
				"FROM info_core, info_basic, info_desc, info_site_%s, info_match_%s "
				"WHERE info_core.manid = info_basic.manid "
				"AND info_core.manid = info_desc.manid "
				"AND info_core.manid = info_site_cl.manid "
				"AND info_core.manid = info_match_cl.manid "
				"AND info_basic.marry != 5 "
				"AND info_core.status = 0 "
				"AND "
				"("
				"info_core.chnlove != 0 "
				"OR info_core.thaimatches != 0 "
				"OR info_core.latamdate != 0 "
				"OR info_core.charmingdate != 0"
				") "
				"AND info_site_%s.permit = 'Y' "
				"AND info_site_%s.sendadm != 0 "
				"AND info_site_%s.sendadm2 != 0 "
				";",
				mpDbLady[iIndex].mPostfix.c_str(),
				mpDbLady[iIndex].mPostfix.c_str(),
				mpDbLady[iIndex].mPostfix.c_str(),
				mpDbLady[iIndex].mPostfix.c_str(),
				mpDbLady[iIndex].mPostfix.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpool.ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					Man man;
					man.mManId = row[0];
					man.mManName = row[1];
					man.mPaidAmount = atoi(row[2]);

					/**
					 * 检查男士是否允许接收
					 */
					if( CanRecvLetter(lady, man) ) {
						bFlag = SendLetter(lady, regulation, templateCode, man);
						break;
					}
				}
			}
		}
		mDBSpool.ReleaseConnection(shIdt);
	}


	return bFlag;
}


bool DBManager::SendLetter(
		const Lady& lady,
		const string& regulation,
		const string& templateCode,
		const Man& man
		) {

	const string womanId = lady.mWomanId;
	const string womanName = lady.mWomanName;
	const string agentId = lady.mAgentId;
	const string groupId = lady.mGroupId;
	const string agentStaff = lady.mAagentStaff;
	const string agentStaffName = lady.mAagentStaffName;
	const string ip = lady.mIp;
	const string computerId = lady.mComputerId;
	int siteId = lady.mSiteId;

	const string manId = man.mManId;
	const string manName = man.mManName;

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::SendLetter( "
			"tid : %d, "
			"womanId : %s, "
			"templateCode : %s "
			"manId : %s "
			")",
			(int)syscall(SYS_gettid),
			womanId.c_str(),
			templateCode.c_str(),
			manId.c_str()
			);

	bool bFlag = false;

	// 附件
	list<string> attachmentList;
	string attachmentListText;

	// 写从表用的参数
	string body = "";

	RESDataList res;
	MYSQL_RES* pSQLRes = NULL;
	short shIdt = 0;
	int iRows = 0;
	unsigned long long iInsertId = 0;
	char sql[MAXSQLSIZE] = {'\0'};

	int iIndex = GetIndexBySiteId(siteId);
	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	/**
	 * 获取附件和模板
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[获取附件和模板] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"SELECT attachment, at_greet, at_content_en, at_show_cn, at_content_cn "
				"FROM admire_template "
				"WHERE owner = '%s' "
				"AND womanid = '%s' "
				"AND template_type = 'A' "
				"AND at_status = 'A' "
				"AND at_id = %s "
				"LIMIT 1 "
				";",
				agentId.c_str(),
				womanId.c_str(),
				templateCode.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_SELECT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &pSQLRes, shIdt, iRows) ) {
			int iFields = mysql_num_fields(pSQLRes);
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d, "
					"iFields : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows,
					iFields
					);
			if (iFields > 0) {
				MYSQL_FIELD* fields;
				MYSQL_ROW row;
				fields = mysql_fetch_fields(pSQLRes);

				for (int i = 0; i < iRows; i++) {
					if ((row = mysql_fetch_row(pSQLRes)) == NULL) {
						break;
					}

					bFlag = true;

					// 分割附件
					attachmentListText = "";
					string attachments = row[0];
					attachments += "|";

					string attachment;
				    int index = 0;
				    string::size_type pos;
				    pos = attachments.find("|", index);
				    while( pos != string::npos ) {
				    	attachment = attachments.substr(index, pos - index);
				    	if( attachment.length() > 0 ) {
				    		attachmentList.push_back(attachment);

				    		attachmentListText += attachment;
				    		attachmentListText += ".jpg|";
				    	}

				    	index = pos + 1;
						pos = attachments.find(",", index);
				    }

				    if( attachmentListText.length() > 0 ) {
				    	attachmentListText = attachmentListText.substr(0, attachmentListText.length() - 1);
				    }

				    // 生成从表参数
					string greet = "<p align=\"left\">";
					greet += row[1];
					greet += "&nbsp;";
					greet += manName;
					greet += ",</p><br/>";

					string line = "<br/><br/><p align=\"center\" style=\"color:#666;width:100%;background:#f1f1f1;padding:2px 0;\">Original Text Written by the Lady</p><br/><br/><p align='left'>";
					line += row[1];
					line += "'&nbsp;'";
					line += manName;
					line += ",</p><br />";

					string at_content_en = row[2];
					string at_show_cn = row[3];
					string at_content_cn = row[4];

					body = greet + at_content_en;
					body += (at_show_cn == "Y" && at_content_cn.length() > 0)?at_content_cn:"";

				}
			}
		}
		mDBSpoolLady[iIndex].ReleaseConnection(shIdt);
	}

	/**
	 * 写入过渡表
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[写入过渡表] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"INSERT INTO admire_temp "
				"SET "
				"womanid = '%s', "
				"manid = '%s', "
				"adddate = NOW(), "
				"agent = '%s' "
				";",
				womanId.c_str(),
				manId.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_INSERT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows, &iInsertId) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( iRows > 0 && iInsertId != 0 ) {
				bFlag = true;
			}
		}
	}

	// 写入主表
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[写入主表] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"INSERT INTO ammsg01_1m "
				"SET "
				"id = %llu, "
				"womanid = '%s', "
				"womanname = '%s', "
				"sendmode = 1, "
				"template_id = '%s', "
				"manid = '%s', "
				"manname = '%s', "
				"submit_date = NOW(), "
				"sent_date = NOW(), "
				"readflag = 'N', "
				"replyflag = 0, "
				"hideflag = 'N', "
				"agent = '%s', "
				"agent_staff = '%s', "
				"resubmit = 'Y', "
				"sendflag = 'Y', "
				"replyid = '', "
				"form_no = '', "
				"deleted = 'N', "
				"review_mode = 0, "
				"attachnum = %d, "
				"groupid = '%s', "
				"is_assistant = %s "
				";",
				iInsertId,
				womanId.c_str(),
				womanName.c_str(),
				templateCode.c_str(),
				manId.c_str(),
				manName.c_str(),
				agentId.c_str(),
				agentStaff.c_str(),
				(int)attachmentList.size(),
				groupId.c_str(),
				regulation.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_INSERT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( iRows > 0 ) {
				bFlag = true;
			}
		}
	}

	// 写入从表
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[写入从表] "
				")",
				(int)syscall(SYS_gettid)
				);

		string review_history = "提交﹕CURDATE()GMT  IP:";
		review_history += ip;
		review_history += "  電腦編號﹕";
		review_history += computerId;
		review_history += " 工作人員:";
		review_history += agentStaffName;
		review_history += "[";
		review_history += agentStaff;
		review_history += "]";

		snprintf(sql, MAXSQLSIZE - 1,
				"INSERT INTO ammsg02_1m "
				"SET "
				"id = %llu, "
				"body = '%s', "
				"reviewer = '', "
				"lady_tel = '', "
				"denyreason = '', "
				"review_history = '%s', "
				"ip = '%s', "
				"computerid = '%s', "
				"attachment = '%s' "
				";",
				iInsertId,
				body.c_str(),
				review_history.c_str(),
				ip.c_str(),
				computerId.c_str(),
				attachmentListText.c_str()
		);

//		LogManager::GetLogManager()->Log(
//				LOG_STAT,
//				"DBManager::SendLetter( "
//				"tid : %d, "
//				"sql : %s "
//				")",
//				(int)syscall(SYS_gettid),
//				sql
//				);

		if ( SQL_TYPE_INSERT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( iRows > 0 ) {
				bFlag = true;
			}
		}
	}

	/**
	 * 更新机构意向信当日限量余数
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[更新机构意向信当日限量余数] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"UPDATE agent "
				"SET admire_sum_balance = admire_sum_balance - 1 "
				"WHERE agentid = '%s' "
				";",
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_UPDATE == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( iRows > 0 ) {
				bFlag = true;
			}
		}
	}

	/**
	 * 更新男士会员当日意向信提交数量
	 */
	if( bFlag ) {

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[更新男士会员当日意向信提交数量] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"UPDATE stats_admire_%s "
				"SET day1 = day1 + 1, "
				"total = total + 1 "
				"WHERE manid = '%s' "
				";",
				mpDbLady[iIndex].mPostfix.c_str(),
				manId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);

		if ( SQL_TYPE_UPDATE == mDBSpool.ExecuteSQL(sql, &res, iRows)  ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
		}
	}


	/**
	 * 写入工作人员本月发意向信数量
	 */
	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"[写入工作人员本月发意向信数量(更新)] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"UPDATE admire_reply_rate "
				"SET num_submit = num_submit + 1, "
				"num_sent = num_sent + 1 "
				"WHERE staff_id = '%s' "
				"AND smonth = DATE_FORMAT(NOW(), \"%%Y-%%m-01\") "
				"AND agent = '%s' "
				"LIMIT 1 "
				";",
				agentStaff.c_str(),
				agentId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::SendLetter( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_UPDATE == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::SendLetter( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			if( iRows > 0 ) {
				bFlag = true;
			} else {
				LogManager::GetLogManager()->Log(
						LOG_STAT,
						"DBManager::SendLetter( "
						"tid : %d, "
						"[写入工作人员本月发意向信数量(插入)] "
						")",
						(int)syscall(SYS_gettid)
						);

				snprintf(sql, MAXSQLSIZE - 1,
						"INSERT INTO admire_reply_rate "
						"SET agent = '%s', "
						"smonth = DATE_FORMAT(NOW(), \"%%Y-%%m-01\"), "
						"staff_id = '%s', "
						"staff_name = '%s', "
						"num_submit = 1, "
						"num_sent = 1, "
						"num_reply = 0 "
						";",
						agentId.c_str(),
						agentStaff.c_str(),
						agentStaffName.c_str()
				);

				if ( SQL_TYPE_INSERT == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
					LogManager::GetLogManager()->Log(
							LOG_STAT,
							"DBManager::SendLetter( "
							"tid : %d, "
							"sql : %s, "
							"iRows : %d "
							")",
							(int)syscall(SYS_gettid),
							sql,
							iRows
							);
					if( iRows > 0 ) {
						bFlag = true;
					}
				}
			}
		}
	}

	/**
	 * 更新FAV表
	 */
	UpdateFAV(lady, man);

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"DBManager::SendLetter( "
			"tid : %d, "
			"bFlag : %s, "
			"end "
			")",
			(int)syscall(SYS_gettid),
			bFlag?"true":"false"
			);

	return bFlag;
}

/**
 * 更新FAV表
 */
bool DBManager::UpdateFAV(const Lady& lady, const Man& man) {
	bool bFlag = false;

	const string womanId = lady.mWomanId;
	int siteId = lady.mSiteId;
	const string manId = man.mManId;

	RESDataList res;
	int iRows = 0;
	char sql[MAXSQLSIZE] = {'\0'};

	int iIndex = GetIndexBySiteId(siteId);
	if( iIndex != INVALID_INDEX ) {
		bFlag = true;
	}

	if( bFlag ) {
		bFlag = false;

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::UpdateFAV( "
				"tid : %d, "
				"[更新FAV表] "
				")",
				(int)syscall(SYS_gettid)
				);

		snprintf(sql, MAXSQLSIZE - 1,
				"UPDATE favorites "
				"SET admire_mail = 1 "
				"WHERE manid = '%s' "
				"AND womanid = '%s' "
				"LIMIT 1 "
				";",
				manId.c_str(),
				womanId.c_str()
		);
		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"DBManager::UpdateFAV( "
				"tid : %d, "
				"sql : %s "
				")",
				(int)syscall(SYS_gettid),
				sql
				);
		if ( SQL_TYPE_UPDATE == mDBSpoolLady[iIndex].ExecuteSQL(sql, &res, iRows) ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"DBManager::UpdateFAV( "
					"tid : %d, "
					"iRows : %d "
					")",
					(int)syscall(SYS_gettid),
					iRows
					);
			bFlag = true;
		}
	}

	return bFlag;
}

int DBManager::GetIndexBySiteId(int siteId) {
	int index = INVALID_INDEX;
	for(int k = 0; k < miDbCount; k++ ) {
		if( mpDbLady[k].miSiteId == siteId ) {
			index = k;
			break;
		}
	}
	return index;
}
