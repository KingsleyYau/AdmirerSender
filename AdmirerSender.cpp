/*
 * AdmirerSender.cpp
 *
 *  Created on: 2015-1-13
 *      Author: Max.Chiu
 *      Email: Kingsleyyau@gmail.com
 */

#include "AdmirerSender.h"

#define MIN(A,B) ((A)<(B)?(A):(B))
#define MAX(A,B) ((A)>(B)?(A):(B))

/* send thread */
class SendLetterRunnable : public KRunnable {
public:
	SendLetterRunnable(AdmirerSender *container) {
		mContainer = container;
	}
	virtual ~SendLetterRunnable() {
		mContainer = NULL;
	}
protected:
	void onRun() {
		mContainer->SendRunnableHandle();
	}
private:
	AdmirerSender *mContainer;
};

/* state thread */
class StateRunnable : public KRunnable {
public:
	StateRunnable(AdmirerSender *container) {
		mContainer = container;
	}
	virtual ~StateRunnable() {
		mContainer = NULL;
	}
protected:
	void onRun() {
		mContainer->StateRunnableHandle();
	}
private:
	AdmirerSender *mContainer;
};

AdmirerSender::AdmirerSender() {
	// TODO Auto-generated constructor stub
	mpStateRunnable = new StateRunnable(this);
	mpSendRunnable = new SendLetterRunnable(this);
	mDbLady = NULL;
}

AdmirerSender::~AdmirerSender() {
	// TODO Auto-generated destructor stub
	if( mpStateRunnable ) {
		delete mpStateRunnable;
	}

	if( mpSendRunnable ) {
		delete mpSendRunnable;
	}

	delete[] mDbLady;
}

bool AdmirerSender::Run(const string& config) {
	if( config.length() > 0 ) {
		mConfigFile = config;

		// Reload config
		if( Reload() ) {
			/* log system */
			if( miDebugMode == 1 ) {
				LogManager::LogSetFlushBuffer(0);
			} else {
				LogManager::LogSetFlushBuffer(1 * BUFFER_SIZE_1K * BUFFER_SIZE_1K);
			}
			LogManager::GetLogManager()->Start(1000, miLogLevel, mLogDir);

			return Run();
		} else {
			printf("# Match Server can not load config file exit. \n");
		}

	} else {
		printf("# No config file can be use exit. \n");
	}

	return false;
}

bool AdmirerSender::Run() {
	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::Run( "
			"############## Admirer Sender ############## "
			")"
			);
	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::Run( "
			"Version : %s "
			")",
			VERSION_STRING
			);
	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::Run( "
			"Build date : %s %s "
			")",
			__DATE__,
			__TIME__
			);

	// print configure
	PrintConfig();

	bool bFlag = false;

	mTotal = 0;
	mHit = 0;
	mResponed = 0;

	mIsRunning = true;

	/* db manager */
	mDBManager.SetDBManagerCallback(this);
	bFlag = mDBManager.Init(
			mDbMan,
			miDbCount,
			mDbLady,
			mDbEmail
			);

	if( !bFlag ) {
		printf("# Admirer Sender can not initialize database exit. \n");
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Database Init fail )");
		return false;
	}
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Database Init OK )");

	/* admirer sender */
	mClientTcpServer.SetTcpServerObserver(this);
	/**
	 * 预估相应时间,内存数目*超时间隔*每秒处理的任务
	 */
	mClientTcpServer.SetHandleSize(miMaxMemoryCopy * miTimeout * miMaxQueryPerThread);
	if( mClientTcpServer.Start(miMaxClient, miPort, miMaxHandleThread) ) {
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( TcpServer Init OK )");
	} else {
		printf("# Admirer Sender can not start tcp server exit. \n");
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( TcpServer Init fail )");
		return false;
	}

	/* start send thread */
	mpSendThread = new KThread(mpSendRunnable);
	if( mpSendThread->start() != 0 ) {
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Create send thread OK )");
	} else {
		printf("# Admirer Sender can not create send thread exit. \n");
		return false;
	}

	mpStateThread = new KThread(mpStateRunnable);
	if( mpStateThread->start() != 0 ) {
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Create state thread OK )");
	} else {
		printf("# Admirer Sender can not create state thread exit. \n");
		return false;
	}

	mDBManager.SyncForce();
	for(int i = 0; i < miDbCount; i++) {
		mDBManager.SyncLadyForce(mDbLady[i].miSiteId);
	}

	printf("# AdmirerSender start OK. \n");
	LogManager::GetLogManager()->Log(LOG_WARNING, "AdmirerSender::Run( Init OK )");

	return true;
}

