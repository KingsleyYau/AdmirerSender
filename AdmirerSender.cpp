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
}

AdmirerSender::~AdmirerSender() {
	// TODO Auto-generated destructor stub
	if( mpStateRunnable ) {
		delete mpStateRunnable;
	}

	if( mpSendRunnable ) {
		delete mpSendRunnable;
	}
}

void AdmirerSender::Run(const string& config) {
	if( config.length() > 0 ) {
		mConfigFile = config;

		// Reload config
		if( Reload() ) {
			if( miDebugMode == 1 ) {
				LogManager::LogSetFlushBuffer(0);
			} else {
				LogManager::LogSetFlushBuffer(5 * BUFFER_SIZE_1K * BUFFER_SIZE_1K);
			}

			Run();
		} else {
			printf("# Match Server can not load config file exit. \n");
		}

	} else {
		printf("# No config file can be use exit. \n");
	}
}

void AdmirerSender::Run() {
	/* log system */
	LogManager::GetLogManager()->Start(1000, miLogLevel, mLogDir);
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::Run( "
			"miPort : %d, "
			"miMaxClient : %d, "
			"miMaxMemoryCopy : %d, "
			"miMaxHandleThread : %d, "
			"miMaxQueryPerThread : %d, "
			"miTimeout : %d, "
			"miStateTime, %d, "
			"miDbCount : %d, "
			"miLogLevel : %d, "
			"mlogDir : %s "
			")",
			miPort,
			miMaxClient,
			miMaxMemoryCopy,
			miMaxHandleThread,
			miMaxQueryPerThread,
			miTimeout,
			miStateTime,
			miDbCount,
			miLogLevel,
			mLogDir.c_str()
			);

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
		return;
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
		return;
	}

	/* start send thread */
	mpSendThread = new KThread(mpSendRunnable);
	if( mpSendThread->start() != 0 ) {
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Create send thread OK )");
	} else {
		printf("# Admirer Sender can not create send thread exit. \n");
		return;
	}

	mpStateThread = new KThread(mpStateRunnable);
	if( mpStateThread->start() != 0 ) {
		LogManager::GetLogManager()->Log(LOG_STAT, "AdmirerSender::Run( Create state thread OK )");
	} else {
		printf("# Admirer Sender can not create state thread exit. \n");
		return;
	}

	mDBManager.SyncForce();
	for(int i = 0; i < miDbCount; i++) {
		mDBManager.SyncLadyForce(mDbLady[i].miSiteId);
	}

	printf("# AdmirerSender start OK. \n");
	LogManager::GetLogManager()->Log(LOG_WARNING, "AdmirerSender::Run( Init OK )");

	while( true ) {
		/* do nothing here */
		sleep(5);
	}
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
			miDbCount = atoi(conf.GetPrivate("DB", "DB_COUNT", "0").c_str());

			// [DB_EMAIL]
			mDbEmail.mHost = conf.GetPrivate("DB_EMAIL", "DBHOST", "localhost");
			mDbEmail.mPort = atoi(conf.GetPrivate("DB_EMAIL", "DBPORT", "3306").c_str());
			mDbEmail.mDbName = conf.GetPrivate("DB_EMAIL", "DBNAME", "qpidnetwork_online");
			mDbEmail.mUser = conf.GetPrivate("DB_EMAIL", "DBUSER", "root");
			mDbEmail.mPasswd = conf.GetPrivate("DB_EMAIL", "DBPASS", "123456");
			mDbEmail.miMaxDatabaseThread = atoi(conf.GetPrivate("DB_EMAIL", "MAXDATABASETHREAD", "4").c_str());

			char domain[4] = {'\0'};
			for(int i = 0; i < miDbCount; i++) {
				sprintf(domain, "DB_%d", i);
				mDbLady[i].mHost = conf.GetPrivate(domain, "DBHOST", "localhost");
				mDbLady[i].mPort = atoi(conf.GetPrivate(domain, "DBPORT", "3306").c_str());
				mDbLady[i].mDbName = conf.GetPrivate(domain, "DBNAME", "qpidnetwork_online");
				mDbLady[i].mUser = conf.GetPrivate(domain, "DBUSER", "root");
				mDbLady[i].mPasswd = conf.GetPrivate(domain, "DBPASS", "123456");
				mDbLady[i].miMaxDatabaseThread = atoi(conf.GetPrivate(domain, "MAXDATABASETHREAD", "4").c_str());
				mDbLady[i].miSiteId = atoi(conf.GetPrivate(domain, "SITEID", "-1").c_str());
				mDbLady[i].miOverValue = atoi(conf.GetPrivate(domain, "OVERVALUE", "0").c_str());
				mDbLady[i].mPostfix = conf.GetPrivate(domain, "DBPOSTFIX", "");
			}

			// LOG
			miLogLevel = atoi(conf.GetPrivate("LOG", "LOGLEVEL", "5").c_str());
			mLogDir = conf.GetPrivate("LOG", "LOGDIR", "log");
			miDebugMode = atoi(conf.GetPrivate("LOG", "DEBUGMODE", "0").c_str());

			// Reload config
			mClientTcpServer.SetHandleSize(miMaxMemoryCopy * miTimeout * miMaxQueryPerThread);

			LogManager::GetLogManager()->Log(
					LOG_WARNING,
					"AdmirerSender::Reload( "
					"miPort : %d, "
					"miMaxClient : %d, "
					"miMaxMemoryCopy : %d, "
					"miMaxHandleThread : %d, "
					"miMaxQueryPerThread : %d, "
					"miTimeout : %d, "
					"miStateTime, %d, "
					"miDbCount : %d, "
					"miLogLevel : %d, "
					"mlogDir : %s "
					")",
					miPort,
					miMaxClient,
					miMaxMemoryCopy,
					miMaxHandleThread,
					miMaxQueryPerThread,
					miTimeout,
					miStateTime,
					miDbCount,
					miLogLevel,
					mLogDir.c_str()
					);

			bFlag = true;
		}
	}
	mConfigMutex.unlock();
	return bFlag;
}

