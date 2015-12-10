/*
 * Man.h
 *
 *  Created on: 2015-11-2
 *      Author: Max
 */

#ifndef Man_H_
#define Man_H_

#include <string>
#include <map>
using namespace std;

class Man {
public:
	Man() {
		manId = "";
		manName = "";
		login_time = "";
		reg_time = "";
		paidAmount = 0;
	}

	virtual ~Man(){};

	Man(const Man& item){
		manId = item.manId;
		manName = item.manName;
		login_time = item.login_time;
		reg_time = item.reg_time;
		paidAmount = item.paidAmount;
	}

	Man& operator=(const Man& item) {
		manId = item.manId;
		manName = item.manName;
		login_time = item.login_time;
		reg_time = item.reg_time;
		paidAmount = item.paidAmount;
		return *this;
	}

	string manId;
	string manName;
	string login_time;
	string reg_time;
	double paidAmount;

};

#endif /* MAN_H_ */