bool AdmirerSender::Reload() {
	bool bFlag = false;
	mConfigMutex.lock();
	if( mConfigFile.length() > 0 ) {
		ConfFile conf;
		conf.InitConfFile(mConfigFile.c_str(), "");
		if ( conf.LoadConfFile() ) {
			// BASE
			miPort = atoi(conf.GetPrivate("BASE", "PORT", "9876").c_str());
			miMaxClient = atoi(conf.GetPrivate("BASE", "MAXCLIENT", "100000").c_str());
			miMaxMemoryCopy = atoi(conf.GetPrivate("BASE", "MAXMEMORYCOPY", "1").c_str());
			miMaxHandleThread = atoi(conf.GetPrivate("BASE", "MAXHANDLETHREAD", "2").c_str());
			miMaxQueryPerThread = atoi(conf.GetPrivate("BASE", "MAXQUERYPERCOPY", "10").c_str());
			miTimeout = atoi(conf.GetPrivate("BASE", "TIMEOUT", "10").c_str());
			miStateTime = atoi(conf.GetPrivate("BASE", "STATETIME", "30").c_str());

			// DB
			mDbMan.mHost = conf.GetPrivate("DB", "DBHOST", "localhost");
			mDbMan.mPort = atoi(conf.GetPrivate("DB", "DBPORT", "3306").c_str());
			mDbMan.mDbName = conf.GetPrivate("DB", "DBNAME", "qpidnetwork_online");
			mDbMan.mUser = conf.GetPrivate("DB", "DBUSER", "root");
			mDbMan.mPasswd = conf.GetPrivate("DB", "DBPASS", "123456");
			mDbMan.miMaxDatabaseThread = atoi(conf.GetPrivate("DB", "MAXDATABASETHREAD", "4").c_str());
			mDbMan.miSyncTime = 60 * atoi(conf.GetPrivate("DB", "SYNCTIME", "30").c_str());

			// [DB_EMAIL]
			mDbEmail.mHost = conf.GetPrivate("DB_EMAIL", "DBHOST", "localhost");
			mDbEmail.mPort = atoi(conf.GetPrivate("DB_EMAIL", "DBPORT", "3306").c_str());
			mDbEmail.mDbName = conf.GetPrivate("DB_EMAIL", "DBNAME", "qpidnetwork_online");
			mDbEmail.mUser = conf.GetPrivate("DB_EMAIL", "DBUSER", "root");
			mDbEmail.mPasswd = conf.GetPrivate("DB_EMAIL", "DBPASS", "123456");
			mDbEmail.miMaxDatabaseThread = atoi(conf.GetPrivate("DB_EMAIL", "MAXDATABASETHREAD", "4").c_str());

			delete[] mDbLady;
			mDbLady = NULL;

			// [DB_%d]
			miDbCount = 0;
			list<string> listDbSpace;
			char domain[64] = {'\0'};
			int dbIndex = 0;
			for(dbIndex = 0; ; dbIndex++) {
				sprintf(domain, "DB_%d", dbIndex);
				if (!conf.HasSpace(domain)) {
					break;
				}

				int available = atoi(conf.GetPrivate(domain, "AVAILABLE", "0").c_str());
				if (available == 1) {
					miDbCount++;
					listDbSpace.push_back(domain);
				}
			}

			mDbLady = new DBSTRUCT[miDbCount];
			dbIndex = 0;
			for(list<string>::iterator iter = listDbSpace.begin();
				iter != listDbSpace.end();
				iter++)
			{
				string dbSpace = (*iter);
				if (!conf.HasSpace(dbSpace.c_str())) {
					break;
				}

				int available = atoi(conf.GetPrivate(dbSpace, "AVAILABLE", "0").c_str());
				if (available == 1) {
					mDbLady[dbIndex].mSpaceName = dbSpace;
					mDbLady[dbIndex].mHost = conf.GetPrivate(dbSpace, "DBHOST", "localhost");
					mDbLady[dbIndex].mPort = atoi(conf.GetPrivate(dbSpace, "DBPORT", "3306").c_str());
					mDbLady[dbIndex].mDbName = conf.GetPrivate(dbSpace, "DBNAME", "qpidnetwork_online");
					mDbLady[dbIndex].mUser = conf.GetPrivate(dbSpace, "DBUSER", "root");
					mDbLady[dbIndex].mPasswd = conf.GetPrivate(dbSpace, "DBPASS", "123456");
					mDbLady[dbIndex].miMaxDatabaseThread = atoi(conf.GetPrivate(dbSpace, "MAXDATABASETHREAD", "4").c_str());
					mDbLady[dbIndex].miSiteId = atoi(conf.GetPrivate(dbSpace, "SITEID", "-1").c_str());
					mDbLady[dbIndex].mSendStep = atoi(conf.GetPrivate(dbSpace, "SENDSTEP", "1").c_str());
					mDbLady[dbIndex].miOverValue = atoi(conf.GetPrivate(dbSpace, "OVERVALUE", "0").c_str());
					string defPaidRecv = conf.GetPrivate(dbSpace, "DEFAULT_PAID_MEM_RECV", "");
					mDbLady[dbIndex].mDefPaidRecv = atoi(defPaidRecv.c_str());
					string defFreeRecv = conf.GetPrivate(dbSpace, "DEFAULT_FREE_MEM_RECV", "");
					mDbLady[dbIndex].mDefFreeRecv = atoi(defFreeRecv.c_str());
					mDbLady[dbIndex].mDefPostfix = conf.GetPrivate(dbSpace, "DEFAULT_DBPOSTFIX", "");
					mDbLady[dbIndex].mMember = conf.GetPrivate(dbSpace, "MEMBER", "");

					char temp[64] = {'\0'};
					for (int k = 0; ; k++) {
						sprintf(temp, "C%d_REGEX", k);
						string regex = conf.GetPrivate(dbSpace, temp, "");
						if (!regex.empty()) {
							DBRECVSTRUCT dbRecv;
							dbRecv.mCondition = regex;

							sprintf(temp, "C%d_PAID_MEM_RECV", k);
							string paidManRecv = conf.GetPrivate(dbSpace, temp, defPaidRecv);
							dbRecv.mPaidRecv = atoi(paidManRecv.c_str());

							sprintf(temp, "C%d_FREE_MEM_RECV", k);
							string freeManRecv = conf.GetPrivate(dbSpace, temp, defFreeRecv);
							dbRecv.mFreeRecv = atoi(freeManRecv.c_str());

							sprintf(temp, "C%d_DBPOSTFIX", k);
							string postfix = conf.GetPrivate(dbSpace, temp, mDbLady[dbIndex].mDefPostfix);
							dbRecv.mPostfix = postfix;

							mDbLady[dbIndex].mRecvList.push_back(dbRecv);
						}
						else {
							break;
						}
					}

					dbIndex++;
				}
			}

			// LOG
			miLogLevel = atoi(conf.GetPrivate("LOG", "LOGLEVEL", "5").c_str());
			mLogDir = conf.GetPrivate("LOG", "LOGDIR", "log");
			miDebugMode = atoi(conf.GetPrivate("LOG", "DEBUGMODE", "0").c_str());

			// Reload config
			mClientTcpServer.SetHandleSize(miMaxMemoryCopy * miTimeout * miMaxQueryPerThread);

			bFlag = true;
		}
	}
	mConfigMutex.unlock();
	return bFlag;
}

