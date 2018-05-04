/*
 * DBStruct.h
 *
 *  Created on: 2017-04-27
 *      Author: Samson
 */

#ifndef DBSTRUCT_H_
#define DBSTRUCT_H_

#include "Lady.h"
#include <common/KMutex.h>

#include <string>
#include <list>
using namespace std;

typedef struct DBRecvStruct {
	DBRecvStruct() {
		mCondition = "";
		mPaidRecv = 0;
		mFreeRecv = 0;
		mPostfix = "";
	}

	DBRecvStruct(const DBRecvStruct& item) {
		mCondition = item.mCondition;
		mPaidRecv = item.mPaidRecv;
		mFreeRecv = item.mFreeRecv;
		mPostfix = item.mPostfix;
	}

	DBRecvStruct& operator=(const DBRecvStruct& item) {
		mCondition = item.mCondition;
		mPaidRecv = item.mPaidRecv;
		mFreeRecv = item.mFreeRecv;
		mPostfix = item.mPostfix;
		return *this;
	}

	string mCondition;
	int mPaidRecv;
	int mFreeRecv;
	string mPostfix;
} DBRECVSTRUCT;
typedef list<DBRECVSTRUCT> DBRECVLIST;

typedef struct DBStruct {
	DBStruct() {
		mSpaceName = "";
		mHost = "";
		mPort = -1;
		mUser = "";
		mPasswd = "";
		mDbName = "";
		miMaxDatabaseThread = 0;
		miSiteId = -1;
		miOverValue = 0;
		mDefPaidRecv = 0;
		mDefFreeRecv = 0;
		mDefPostfix = "";
		mMember = "";
		miSyncTime = 0;
		miSyncIndex = 0;
		mbSyncForce = false;
	}

	DBStruct(const DBStruct& item) {
		mSpaceName = item.mSpaceName;
		mHost = item.mHost;
		mPort = item.mPort;
		mUser = item.mUser;
		mPasswd = item.mPasswd;
		mDbName = item.mDbName;
		miMaxDatabaseThread = item.miMaxDatabaseThread;
		miSiteId = item.miSiteId;
		miOverValue = item.miOverValue;
		mDefPaidRecv = item.mDefPaidRecv;
		mDefFreeRecv = item.mDefFreeRecv;
		mDefPostfix = item.mDefPostfix;
		mMember = item.mMember;
		miSyncTime = item.miSyncTime;
		miSyncIndex = item.miSyncIndex;
		mbSyncForce = item.miSyncIndex;
	}

	DBStruct& operator=(const DBStruct& item) {
		mSpaceName = item.mSpaceName;
		mHost = item.mHost;
		mPort = item.mPort;
		mUser = item.mUser;
		mPasswd = item.mPasswd;
		mDbName = item.mDbName;
		miMaxDatabaseThread = item.miMaxDatabaseThread;
		miSiteId = item.miSiteId;
		miOverValue = item.miOverValue;
		mDefPostfix = item.mDefPostfix;
		mMember = item.mMember;
		miSyncTime = item.miSyncTime;
		miSyncIndex = item.miSyncIndex;
		mbSyncForce = item.miSyncIndex;
		return *this;
	}

	string mSpaceName;
	string mHost;
	short mPort;
	string mUser;
	string mPasswd;
	string mDbName;
	int miMaxDatabaseThread;
	int miSiteId;
	int mSendStep;
	int miOverValue;
	int mDefPaidRecv;
	int mDefFreeRecv;
	string mDefPostfix;
	DBRECVLIST mRecvList;
	string mMember;
	int miSyncTime;
	int miSyncIndex;

	bool mbSyncForce;
	KMutex mSyncMutex;

//	int miLastUpdate;
} DBSTRUCT;

DBRECVSTRUCT GetRecvStructWithLady(const DBSTRUCT& dbStruct, const Lady& lady);

#endif /* DBSTRUCT_H_ */
