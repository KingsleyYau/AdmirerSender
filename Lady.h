/*
 * Lady.h
 *
 *  Created on: 2015-11-2
 *      Author: Max
 */

#ifndef LADY_H_
#define LADY_H_

#include <string>
#include <list>
using namespace std;

class Lady {
public:
	Lady() {
		mSiteId = 0;
		mWomanId = "";
		mWomanName = "";
		mGroupId = "";
		mAgentId = "";
		mAagentStaff = "";
		mAagentStaffName = "";

		mFailTimes = 0;
	}

	virtual ~Lady(){};

	Lady(const Lady& item){
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
	}

	Lady& operator=(const Lady& item) {
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
		return *this;
	}

	int mSiteId;
	string mWomanId;
	string mWomanName;
	string mGroupId;
	string mAgentId;
	string mAagentStaff;
	string mAagentStaffName;
	string mComputerId;
	string mIp;

	list<string> mRegulationList;
//	list<string> mTemplateList;

	int mFailTimes;
};

#endif /* LADY_H_ */