void AdmirerSender::PrintConfig()
{
	string confLog("");
	char temp[64] = {0};

	// --- [BASE]
	confLog += "[BASE]";
	confLog += "\n";
	// miPort
	snprintf(temp, sizeof(temp), "%d", miPort);
	confLog += "miPort: ";
	confLog += temp;
	confLog += "\n";
	// miMaxClient
	snprintf(temp, sizeof(temp), "%d", miMaxClient);
	confLog += "miMaxClient: ";
	confLog += temp;
	confLog += "\n";
	// miMaxMemoryCopy
	snprintf(temp, sizeof(temp), "%d", miMaxMemoryCopy);
	confLog += "miMaxMemoryCopy: ";
	confLog += temp;
	confLog += "\n";
	// miMaxHandleThread
	snprintf(temp, sizeof(temp), "%d", miMaxHandleThread);
	confLog += "miMaxHandleThread: ";
	confLog += temp;
	confLog += "\n";
	// miMaxQueryPerThread
	snprintf(temp, sizeof(temp), "%d", miMaxQueryPerThread);
	confLog += "miMaxQueryPerThread: ";
	confLog += temp;
	confLog += "\n";
	// miTimeout
	snprintf(temp, sizeof(temp), "%d", miTimeout);
	confLog += "miTimeout: ";
	confLog += temp;
	confLog += "\n";
	// miStateTime
	snprintf(temp, sizeof(temp), "%d", miStateTime);
	confLog += "miStateTime: ";
	confLog += temp;
	confLog += "\n";
	// return
	confLog += "\n";

	// --- [DB]
	confLog += "[DB]";
	confLog += "\n";
	// mDbMan.mHost
	confLog += "mDbMan.mHost: ";
	confLog += mDbMan.mHost;
	confLog += "\n";
	// mDbMan.mPort
	snprintf(temp, sizeof(temp), "%d", mDbMan.mPort);
	confLog += "mDbMan.mPort: ";
	confLog += temp;
	confLog += "\n";
	// mDbMan.mDbName
	confLog += "mDbMan.mDbName: ";
	confLog += mDbMan.mDbName;
	confLog += "\n";
	// mDbMan.mUser
	confLog += "mDbMan.mUser: ";
	confLog += mDbMan.mUser;
	confLog += "\n";
	// mDbMan.mPasswd
	confLog += "mDbMan.mPasswd: ";
	confLog += mDbMan.mPasswd;
	confLog += "\n";
	// mDbMan.miMaxDatabaseThread
	snprintf(temp, sizeof(temp), "%d", mDbMan.miMaxDatabaseThread);
	confLog += "mDbMan.miMaxDatabaseThread: ";
	confLog += temp;
	confLog += "\n";
	// mDbMan.miSyncTime
	snprintf(temp, sizeof(temp), "%d", mDbMan.miSyncTime);
	confLog += "mDbMan.miSyncTime: ";
	confLog += temp;
	confLog += "\n";
	// return
	confLog += "\n";

	// --- [DB_EMAIL]
	confLog += "[DB_EMAIL]";
	confLog += "\n";
	// mDbEmail.mHost
	confLog += "mDbEmail.mHost: ";
	confLog += mDbEmail.mHost;
	confLog += "\n";
	// mDbEmail.mPort
	snprintf(temp, sizeof(temp), "%d", mDbEmail.mPort);
	confLog += "mDbEmail.mPort: ";
	confLog += temp;
	confLog += "\n";
	// mDbEmail.mDbName
	confLog += "mDbEmail.mDbName: ";
	confLog += mDbEmail.mDbName;
	confLog += "\n";
	// mDbEmail.mUser
	confLog += "mDbEmail.mUser: ";
	confLog += mDbEmail.mUser;
	confLog += "\n";
	// mDbEmail.mPasswd
	confLog += "mDbEmail.mPasswd: ";
	confLog += mDbEmail.mPasswd;
	confLog += "\n";
	// mDbEmail.miMaxDatabaseThread
	snprintf(temp, sizeof(temp), "%d", mDbEmail.miMaxDatabaseThread);
	confLog += "mDbEmail.miMaxDatabaseThread: ";
	confLog += temp;
	confLog += "\n";
	// return
	confLog += "\n";

	// --- [DB_%d]
	for (int dbIndex = 0; dbIndex < miDbCount; dbIndex++)
	{
		// space name
		confLog += "[";
		confLog += mDbLady[dbIndex].mSpaceName;
		confLog += "]";
		confLog += "\n";
		// mHost
		confLog += "mHost: ";
		confLog += mDbLady[dbIndex].mHost;
		confLog += "\n";
		// mPost
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].mPort);
		confLog += "mPost: ";
		confLog += temp;
		confLog += "\n";
		// mDbName
		confLog += "mDbName: ";
		confLog += mDbLady[dbIndex].mDbName;
		confLog += "\n";
		// mUser
		confLog += "mUser: ";
		confLog += mDbLady[dbIndex].mUser;
		confLog += "\n";
		// mPasswd
		confLog += "mPasswd: ";
		confLog += mDbLady[dbIndex].mPasswd;
		confLog += "\n";
		// miMaxDatabaseThread
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].miMaxDatabaseThread);
		confLog += "miMaxDatabaseThread: ";
		confLog += temp;
		confLog += "\n";
		// miSiteId
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].miSiteId);
		confLog += "miSiteId: ";
		confLog += temp;
		confLog += "\n";
		// mSendStep
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].mSendStep);
		confLog += "mSendStep: ";
		confLog += temp;
		confLog += "\n";
		// miOverValue
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].miOverValue);
		confLog += "miOverValue: ";
		confLog += temp;
		confLog += "\n";
		// mDefPaidRecv
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].mDefPaidRecv);
		confLog += "mDefPaidRecv: ";
		confLog += temp;
		confLog += "\n";
		// mDefFreeRecv
		snprintf(temp, sizeof(temp), "%d", mDbLady[dbIndex].mDefFreeRecv);
		confLog += "mDefFreeRecv: ";
		confLog += temp;
		confLog += "\n";
		// mDefPostfix
		confLog += "mDefPostfix: ";
		confLog += mDbLady[dbIndex].mDefPostfix;
		confLog += "\n";
		// mMember
		confLog += "mMember: ";
		confLog += mDbLady[dbIndex].mMember;
		confLog += "\n";

		// condition
		if (!mDbLady[dbIndex].mRecvList.empty())
		{
			confLog += "--------\n";
			for (DBRECVLIST::const_iterator iter = mDbLady[dbIndex].mRecvList.begin();
				iter != mDbLady[dbIndex].mRecvList.end();
				iter++)
			{
				// mCondition
				confLog += "mCondition: ";
				confLog += (*iter).mCondition;
				confLog += "\n";
				// mPaidRecv
				snprintf(temp, sizeof(temp), "%d", (*iter).mPaidRecv);
				confLog += "mPaidRecv: ";
				confLog += temp;
				confLog += "\n";
				// mFreeRecv
				snprintf(temp, sizeof(temp), "%d", (*iter).mFreeRecv);
				confLog += "mFreeRecv: ";
				confLog += temp;
				confLog += "\n";
				// mPostfix
				confLog += "mPostfix: ";
				confLog += (*iter).mPostfix;
				confLog += "\n";
				// return
				confLog += "----\n";
			}
			confLog += "--------\n";
		}

		// return
		confLog += "\n";
	}

	LogManager::GetLogManager()->Log(LOG_ERR_SYS, "AdmirerSender::PrintConfig()\n"
			"%s",
			confLog.c_str()
			);
}