bool AdmirerSender::IsRunning() {
	return mIsRunning;
}

/**
 * New request
 */
bool AdmirerSender::OnAccept(TcpServer *ts, Message *m) {
	return true;
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
				mCountMutex.lock();
				mResponed += sm->totaltime;
				if( ret == 1 ) {
					mHit++;
				}
				mCountMutex.unlock();

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

		mCountMutex.lock();
		mTotal++;
		mResponed += sm->totaltime;
		mCountMutex.unlock();

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

/**
 * OnDisconnect
 */
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
		const char* pPath = dataHttpParser.GetPath();
		HttpType type = dataHttpParser.GetType();

		LogManager::GetLogManager()->Log(
				LOG_STAT,
				"AdmirerSender::HandleRecvMessage( "
				"tid : %d, "
				"m->fd: [%d], "
				"type : %d, "
				"pPath : %s "
				")",
				(int)syscall(SYS_gettid),
				m->fd,
				type,
				pPath
				);

		if( type == GET ) {
			if( strcmp(pPath, "/SYNCLADYLIST") == 0 ) {
				// 增量获取发送女士
				const char* pSiteId = dataHttpParser.GetParam("SITEID");
				if( pSiteId != NULL ) {
					SyncLadyList(pSiteId, m);

					rootSend["ret"] = 1;
					ret = 1;

				}
				param = writer.write(rootSend);

			} else if( strcmp(pPath, "/GETAGENTSENDSTATUS") == 0 ) {
				const char* pAgentId = dataHttpParser.GetParam("AGENTID");
				if( pAgentId != NULL ) {
					Json::Value statusNode;
					GetAgentSendStatus(statusNode, (char*)pAgentId, m);

					rootSend["status"] = statusNode;
					rootSend["ret"] = 1;
					ret = 1;
				}
				param = writer.write(rootSend);

			} else if( strcmp(pPath, "/CLEARLETTERSENDLIST") == 0 ) {
				ClearLetterSendList(m);
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
	}

	sm->totaltime = GetTickCount() - m->starttime;
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::HandleRecvMessage( "
			"tid : %d, "
			"m->fd: [%d], "
			"iTotaltime : %u ms, "
			"ret : %d "
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			sm->totaltime,
			ret
			);

	snprintf(sm->buffer, MAXLEN - 1, "HTTP/1.1 %d %s\r\nContext-Length:%d\r\n\r\n%s",
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

	sm->totaltime = GetTickCount() - m->starttime;
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::HandleTimeoutMessage( "
			"tid : %d, "
			"m->fd: [%d], "
			"iTotaltime : %u ms "
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			sm->totaltime
			);

	string param = writer.write(rootSend);

	snprintf(sm->buffer, MAXLEN - 1, "HTTP/1.1 200 ok\r\nContext-Length:%d\r\n\r\n%s",
			(int)param.length(), param.c_str());
	sm->len = strlen(sm->buffer);

	return ret;
}

void AdmirerSender::SyncLadyList(
		const char* siteId,
		Message *m
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::SyncLadyList( "
			"tid : %d, "
			"m->fd: [%d], "
			"siteId : %s "
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			siteId
			);

	mDBManager.SyncLadyForce(atoi(siteId));
}

void AdmirerSender::GetAgentSendStatus(
		Json::Value& statusNode,
		const char* agentId,
		Message *m
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::GetAgentSendStatus( "
			"tid : %d, "
			"m->fd: [%d], "
			"agentId : %s, "
			"start "
			")",
			(int)syscall(SYS_gettid),
			m->fd,
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
			"m->fd: [%d], "
			"agentId : %s, "
			"end "
			")",
			(int)syscall(SYS_gettid),
			m->fd,
			agentId
			);

	statusNode = (int)bFlag;
}

void AdmirerSender::ClearLetterSendList(
		Message *m
		) {
	LogManager::GetLogManager()->Log(
			LOG_MSG,
			"AdmirerSender::ClearLetterSendList( "
			"tid : %d, "
			"m->fd: [%d] "
			")",
			(int)syscall(SYS_gettid),
			m->fd
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
	// 发送信件(三期)
	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"AdmirerSender::OnGetLady( "
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
					"AdmirerSender::OnGetLady( "
					"tid : %d, "
					"iHandleTime : %u ms "
					")",
					(int)syscall(SYS_gettid),
					iHandleTime
					);

			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"AdmirerSender::OnGetLady( "
					"tid : %d "
					"######################################## "
					")",
					(int)syscall(SYS_gettid)
					);

			iHandleTime = MAX(50, iHandleTime);
			iHandleTime = MIN(1000, iHandleTime);

			usleep(iHandleTime);

		} else {
			// Noting to send
			sleep(1);

		}

	}
	mLadyLetterSendListMap.Unlock();

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

	unsigned int iTotal = 0;
	double iSecondTotal = 0;

	unsigned int iHit = 0;
	double iSecondHit = 0;

	double iResponed = 0;

	unsigned int iStateTime = miStateTime;

	while( IsRunning() ) {
		if ( iCount < iStateTime ) {
			iCount++;
		} else {
			iCount = 0;
			iSecondTotal = 0;
			iSecondHit = 0;
			iResponed = 0;

			mCountMutex.lock();
			iTotal = mTotal;
			iHit = mHit;

			if( iStateTime != 0 ) {
				iSecondTotal = 1.0 * iTotal / iStateTime;
				iSecondHit = 1.0 * iHit / iStateTime;
			}
			if( iTotal != 0 ) {
				iResponed = 1.0 * mResponed / iTotal;
			}

			mHit = 0;
			mTotal = 0;
			mResponed = 0;
			mCountMutex.unlock();

//			LogManager::GetLogManager()->Log(LOG_WARNING,
//					"AdmirerSender::StateRunnable( tid : %d, TcpServer::GetHandleMessageList() : %d )",
//					(int)syscall(SYS_gettid),
//					(MessageList*) mClientTcpServer.GetHandleMessageList()->Size()
//					);
			LogManager::GetLogManager()->Log(LOG_WARNING,
					"AdmirerSender::StateRunnable( tid : %d, AdmirerSender::mLadyLetterSendListMap : %d )",
					(int)syscall(SYS_gettid),
					mLadyLetterSendListMap.Size()
					);
//			LogManager::GetLogManager()->Log(LOG_WARNING,
//					"AdmirerSender::StateRunnable( "
//					"tid : %d, "
//					"iTotal : %u, "
//					"iHit : %u, "
//					"iSecondTotal : %.1lf, "
//					"iSecondHit : %.1lf, "
//					"iResponed : %.1lf, "
//					"iStateTime : %u "
//					")",
//					(int)syscall(SYS_gettid),
//					iTotal,
//					iHit,
//					iSecondTotal,
//					iSecondHit,
//					iResponed,
//					iStateTime
//					);
//			LogManager::GetLogManager()->Log(LOG_WARNING,
//					"AdmirerSender::StateRunnable( "
//					"tid : %d, "
//					"过去%u秒共收到%u个请求, "
//					"成功处理%u个请求, "
//					"平均收到%.1lf个/秒, "
//					"平均处理%.1lf个/秒, "
//					"平均响应时间%.1lf毫秒/个"
//					")",
//					(int)syscall(SYS_gettid),
//					iStateTime,
//					iTotal,
//					iHit,
//					iSecondTotal,
//					iSecondHit,
//					iResponed
//					);

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

	while( IsRunning() ) {
		// 发送信件(三期)
		if( !mDBManager.GetLadyList() ) {
			// Noting to send
			sleep(1);
		}

//		// 发送信件(二期)
//		ILetterSender* sender = mLadyLetterList.PopFront();
//		if( sender != NULL ) {
//			LogManager::GetLogManager()->Log(
//					LOG_STAT,
//					"AdmirerSender::SendRunnableHandle( "
//					"tid : %d, "
//					"start "
//					")",
//					(int)syscall(SYS_gettid)
//					);
//
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
//					}break;
//					default:{
//						bFlag = true;
//					}break;
//					}
//				}
//
//			}
//
//			if( bFlag ) {
//				// Push back into send list
//				mLadyLetterList.PushBack(sender);
//
//			} else {
//				// Can't send any more
//				sender->FinishLetter();
//
//				// Remove sender from Agent
//				RemoveLadyFromAgent(sender->GetAgentId());
//
//				// Drop sender
//				delete sender;
//				sender = NULL;
//			}
//
//			iHandleTime =  GetTickCount() - iHandleTime;
//
//			LogManager::GetLogManager()->Log(
//					LOG_STAT,
//					"AdmirerSender::SendRunnableHandle( "
//					"tid : %d, "
//					"iHandleTime : %u ms, "
//					"end "
//					")",
//					(int)syscall(SYS_gettid),
//					iHandleTime
//					);
//
//			LogManager::GetLogManager()->Log(
//					LOG_STAT,
//					"AdmirerSender::SendRunnableHandle( "
//					"tid : %d "
//					"######################################## "
//					")",
//					(int)syscall(SYS_gettid)
//					);
//
//			iHandleTime = MAX(50, iHandleTime);
//			iHandleTime = MIN(1000, iHandleTime);
//
//			usleep(iHandleTime);
//
//		} else {
//			// Noting to send
//			sleep(1);
//		}
	}
}
