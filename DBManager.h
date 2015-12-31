/*
 * DBManager.h
 *
 *  Created on: 2015-9-24
 *      Author: Max
 */

#ifndef DBMANAGER_H_
#define DBMANAGER_H_

#include "LogManager.h"
#include "Lady.h"
#include "Man.h"
#include "PhpObject.h"

#include <common/TimeProc.hpp>
#include <common/StringHandle.h>
#include <common/KThread.h>
#include <common/DBSpool.hpp>

#include <sqlite3.h>

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

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
		mPostfix = "";
		miSyncTime = 0;
		miSyncIndex = 0;
		mbSyncForce = false;
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
		miSyncTime = item.miSyncTime;
		miSyncIndex = item.miSyncIndex;
		mbSyncForce = item.miSyncIndex;
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
		miSyncTime = item.miSyncTime;
		miSyncIndex = item.miSyncIndex;
		mbSyncForce = item.miSyncIndex;
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
	int miSyncTime;
	int miSyncIndex;

	bool mbSyncForce;
	KMutex mSyncMutex;

//	int miLastUpdate;
} DBSTRUCT;

class DBManager;
class DBManagerCallback {
public:
	virtual ~DBManagerCallback(){};

	/**
	 * 同步女士回调
	 */
	virtual void OnSyncLady(
			DBManager* pDBManager,
			const Lady& item
			) = 0;

	/**
	 * 获取可以发送的女士回调
	 */
	virtual void OnGetLady(
			DBManager* pDBManager,
			const Lady& item
			) = 0;
};

class SyncRunnable;
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
			const DBSTRUCT* dbLady,
			const DBSTRUCT& dbEmail
			);

	void SetDBManagerCallback(DBManagerCallback *pDBManagerCallback);

	/**
	 * 强制同步男士
	 * @description 		数据库->内存表
	 */
	void SyncForce();

	/**
	 * 强制同步女士
	 * @description 		数据库->内存
	 */
	void SyncLadyForce(int siteId);

	/**
	 * 获取可发送的女士列表
	 * @description 		内存
	 */
	bool GetLadyList();

	/**
	 * 女士是否可发意向信
	 * @description 	内存->数据库
	 * @param lady		女士
	 */
	bool CanSendLetter(Lady& lady, const AdmireTemplate& admireTemplate);

	/**
	 * 获取女士条件和模板
	 * @description 			数据库->内存
	 * @param lady				女士
	 * @param regulation 		规则号
	 */
	bool GetLadyRegulationInfo(Lady& lady, const string& regulation);

	/**
	 * 获取女士模板详情
	 * @description 			数据库->内存
	 * @param lady				女士
	 * @param admireTemplate 	模板
	 */
	bool GetTemplateInfo(Lady& lady, AdmireTemplate& admireTemplate);

	/**
	 * 男士是否可收意向信
	 * @description 		数据库->内存
	 * @param lady			女士
	 * @param man			男士
	 */
	bool CanRecvLetter(const Lady& lady, Man& man);

	/**
	 * 女士发送一封信件
	 * @description 		内存->数据库
	 * @param lady			女士
	 * @param regulation 	规则号
	 * @param templateCode	模板号
	 */
	bool SendLetter(const Lady& lady, const string& regulation, const AdmireTemplate& admireTemplate);

	/**
	 * 更新女士发送记录
	 * @description 		内存->数据库
	 * @param lady			女士
	 */
	bool FinishLetter(const Lady& lady);

	/**
	 * 设置所有意向信为删除状态
	 * @description 		内存->数据库
	 */
	bool SetAllLetterDelete();

	/**
	 * 同步处理
	 * @description 		数据库->内存表
	 */
	void HandleSyncDatabase();

	/**
	 * 在内存表更新女士能否发信
	 */
	bool UpdateLadyCanSend(const string& womanId, bool bCanSend);

