/*
 * LadyDBLetterSender.cpp
 *
 *  Created on: 2015-11-4
 *      Author: Max
 */

#include "LadyDBLetterSender.h"

#define FAIL_TIMES 1

LadyDBLetterSender::LadyDBLetterSender(const Lady& lady, DBManager* pDBManager) : LadyLetterSender(lady) {
	mpDBManager = pDBManager;
}

LadyDBLetterSender::~LadyDBLetterSender() {

}

bool LadyDBLetterSender::CanSendLetter() {
	if( mLady.mFailTimes > FAIL_TIMES ) {
		// 连续3次发送失败
		return false;
	}

	return mpDBManager->CanSendLetter(mLady);
}

bool LadyDBLetterSender::SendLetter() {
	bool bFlag = false;

	string regulation = "";
	string templateCode = "";

	// 获取规则
	if( !mLady.mRegulationList.empty() ) {
		int r = rand() % mLady.mRegulationList.size();
		int i = 0;
		for(list<string>::iterator itr = mLady.mRegulationList.begin(); itr != mLady.mRegulationList.end(); itr++, i++) {
			if( r == i ) {
				regulation = *itr;
				break;
			}
		}
	}

	// 获取模板
	mpDBManager->GetLadyRegulationInfo(mLady, regulation);
	if( !mLady.mTemplateList.empty() ) {
		int r = rand() % mLady.mTemplateList.size();
		int i = 0;
		for(list<string>::iterator itr = mLady.mTemplateList.begin(); itr != mLady.mTemplateList.end(); itr++, i++) {
			if( r == i ) {
				templateCode = *itr;
				break;
			}
		}
	}

	// 向数据库写入信件
	if( regulation.length() > 0 && templateCode.length() > 0 ) {
		bFlag = mpDBManager->SendLetter(mLady, regulation, templateCode);
	}

	if( bFlag ) {
		// 清空失败次数
		mLady.mFailTimes = 0;
	} else {
		// 记录失败次数
		mLady.mFailTimes++;
	}

	return bFlag;
}

int LadyDBLetterSender::GetErrorCode() {
	if( mLady.mFailTimes > FAIL_TIMES ) {
		// 连续3次发送失败
		return SEND_FIAL_TOO_MORE_TIME;
	} else {
		return NONE;
	}
}

string LadyDBLetterSender::GetAgentId() {
	return mLady.mAgentId;
}