bool AdmirerSender::IsRunning() {
	return mIsRunning;
}

/**
 * New request
 */
bool AdmirerSender::OnAccept(TcpServer *ts, int fd, char* ip) {
	return true;
}

void AdmirerSender::OnDisconnect(TcpServer *ts, int fd) {
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnDisconnect( "
			"tid : %d, "
			"fd : [%d], "
			"start "
			")",
			(int)syscall(SYS_gettid),
			fd
			);
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnDisconnect( "
			"tid : %d, "
			"fd : [%d], "
			"end "
			")",
			(int)syscall(SYS_gettid),
			fd
			);
}

void AdmirerSender::OnClose(TcpServer *ts, int fd)  {

}

void AdmirerSender::OnRecvMessage(TcpServer *ts, Message *m) {
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnRecvMessage( "
			"tid : %d, "
			"m->fd : [%d], "
			"start "
			")",
			(int)syscall(SYS_gettid),
			m->fd
			);
	Message *sm = ts->GetIdleMessageList()->PopFront();
	if( sm != NULL ) {
		sm->fd = m->fd;
		sm->wr = m->wr;
		int ret = -1;

		if( &mClientTcpServer == ts ) {
			// 外部服务请求
			mCountMutex.lock();
			mTotal++;
			mCountMutex.unlock();
			ret = HandleRecvMessage(m, sm);
			if( 0 != ret ) {
				// Process finish, send respond
				ts->SendMessageByQueue(sm);
			} else {
				// receive continue
				ts->GetIdleMessageList()->PushBack(sm);
			}
		}
	} else {
		LogManager::GetLogManager()->Log(
				LOG_WARNING,
				"AdmirerSender::OnRecvMessage( "
				"tid : %d, "
				"m->fd : [%d], "
				"No idle message can be use "
				")",
				(int)syscall(SYS_gettid),
				m->fd
				);
		// 断开连接
		ts->Disconnect(m->fd);
	}
	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"AdmirerSender::OnRecvMessage( "
			"tid : %d, "
			"m->fd : [%d], "
			"end "
			")",
			(int)syscall(SYS_gettid),
			m->fd
			);
}