private:
	/****************************** 功能函数start ***********************************************/

	/**
	 * 由siteId转换数据库连接池下标
	 * @param siteId		站点Id
	 */
	int GetIndexBySiteId(int siteId);

	/**
	 * 获取女士自定义条件, 数据库查找字符串
	 * @param lady			女士
	 */
	string GetLadyConditionString(const Lady& lady);

	/**
	 * 过滤特殊字符
	 * @param
	 */
	string SqlTransfer(const string& sql);

	/**
	 * php加密算法
	 */
	string EncryptWin(const string& str);

	/****************************** 功能函数start ***********************************************/

	/****************************** 数据库函数start ***********************************************/

	/**
	 * 增量同步女士
	 * @description 		数据库->内存
	 * @param siteId		站点Id
	 */
	void SyncLadyList(int siteId);

	/**
	 * 根据女士条件发送信件给男士
	 * @description 		内存->数据库
	 * @param lady			女士
	 * @param templateCode	模板号
	 * @param man			男士
	 */
	bool SendLetter2Man(
			const Lady& lady,
			const string& regulation,
			const AdmireTemplate& admireTemplate,
			Man& man
			);

	/**
	 * 更新数据FAV表
	 * @description 		内存->数据库
	 * @param lady			女士
	 * @param man			男士
	 */
	bool UpdateFAV(const Lady& lady, const Man& man);

	/**
	 * 以前审核功能的部分代码,以前需要审核信件，现在不需要，摘必须功能
	 */
	bool UpdateMsgProcessList(const Man& man, const Lady& lady);

	/**
	 * 更新一大堆东西
	 */
	bool UpdateEmailSystem(
			const Man& man,
			const Lady& lady,
			string admireBody,
			unsigned long long iInsertId = 0
			);

	/**
	 * 8.男士在5天內EMF通信关系超过50对
	 * 只有是付费会员时才检测这个条件
	 * @description 失败会把内存表男士标记为不能收信
	 * @param man			男士
	 * @param lady			女士
	 */
	bool CheckEMFCount(const Man& man, const Lady& lady);

	/**
	 * 检查男士分站信息
	 * @description 失败会把内存表男士标记为分站不能收信
	 * @param man			男士
	 * @param lady			女士
	 */
	bool CheckManInfo(Man& man, const Lady& lady);

	/**
	 * 6.男士当天收到多于manmaxnumoneday封意向信即禁发
	 * @description 失败会把内存表男士标记为分站不能收信
	 */
	bool CheckAdmireCount(const Man& man, const Lady& lady);

	/**
	 * 3.检查是否有EMF通信关系或者女士是否给男士发过首封EMF
	 * 检查男士是否发过BP信件给女士
	 */
	bool CheckEMF(const Man& man, const Lady& lady);

	/**
	 * 5.同一机构多个女士在短时间內向男士提交过意向信
	 */
	bool CheckAdmire(const Man& man, const Lady& lady);

	/**
	 * 5.1.检查该女士与该男士24小时内有没有提交过意向信
	 */
	bool CheckAdmire24Hour(const Man& man, const Lady& lady);

	/**
	 * 10.检查是否男士发过CupidNote给女士
	 */
	bool CheckCupidNote(const Man& man, const Lady& lady);

	/**
	 * 11.检查是否发过意向信
	 */
	bool CheckAdmireRecv(const Man& man, const Lady& lady);

	/**
	 * 检查女士自定义条件
	 */
	bool CheckLadyCondition(const Man& man, const Lady& lady);

	/****************************** 数据库函数end ***********************************************/

	/****************************** 同步数据函数start ***********************************************/
	/**
	 * 同步男士到内存表
	 * @description 		数据库->内存表
	 */
	void SyncManFromDatabase();

	/**
	 * 同步男士(最近30天有登录, 非最近注册, 最后登录时间倒序)到内存表
	 * @description 	数据库->内存表
	 * @return			true:数量足够/false:数量不够
	 */
	bool SyncManFromDatabaseLoginRecent();

	/**
	 * 同步男士(非最近30天有登录, 最近注册, 最后登录时间倒序)到内存表
	 * @description 	数据库->内存表
	 * @return			true:数量足够/false:数量不够
	 */
	bool SyncManFromDatabaseRegRecent();

	/**
	 * 数据库检查男士是否最近注册
	 * @return			true:最近注册(半年内)/false:非最近注册(半年前)
	 */
	bool CheckManRegRecent(const Man& man);

	/**
	 * 数据库更新男士基本信息(男士名字, 注册时间)
	 * @description 		数据库->内存表
	 */
	bool SyncManBasicInfo(Man& man);
	/****************************** 同步数据函数end ***********************************************/

	/****************************** 内存表函数start ***********************************************/
	/**
	 * 创建内存表
	 */
	bool CreateTable(sqlite3 *db);

	/**
	 * 同步女士到内存表
	 */
	bool InsertLadyFromDataBase(sqlite3_stmt* stmtLady, const Lady lady);

	/**
	 * 插入男士到内存表
	 */
	bool InsertManFromDataBase(sqlite3_stmt* stmtMan, const Man &man);

	/**
	 * 查询男士是否足够
	 */
	bool CheckManCountEnougth();

	/**
	 * 在内存表更新男士能否收信
	 */
	bool UpdateManCanSend(const Man& man, int iSiteId, bool bCanSend);

	/**
	 * 在内存表更新男士收信数量
	 */
	bool UpdateManSent(const Man& man, int iSiteId);

	/**
	 * 在内存表更新女士发信排序
	 */
	bool UpdateLadySent(const Lady& lady);

	/**
	 * 内存表执行sql
	 */
	bool ExecSQL(sqlite3 *db, const char* sql, char** msg);

	/**
	 * 内存表查询
	 */
	bool QuerySQL(sqlite3 *db, const char* sql, char*** result, int* iRow, int* iColumn, char** msg);

	/**
	 * 完成内存表查询后释放内存
	 */
	void FinishQuery(char** result);
	/****************************** 内存表函数end ***********************************************/

	/**
	 * 同步回调
	 */
	DBManagerCallback* mpDBManagerCallback;

	/**
	 * 上一次获取的最后一个女士
	 */
	int miLastRecordId;

	/**
	 * 数据库数量
	 */
	int miDbCount;

	/**
	 * 数据库结构体
	 */
	DBSTRUCT mDbMan;
	DBSTRUCT* mpDbLady;
	DBSTRUCT mDbEmail;

	DBSpool mDBSpool;
	DBSpool mDBSpoolLady[4];
	DBSpool mDBSpoolEmail;

	/**
	 * 同步线程
	 */
	SyncRunnable* mpSyncRunnable;

	/**
	 * 内存库
	 */
	sqlite3* mdb;

	/**
	 * 是否强制同步
	 */
	bool mbSyncForce;
	KMutex mSyncMutex;

	KThread mSyncThread;
};

#endif /* DBMANAGER_H_ */
