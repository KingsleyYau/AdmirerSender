/*
 * Lady.h
 *
 *  Created on: 2015-11-2
 *      Author: Max
 */

#ifndef LADY_H_
#define LADY_H_

#include "AdmireTemplate.h"

#include <string>
#include <list>
using namespace std;

class Lady {
public:
	Lady() {
		mRecordId = 0;
		mSiteId = 0;
		mWomanId = "";
		mWomanName = "";
		mGroupId = "";
		mAgentId = "";
		mAagentStaff = "";
		mAagentStaffName = "";

		mAgeStart = "";
		mAgeEnd = "";
		mManName = "";
		mCountry = "";
		mMarry = "";
		mChildren = "";
		mPhoto = "";
		mEthnicity = "";
		mReligion = "";
		mIsBirthday = 0;

		mFailTimes = 0;
	}

	virtual ~Lady(){};

	Lady(const Lady& item){
		mRecordId = item.mRecordId;
		mSiteId = item.mSiteId;
		mWomanId = item.mWomanId;
		mWomanName = item.mWomanName;
		mGroupId = item.mGroupId;
		mAgentId = item.mAgentId;
		mAagentStaff = item.mAagentStaff;
		mAagentStaffName = item.mAagentStaffName;
		mComputerId = item.mComputerId;
		mIp = item.mIp;

		std::copy(item.mRegulationList.begin(), item.mRegulationList.end(), std::back_inserter(mRegulationList));
		std::copy(item.mTemplateList.begin(), item.mTemplateList.end(), std::back_inserter(mTemplateList));

		mAgeStart = item.mAgeStart;
		mAgeEnd = item.mAgeEnd;
		mManName = item.mManName;
		mCountry = item.mCountry;
		mMarry = item.mMarry;
		mChildren = item.mChildren;
		mPhoto = item.mPhoto;
		mEthnicity = item.mEthnicity;
		mReligion = item.mReligion;
		mIsBirthday = item.mIsBirthday;

		mFailTimes = item.mFailTimes;
	}

	Lady& operator=(const Lady& item) {
		mRecordId = item.mRecordId;
		mSiteId = item.mSiteId;
		mWomanId = item.mWomanId;
		mWomanName = item.mWomanName;
		mGroupId = item.mGroupId;
		mAgentId = item.mAgentId;
		mAagentStaff = item.mAagentStaff;
		mAagentStaffName = item.mAagentStaffName;
		mComputerId = item.mComputerId;
		mIp = item.mIp;

		std::copy(item.mRegulationList.begin(), item.mRegulationList.end(), std::back_inserter(mRegulationList));
		std::copy(item.mTemplateList.begin(), item.mTemplateList.end(), std::back_inserter(mTemplateList));

		mAgeStart = item.mAgeStart;
		mAgeEnd = item.mAgeEnd;
		mManName = item.mManName;
		mCountry = item.mCountry;
		mMarry = item.mMarry;
		mChildren = item.mChildren;
		mPhoto = item.mPhoto;
		mEthnicity = item.mEthnicity;
		mReligion = item.mReligion;
		mIsBirthday = item.mIsBirthday;

		mFailTimes = item.mFailTimes;

		return *this;
	}

	// 自增Id
	unsigned int mRecordId;

	// 基本条件
	int mSiteId;
	string mWomanId;
	string mWomanName;
	string mGroupId;
	string mAgentId;
	string mAagentStaff;
	string mAagentStaffName;
	string mComputerId;
	string mIp;

	// 规则和模板
	list<string> mRegulationList;
	list<AdmireTemplate> mTemplateList;

	// 选定规则后,女士自定义条件
	string mAgeStart;
	string mAgeEnd;
	string mManName;
	string mCountry;
	string mMarry;
	string mChildren;
	string mPhoto;
	string mEthnicity;
	string mReligion;
	int mIsBirthday;

	int mFailTimes;
};

#endif /* LADY_H_ */
