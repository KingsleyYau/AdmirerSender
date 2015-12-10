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
	mRegulation = "";
	mTemplate.Reset();
}

LadyDBLetterSender::~LadyDBLetterSender() {

}

bool LadyDBLetterSender::CanSendLetter() {
	if( mLady.mFailTimes > FAIL_TIMES ) {
		// 连续3次发送失败
		return false;
	}

	// 获取规则
	mRegulation = "";
	if( !mLady.mRegulationList.empty() ) {
		int r = rand() % mLady.mRegulationList.size();
		int i = 0;
		for(list<string>::iterator itr = mLady.mRegulationList.begin(); itr != mLady.mRegulationList.end(); itr++, i++) {
			if( r == i ) {
				mRegulation = *itr;
				break;
			}
		}
	}

	// 获取模板
	mTemplate.Reset();
	mpDBManager->GetLadyRegulationInfo(mLady, mRegulation);
	if( !mLady.mTemplateList.empty() ) {
		int r = rand() % mLady.mTemplateList.size();
		int i = 0;
		for(list<AdmireTemplate>::iterator itr = mLady.mTemplateList.begin(); itr != mLady.mTemplateList.end(); itr++, i++) {
			if( r == i ) {
				mTemplate = *itr;
				break;
			}
		}
	}

	if( mTemplate.templateCode.length() == 0 || mTemplate.templateType.length() == 0 ) {
		return false;
	}

	return mpDBManager->CanSendLetter(mLady, mTemplate);
}

bool LadyDBLetterSender::SendLetter() {
	bool bFlag = false;

	// 向数据库写入信件
	if( mRegulation.length() > 0 && mTemplate.templateCode.length() > 0 ) {
		bFlag = mpDBManager->SendLetter(mLady, mRegulation, mTemplate);
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

bool LadyDBLetterSender::FinishLetter() {
	bool bFlag = false;
	bFlag = mpDBManager->FinishLetter(mLady);
	return bFlag;
}
