/*
 * Man.h
 *
 *  Created on: 2015-11-2
 *      Author: Max
 */

#ifndef Man_H_
#define Man_H_

#include <string>
using namespace std;

class Man {
public:
	Man() {
		mManId = "";
		mManName = "";
		mPaidAmount = 0;
	}

	virtual ~Man(){};

	Man(const Man& item){
		mManId = item.mManId;
		mManName = item.mManName;

	}

	Man& operator=(const Man& item) {
		mManId = item.mManId;
		mManName = item.mManName;
		mPaidAmount = item.mPaidAmount;
		return *this;
	}

	string mManId;
	string mManName;
	int mPaidAmount;
};

#endif /* MAN_H_ */