void AdmirerSender::OnSendMessage(TcpServer *ts, Message *m) {
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnSendMessage( tid : %d, m->fd : [%d], start )", (int)syscall(SYS_gettid), m->fd);
	// 发送成功，断开连接
	ts->Disconnect(m->fd);
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnSendMessage( tid : %d, m->fd : [%d], end )", (int)syscall(SYS_gettid), m->fd);
}

void AdmirerSender::OnTimeoutMessage(TcpServer *ts, Message *m) {
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnTimeoutMessage( tid : %d, m->fd : [%d], start )", (int)syscall(SYS_gettid), m->fd);
	Message *sm = ts->GetIdleMessageList()->PopFront();
	if( sm != NULL ) {
		sm->fd = m->fd;
		sm->wr = m->wr;

		HandleTimeoutMessage(m, sm);
		// Process finish, send respond
		ts->SendMessageByQueue(sm);
	} else {
		LogManager::GetLogManager()->Log(
				LOG_WARNING,
				"AdmirerSender::OnTimeoutMessage( "
				"tid : %d, "
				"m->fd : [%d], "
				"No idle message can be use "
				")",
				(int)syscall(SYS_gettid),
				m->fd
				);
		// 断开连接
		ts->Disconnect(m->fd);
	}
	LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::OnTimeoutMessage( tid : %d, m->fd : [%d], end )", (int)syscall(SYS_gettid), m->fd);
}

