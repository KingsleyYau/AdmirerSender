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
		id = "";
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

		lastname = "";
		birthday = "";
		country = "";
		height = "";
		weight = "";
		marry = "";
		province = "";

		mFailTimes = 0;
		iSort = 0;
	}

	virtual ~Lady(){};

	Lady(const Lady& item) {
		id = item.id;
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

		lastname = item.lastname;
		birthday = item.birthday;
		country = item.country;
		height = item.height;
		weight = item.weight;
		marry = item.marry;
		province = item.province;

		mFailTimes = item.mFailTimes;
		iSort = item.iSort;
	}

	Lady& operator=(const Lady& item) {
		id = item.id;
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

		lastname = item.lastname;
		birthday = item.birthday;
		country = item.country;
		height = item.height;
		weight = item.weight;
		marry = item.marry;
		province = item.province;

		mFailTimes = item.mFailTimes;
		iSort = item.iSort;

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

	// 女士资料
	string id;
	string lastname;
	string birthday;
	string country;
	string height;
	string weight;
	string marry;
	string province;

	int mFailTimes;
	int iSort;
};

#endif /* LADY_H_ */
