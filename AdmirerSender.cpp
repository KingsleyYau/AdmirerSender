/*
 * AdmirerSender.cpp
 *
 *  Created on: 2015-1-13
 *      Author: Max.Chiu
 *      Email: Kingsleyyau@gmail.com
 */

#include "AdmirerSender.h"
#include "TimeProc.hpp"
#include "LadyDBLetterSender.h"

#include <sys/syscall.h>

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
	bFlag = mDBManager.Init(
			mDbMan,
			miDbCount,
			mDbLady
			);
	mDBManager.SetDBManagerCallback(this);

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
			miDbCount = atoi(conf.GetPrivate("DB", "DB_COUNT", "0").c_str());

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
					ret = 1;
				}
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

	mDBManager.SyncLadyList(atoi(siteId));
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
			"agentId : %s "
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

	statusNode = (int)bFlag;
}

void AdmirerSender::OnGetLady(
		DBManager* pDBManager,
		const Lady& item
		) {
	ILetterSender *sender = new LadyDBLetterSender(item, pDBManager);

	// 女士到 机构
	AddLadyToAgent(item.mAgentId);

	mLadyLetterList.PushBack(sender);
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
			LOG_MSG,
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
			"AgentId: %s "
			")",
			(int)syscall(SYS_gettid),
			agentId.c_str()
			);

	mAgentMap.Lock();
	AgentMap::iterator itr = mAgentMap.Find(agentId);
	if( itr != mAgentMap.End() ) {
		iCount = --(itr->second);
		if( itr->second == 0 ) {
			mAgentMap.Erase(agentId);
		}
	}
	mAgentMap.Unlock();

	LogManager::GetLogManager()->Log(
			LOG_MSG,
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
					"AdmirerSender::StateRunnable( tid : %d, AdmirerSender::mLadyLetterList : %d )",
					(int)syscall(SYS_gettid),
					(MessageList*) mLadyLetterList.Size()
					);
			LogManager::GetLogManager()->Log(LOG_WARNING,
					"AdmirerSender::StateRunnable( "
					"tid : %d, "
					"iTotal : %u, "
					"iHit : %u, "
					"iSecondTotal : %.1lf, "
					"iSecondHit : %.1lf, "
					"iResponed : %.1lf, "
					"iStateTime : %u "
					")",
					(int)syscall(SYS_gettid),
					iTotal,
					iHit,
					iSecondTotal,
					iSecondHit,
					iResponed,
					iStateTime
					);
			LogManager::GetLogManager()->Log(LOG_WARNING,
					"AdmirerSender::StateRunnable( "
					"tid : %d, "
					"过去%u秒共收到%u个请求, "
					"成功处理%u个请求, "
					"平均收到%.1lf个/秒, "
					"平均处理%.1lf个/秒, "
					"平均响应时间%.1lf毫秒/个"
					")",
					(int)syscall(SYS_gettid),
					iStateTime,
					iTotal,
					iHit,
					iSecondTotal,
					iSecondHit,
					iResponed
					);

			iStateTime = miStateTime;
		}
		sleep(1);
	}
}

void AdmirerSender::SendRunnableHandle() {
	LogManager::GetLogManager()->Log(LOG_STAT,
			"AdmirerSender::SendRunnableHandle( "
			"tid : %d "
			")",
			(int)syscall(SYS_gettid)
			);

	while( IsRunning() ) {
		ILetterSender* sender = mLadyLetterList.PopFront();
		if( sender != NULL ) {
			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"AdmirerSender::SendRunnableHandle( "
					"tid : %d, "
					"start "
					")",
					(int)syscall(SYS_gettid)
					);

			unsigned int iHandleTime = GetTickCount();

			if( sender->CanSendLetter() ) {
				// Send letter
				bool bFlag = sender->SendLetter();

				if( !bFlag ) {
					// Check error code
					switch( sender->GetErrorCode() ) {
					case SEND_FIAL_TOO_MORE_TIME:{
						// Remove letter from Agent
						RemoveLadyFromAgent(sender->GetAgentId());

						// Drop sender
						delete sender;

						continue;

					}break;
					default:break;
					}
				}

				// Push back into send list
				mLadyLetterList.PushBack(sender);

			} else {
				// Remove sender from Agent
				RemoveLadyFromAgent(sender->GetAgentId());

				// Drop sender
				delete sender;
			}

			iHandleTime =  GetTickCount() - iHandleTime;

			LogManager::GetLogManager()->Log(
					LOG_STAT,
					"AdmirerSender::SendRunnableHandle( "
					"tid : %d, "
					"iHandleTime : %u ms, "
					"end "
					")",
					(int)syscall(SYS_gettid),
					iHandleTime
					);

			sleep(1);
		} else {
			// Noting to send
			sleep(1);
		}
	}
}