/*
 * DBManager.h
 *
 *  Created on: 2015-9-24
 *      Author: Max
 */

#ifndef DBMANAGER_H_
#define DBMANAGER_H_

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

#include "KThread.h"
#include "DBSpool.hpp"
#include "LogManager.h"
#include "TimeProc.hpp"

#include "Lady.h"
#include "Man.h"

#include <string>
#include <list>
using namespace std;

#define INVALID_INDEX -1

typedef struct DBStruct {
	DBStruct() {
		mHost = "";
		mPort = -1;
		mUser = "";
		mPasswd = "";
		mDbName = "";
		miMaxDatabaseThread = 0;
		miSiteId = -1;
		miOverValue = 0;
		miLastUpdate = 0;
		mPostfix = "";
	}

	DBStruct(const DBStruct& item) {
		mHost = item.mHost;
		mPort = item.mPort;
		mUser = item.mUser;
		mPasswd = item.mPasswd;
		mDbName = item.mDbName;
		miMaxDatabaseThread = item.miMaxDatabaseThread;
		miSiteId = item.miSiteId;
		miOverValue = item.miOverValue;
		mPostfix = item.mPostfix;
	}

	DBStruct& operator=(const DBStruct& item) {
		mHost = item.mHost;
		mPort = item.mPort;
		mUser = item.mUser;
		mPasswd = item.mPasswd;
		mDbName = item.mDbName;
		miMaxDatabaseThread = item.miMaxDatabaseThread;
		miSiteId = item.miSiteId;
		miOverValue = item.miOverValue;
		mPostfix = item.mPostfix;
		return *this;
	}

	string mHost;
	short mPort;
	string mUser;
	string mPasswd;
	string mDbName;
	int miMaxDatabaseThread;
	int miSiteId;
	int miOverValue;
	string mPostfix;

	int miLastUpdate;
} DBSTRUCT;

class DBManager;
class DBManagerCallback {
public:
	virtual ~DBManagerCallback(){};
	virtual void OnGetLady(
			DBManager* pDBManager,
			const Lady& item
			) = 0;
};

class DBManager {
public:
	DBManager();
	virtual ~DBManager();

	/**
	 * 初始化数据库连接
	 * @param		男士站点结构体
	 * @param		女士库数量
	 * @param		女士库结构体数组
	 */
	bool Init(
			const DBSTRUCT& dbMan,
			int iDbCount,
			const DBSTRUCT* dbLady
			);

	void SetDBManagerCallback(DBManagerCallback *pDBManagerCallback);

	/**
	 * 增量获取女士
	 * @param siteId		站点Id
	 */
	void SyncLadyList(int siteId);

	/**
	 * 女士是否可发意向信
	 * @param lady		女士
	 */
	bool CanSendLetter(const Lady& lady);

	/**
	 * 获取女士条件和模板
	 * @param lady				女士
	 * @param regulation 		规则号
	 */
	bool GetLadyRegulationInfo(Lady& lady, const string& regulation);

	/**
	 * 男士是否可收意向信
	 * @param lady			女士
	 * @param man			男士
	 */
	bool CanRecvLetter(const Lady& lady, const Man& man);

	/**
	 * 女士发送一封信件
	 * @param lady			女士
	 * @param regulation 	规则号
	 * @param templateCode	模板号
	 */
	bool SendLetter(const Lady& lady, const string& regulation, const string& templateCode);

private:
	/**
	 * 根据女士条件发送信件给男士
	 * @param lady			女士
	 * @param templateCode	模板号
	 * @param man			男士
	 */
	bool SendLetter(const Lady& lady, const string& regulation, const string& templateCode, const Man& man);

	/**
	 * 更新FAV表
	 */
	bool UpdateFAV(const Lady& lady, const Man& man);

	/**
	 * 由siteId转换数据库连接池下标
	 * @param siteId		站点Id
	 */
	int GetIndexBySiteId(int siteId);

	/**
	 * 获取女士自定义条件,数据库查找字符串
	 */
	string GetLadyConditionString(const Lady& lady);

	DBSpool mDBSpool;
	DBSpool mDBSpoolLady[4];

	DBManagerCallback* mpDBManagerCallback;

	/**
	 * 上一次获取的最后一个女士
	 */
	int miLastRecordId;

	/**
	 * 数据库数量
	 */
	int miDbCount;

	DBSTRUCT mDbMan;
	DBSTRUCT* mpDbLady;
};

#endif /* DBMANAGER_H_ */