int AdmirerSender::HandleRecvMessage(Message *m, Message *sm) {
	int ret = -1;
	int code = 200;
	char reason[16] = {"OK"};
	string param;

	Json::FastWriter writer;
	Json::Value rootSend;
	rootSend["ret"] = 0;

	if( m == NULL ) {
		return ret;
	}

	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::HandleRecvMessage( "
			"tid : %d, "
			"[收到请求], "
			"m->fd: [%d], "
			"request : \n%s\n"
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			m->buffer
			);

	DataHttpParser dataHttpParser;
	if ( DiffGetTickCount(m->starttime, GetTickCount()) < miTimeout * 1000 ) {
		if( m->buffer != NULL ) {
			ret = dataHttpParser.ParseData(m->buffer, m->len);
		}
	} else {
		param = writer.write(rootSend);
	}

	if( ret == 1 ) {
		ret = -1;
		const char* pPath = dataHttpParser.GetPath().c_str();
		HttpType type = dataHttpParser.GetType();

		LogManager::GetLogManager()->Log(
				LOG_WARNING,
				"AdmirerSender::HandleRecvMessage( "
				"tid : %d, "
				"[收到请求], "
				"pPath : %s "
				")",
				(int)syscall(SYS_gettid),
				pPath
				);

		if( type == GET ) {
			if( strcmp(pPath, "/SYNCLADYLIST") == 0 ) {
				// 增量获取发送女士
				const char* pSiteId = dataHttpParser.GetParam("SITEID").c_str();
				LogManager::GetLogManager()->Log(
						LOG_WARNING,
						"AdmirerSender::HandleRecvMessage( "
						"tid : %d, "
						"[收到请求, 增量获取发送女士], "
						"pSiteId : %s "
						")",
						(int)syscall(SYS_gettid),
						pSiteId
						);

				if( pSiteId != NULL ) {
					SyncLadyList(pSiteId);

					rootSend["ret"] = 1;
					ret = 1;

				}
				param = writer.write(rootSend);

			} else if( strcmp(pPath, "/GETAGENTSENDSTATUS") == 0 ) {
				const char* pAgentId = dataHttpParser.GetParam("AGENTID").c_str();
				LogManager::GetLogManager()->Log(
						LOG_WARNING,
						"AdmirerSender::HandleRecvMessage( "
						"tid : %d, "
						"[收到请求, 获取机构状态], "
						"pAgentId : %s "
						")",
						(int)syscall(SYS_gettid),
						pAgentId
						);

				if( pAgentId != NULL ) {
					Json::Value statusNode;
					GetAgentSendStatus(statusNode, (char*)pAgentId);

					rootSend["status"] = statusNode;
					rootSend["ret"] = 1;
					ret = 1;
				}

				param = writer.write(rootSend);

			} else if( strcmp(pPath, "/CLEARLETTERSENDLIST") == 0 ) {
				const char* pClearTime = dataHttpParser.GetParam("CLEARTIME").c_str();
				LogManager::GetLogManager()->Log(
						LOG_WARNING,
						"AdmirerSender::HandleRecvMessage( "
						"tid : %d, "
						"[收到请求, 清空发送女士], "
						"pClearTime : %s "
						")",
						(int)syscall(SYS_gettid),
						pClearTime
						);

				// 处理
				long long iClearTime = 0;
				if( pClearTime != NULL ) {
					iClearTime = atoll(pClearTime);
				}
				// 标记所有信件为已经处理
				ClearLetterSendList(iClearTime);
				// 清空男士内存表
				mDBManager.CleanManTable();
				mDBManager.SyncForce();

				// 回复
				rootSend["ret"] = 1;
				ret = 1;
				param = writer.write(rootSend);

			} else {
				code = 404;
				sprintf(reason, "Not Found");
				param = "404 Not Found";
			}

		} else {
			code = 404;
			sprintf(reason, "Not Found");
			param = "404 Not Found";
		}
	} else {
		param = writer.write(rootSend);
	}

	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::HandleRecvMessage( "
			"tid : %d, "
			"[收到请求, 发送返回], "
			"m->fd: [%d], "
			"ret : %d, "
			"respond : \n%s\n"
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			ret,
			param.c_str()
			);

	snprintf(sm->buffer, MAX_BUFFER_LEN - 1, "HTTP/1.1 %d %s\r\nContext-Length:%d\r\n\r\n%s",
			code,
			reason,
			(int)param.length(),
			param.c_str()
			);
	sm->len = strlen(sm->buffer);

	return ret;
}

int AdmirerSender::HandleTimeoutMessage(Message *m, Message *sm) {
	int ret = -1;

	Json::FastWriter writer;
	Json::Value rootSend, womanListNode, womanNode;

	if( m == NULL ) {
		return ret;
	}
	printf("#AdmirerSender::HandleTimeoutMessage( buffer : %s )", m->buffer);
	LogManager::GetLogManager()->Log(
			LOG_WARNING,
			"AdmirerSender::HandleTimeoutMessage( "
			"tid : %d, "
			"m->fd: [%d] "
			")",
			(int)syscall(SYS_gettid),
			m->fd
			);

	string param = writer.write(rootSend);

	snprintf(sm->buffer, MAX_BUFFER_LEN - 1, "HTTP/1.1 200 ok\r\nContext-Length:%d\r\n\r\n%s",
			(int)param.length(), param.c_str());
	sm->len = strlen(sm->buffer);

	return ret;
}

void AdmirerSender::SyncLadyList(
		const char* siteId
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::SyncLadyList( "
			"tid : %d, "
			"siteId : %s "
			")",
			(int)syscall(SYS_gettid),
			siteId
			);

	mDBManager.SyncLadyForce(atoi(siteId));
}

void AdmirerSender::GetAgentSendStatus(
		Json::Value& statusNode,
		const char* agentId
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::GetAgentSendStatus( "
			"tid : %d, "
			"agentId : %s, "
			"start "
			")",
			(int)syscall(SYS_gettid),
			agentId
			);
	bool bFlag = false;

	mAgentMap.Lock();
	AgentMap::iterator itr = mAgentMap.Find(agentId);
	if( itr != mAgentMap.End() ) {
		if( itr->second > 0 ) {
			bFlag = true;
		}
	}
	mAgentMap.Unlock();

	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::GetAgentSendStatus( "
			"tid : %d, "
			"agentId : %s, "
			"end "
			")",
			(int)syscall(SYS_gettid),
			agentId
			);

	statusNode = (int)bFlag;
}

