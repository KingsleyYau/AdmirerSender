/*
 * AdmirerSender.h
 *
 *  Created on: 2015-1-13
 *      Author: Max.Chiu
 *      Email: Kingsleyyau@gmail.com
 */

#ifndef AdmirerSender_H_
#define AdmirerSender_H_

#define VERSION_STRING "1.1.9"

#include <common/MessageList.h>
#include "TcpServer.h"
#include "DBManager.h"
#include "DataHttpParser.h"
#include "ILetterSender.h"
#include "LadyDBLetterSender.h"

#include <common/ConfFile.hpp>
#include <common/TimeProc.hpp>
#include <common/KSafeMap.h>
#include <json/json.h>

#include <sys/syscall.h>

typedef KSafeMap<string, int> AgentMap;
typedef KSafeList<ILetterSender*> LetterSendList;
typedef KSafeMap<string, LetterSendList> LadyLetterSendListMap;

class StateRunnable;
class SendLetterRunnable;
class AdmirerSender : public TcpServerObserver, DBManagerCallback {
public:
	AdmirerSender();
	virtual ~AdmirerSender();

	bool Run(const string& config);
	bool Run();
	bool Reload();
	bool IsRunning();

	/*
	 * Implement from TcpServerObserver
	 */
	/**
	 * TcpServer回调
	 */
	bool OnAccept(TcpServer *ts, int fd, char* ip);
	void OnRecvMessage(TcpServer *ts, Message *m);
	void OnSendMessage(TcpServer *ts, Message *m);
	void OnDisconnect(TcpServer *ts, int fd);
	void OnClose(TcpServer *ts, int fd);
	void OnTimeoutMessage(TcpServer *ts, Message *m);

	/**
	 * Implement from DBManager
	 */
	void OnSyncLady(
			DBManager* pDBManager,
			const Lady& item
			);
	void OnGetLady(
			DBManager* pDBManager,
			const Lady& item
			);

	/**
	 * 统计线程处理
	 */
	void StateRunnableHandle();

	/**
	 * 发送线程处理
	 */
	void SendRunnableHandle();

	/**
	 * 在机构(增加/删除)女士
	 */
	void AddLadyToAgent(const string& agentId);
	void RemoveLadyFromAgent(const string& agentId);

private:
	void PrintConfig();

private:
	/*
	 *	请求解析函数
	 *	return : -1:Send fail respond / 0:Continue recv, send no respond / 1:Send OK respond
	 */
	int HandleRecvMessage(Message *m, Message *sm);
	int HandleTimeoutMessage(Message *m, Message *sm);

	/**
	 * 增量获取女士
	 */
	void SyncLadyList(
			const char* siteId
			);

	/**
	 * 获取机构发送状态
	 */
	void GetAgentSendStatus(
			Json::Value& statusNode,
			const char* agentId
			);

	/**
	 * 清空发送队列
	 */
	void ClearLetterSendList(
			long long timestamp
			);

	TcpServer mClientTcpServer;
	DBManager mDBManager;

	/**
	 * 配置文件锁
	 */
	KMutex mConfigMutex;

	// BASE
	short miPort;
	int miMaxClient;
	int miMaxMemoryCopy;
	int miMaxHandleThread;
	int miMaxQueryPerThread;
	/**
	 * 请求超时(秒)
	 */
	unsigned int miTimeout;

	// DB
	DBSTRUCT mDbMan;
	int miDbCount;
	DBSTRUCT* mDbLady;
	DBSTRUCT mDbEmail;

	// LOG
	int miLogLevel;
	string mLogDir;
	int miDebugMode;

	/**
	 * 是否运行
	 */
	bool mIsRunning;

	/**
	 * State线程
	 */
	StateRunnable* mpStateRunnable;
	KThread* mpStateThread;

	/**
	 * Send线程
	 */
	SendLetterRunnable* mpSendRunnable;
	KThread* mpSendThread;

	/**
	 * 统计请求
	 */
	unsigned int mTotal;
	unsigned int mHit;
	unsigned int mResponed;
	KMutex mCountMutex;

	/**
	 * 配置文件
	 */
	string mConfigFile;

	/**
	 * 监听线程输出间隔
	 */
	unsigned int miStateTime;

	/**
	 * 待发送信件列表(二期)
	 */
	LetterSendList mLadyLetterList;

	/**
	 * 待发送女士列表(三期)
	 */
	LadyLetterSendListMap mLadyLetterSendListMap;

	/**
	 * 机构统计列表
	 */
	AgentMap mAgentMap;
};

#endif /* ADMIRERSENDER_H_ */