void AdmirerSender::ClearLetterSendList(
		long long timestamp
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::ClearLetterSendList( "
			"tid : %d "
			"timestamp : %lld "
			")",
			(int)syscall(SYS_gettid),
			timestamp
			);
//	bool bFlag = false;

	// 标记数据库信件为已完成
	mDBManager.SetAllLetterDelete();

	// 清空内存信件(三期)
	mLadyLetterSendListMap.Lock();
	for(LadyLetterSendListMap::iterator itr = mLadyLetterSendListMap.Begin(); itr != mLadyLetterSendListMap.End();) {
		ILetterSender* sender;
		while( (sender = itr->second.PopFront()) != NULL ) {
			delete sender;
		}

		mLadyLetterSendListMap.Erase(itr++);
	}
	mLadyLetterSendListMap.Unlock();

//	// 清空内存信件(二期)
//	ILetterSender* sender;
//	while( (sender = mLadyLetterList.PopFront()) != NULL ) {
//		delete sender;
//	}

	mAgentMap.Lock();
	mAgentMap.Clear();
	mAgentMap.Unlock();

}

void AdmirerSender::OnSyncLady(
		DBManager* pDBManager,
		const Lady& item
		) {
	// 增加女士到机构
//	AddLadyToAgent(item.mAgentId);

	// 生成信件
	ILetterSender *sender = new LadyDBLetterSender(item, pDBManager);

//	// 增加信件(二期)
//	mLadyLetterList.PushBack(sender);

	// 增加信件到女士(三期)
	mLadyLetterSendListMap.Lock();
	LadyLetterSendListMap::iterator itr = mLadyLetterSendListMap.Find(item.mWomanId);
	if( itr != mLadyLetterSendListMap.End() ) {
		itr->second.PushBack(sender);

	} else {
		LetterSendList ladyLetterList;
		ladyLetterList.PushBack(sender);
		mLadyLetterSendListMap.Insert(item.mWomanId, ladyLetterList);
	}
	mLadyLetterSendListMap.Unlock();
}

void AdmirerSender::OnGetLady(
		DBManager* pDBManager,
		const Lady& item
		) {
//	// 发送信件(三期)
//	LogManager::GetLogManager()->Log(
//			LOG_STAT,
//			"AdmirerSender::OnGetLady( "
//			"tid : %d, "
//			"womanid : %s, "
//			"siteid : %d, "
//			"sort : %d "
//			")",
//			(int)syscall(SYS_gettid),
//			item.mWomanId.c_str(),
//			item.mSiteId,
//			item.iSort
//			);
//
//	mLadyLetterSendListMap.Lock();
//	LadyLetterSendListMap::iterator itr = mLadyLetterSendListMap.Find(item.mWomanId);
//	if( itr != mLadyLetterSendListMap.End() ) {
//		ILetterSender* sender = itr->second.PopFront();
//		if( sender != NULL ) {
//			unsigned int iHandleTime = GetTickCount();
//
//			bool bFlag = sender->CanSendLetter();
//			if( bFlag ) {
//				// Send letter
//				bFlag = sender->SendLetter();
//
//				if( !bFlag ) {
//					// Check error code
//					switch( sender->GetErrorCode() ) {
//					case SEND_FIAL_TOO_MORE_TIME: {
//						// Can't send any more
//
//					}break;
//					default:{
//						bFlag = true;
//
//					}break;
//					}
//				}
//
//			}
//
//			if( bFlag ) {
//				// Push back into send list
//				itr->second.PushBack(sender);
//
//			} else {
//				// Can't send any more
//				sender->FinishLetter();
//
//				// Remove sender from Agent
////				RemoveLadyFromAgent(item.mAgentId);
//
//				// Drop sender
//				delete sender;
//				sender = NULL;
//
//				if( itr->second.Empty() ) {
//					// 在内存表更新女士能否收信(三期)
//					mDBManager.UpdateLadyCanSend(itr->first, false);
//
//					// 删除女士(三期)
//					mLadyLetterSendListMap.Erase(itr);
//				}
//
//			}
//
//			iHandleTime =  GetTickCount() - iHandleTime;
//
//			LogManager::GetLogManager()->Log(
//					LOG_STAT,
//					"AdmirerSender::OnGetLady( "
//					"tid : %d, "
//					"iHandleTime : %u ms "
//					")",
//					(int)syscall(SYS_gettid),
//					iHandleTime
//					);
//
//			LogManager::GetLogManager()->Log(
//					LOG_STAT,
//					"AdmirerSender::OnGetLady( "
//					"tid : %d "
//					"######################################## "
//					")",
//					(int)syscall(SYS_gettid)
//					);
//
//			iHandleTime = MAX(50 * 1000, iHandleTime);
//			iHandleTime = MIN(1000 * 1000, iHandleTime);
//
//			usleep(iHandleTime);
//
//		} else {
//			// Noting to send
//			sleep(1);
//
//		}
//
//	}
//	mLadyLetterSendListMap.Unlock();

}

void AdmirerSender::AddLadyToAgent(const string& agentId) {
	int iCount = 1;
	mAgentMap.Lock();
	AgentMap::iterator itr = mAgentMap.Find(agentId);
	if( itr != mAgentMap.End() ) {
		iCount = ++(itr->second);
	} else {
		mAgentMap.Insert(agentId, (int)1);
	}
	mAgentMap.Unlock();

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"AdmirerSender::AddLadyToAgent( "
			"tid : %d, "
			"agentId: %s, "
			"iCount : %d "
			")",
			(int)syscall(SYS_gettid),
			agentId.c_str(),
			iCount
			);
}

void AdmirerSender::RemoveLadyFromAgent(const string& agentId) {
	int iCount = 0;
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::RemoveLadyFromAgent( "
			"tid : %d, "
			"agentId: %s "
			")",
			(int)syscall(SYS_gettid),
			agentId.c_str()
			);

	mAgentMap.Lock();
	AgentMap::iterator itr = mAgentMap.Find(agentId);
	if( itr != mAgentMap.End() ) {
		iCount = --(itr->second);
		if( itr->second == 0 ) {
			mAgentMap.Erase(itr);
		}
	}
	mAgentMap.Unlock();

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"AdmirerSender::RemoveLadyFromAgent( "
			"tid : %d, "
			"agentId: %s, "
			"iCount : %d "
			")",
			(int)syscall(SYS_gettid),
			agentId.c_str(),
			iCount
			);
}

void AdmirerSender::StateRunnableHandle() {
	unsigned int iCount = 0;
	unsigned int iStateTime = miStateTime;

	while( IsRunning() ) {
		if ( iCount < iStateTime ) {
			iCount++;
		} else {
			iCount = 0;

			LogManager::GetLogManager()->Log(LOG_WARNING,
					"AdmirerSender::StateRunnable( "
					"tid : %d, "
					"[内存待发送信件女士数量] : %d, "
					"[内存允许收信男士数量] : {%s} "
					")",
					(int)syscall(SYS_gettid),
					mLadyLetterSendListMap.Size(),
					mDBManager.GetManCanRecvCountString().c_str()
					);

			iStateTime = miStateTime;
		}
		sleep(1);
	}
}

void AdmirerSender::SendRunnableHandle() {
	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"AdmirerSender::SendRunnableHandle( "
			"tid : %d "
			")",
			(int)syscall(SYS_gettid)
			);

	list<Lady> ladyList;
	while( IsRunning() ) {
		// 发送信件(三期)
		if( !mDBManager.GetLadyList(ladyList) ) {
			// Noting to send
			sleep(1);

		} else {
			for(list<Lady>::iterator itrLady = ladyList.begin(); itrLady != ladyList.end(); itrLady++) {
				Lady item = *itrLady;

				// 发送信件(三期)
				LogManager::GetLogManager()->Log(
						LOG_STAT,
						"AdmirerSender::SendRunnableHandle( "
						"tid : %d, "
						"womanid : %s, "
						"siteid : %d, "
						"sort : %d "
						")",
						(int)syscall(SYS_gettid),
						item.mWomanId.c_str(),
						item.mSiteId,
						item.iSort
						);

				mLadyLetterSendListMap.Lock();
				LadyLetterSendListMap::iterator itr = mLadyLetterSendListMap.Find(item.mWomanId);
				if( itr != mLadyLetterSendListMap.End() ) {
					ILetterSender* sender = itr->second.PopFront();
					if( sender != NULL ) {
						unsigned int iHandleTime = GetTickCount();

						bool bFlag = sender->CanSendLetter();
						if( bFlag ) {
							// Send letter
							bFlag = sender->SendLetter();

							if( !bFlag ) {
								// Check error code
								switch( sender->GetErrorCode() ) {
								case SEND_FIAL_TOO_MORE_TIME: {
									// Can't send any more

								}break;
								default:{
									bFlag = true;

								}break;
								}
							}

						}

						if( bFlag ) {
							// Push back into send list
							itr->second.PushBack(sender);

						} else {
							// Can't send any more
							sender->FinishLetter();

							// Remove sender from Agent
			//				RemoveLadyFromAgent(item.mAgentId);

							// Drop sender
							delete sender;
							sender = NULL;

							if( itr->second.Empty() ) {
								// 在内存表更新女士能否收信(三期)
								mDBManager.UpdateLadyCanSend(itr->first, false);

								// 删除女士(三期)
								mLadyLetterSendListMap.Erase(itr);
							}

						}

						iHandleTime =  GetTickCount() - iHandleTime;

						LogManager::GetLogManager()->Log(
								LOG_STAT,
								"AdmirerSender::SendRunnableHandle( "
								"tid : %d, "
								"iHandleTime : %u ms "
								")",
								(int)syscall(SYS_gettid),
								iHandleTime
								);

						LogManager::GetLogManager()->Log(
								LOG_STAT,
								"AdmirerSender::SendRunnableHandle( "
								"tid : %d "
								"######################################## "
								")",
								(int)syscall(SYS_gettid)
								);

						iHandleTime = MAX(50 * 1000, iHandleTime);
						iHandleTime = MIN(1000 * 1000, iHandleTime);

						usleep(iHandleTime);

					} else {
						// Noting to send
						sleep(1);

					}

				}
				mLadyLetterSendListMap.Unlock();
			}
		}
	}
}
