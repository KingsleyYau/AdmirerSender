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
		id = 0;
		manId = "";
		manName = "";
		login_time = "";
		reg_time = "";
		paidAmount = 0;
		admirerNotify = 0;
		sid = "";
		lastName = "";
		email = "";
		subSiteId = "";
	}

	virtual ~Man(){};

	Man(const Man& item) {
		id = item.id;
		manId = item.manId;
		manName = item.manName;
		login_time = item.login_time;
		reg_time = item.reg_time;
		paidAmount = item.paidAmount;
		admirerNotify = item.admirerNotify;
		sid = item.sid;
		lastName = item.lastName;
		email = item.email;
		subSiteId = item.subSiteId;
	}

	Man& operator=(const Man& item) {
		id = item.id;
		manId = item.manId;
		manName = item.manName;
		login_time = item.login_time;
		reg_time = item.reg_time;
		paidAmount = item.paidAmount;
		admirerNotify = item.admirerNotify;
		sid = item.sid;
		lastName = item.lastName;
		email = item.email;
		subSiteId = item.subSiteId;
		return *this;
	}

	unsigned long long id;
	string manId;
	string manName;
	string login_time;
	string reg_time;
	double paidAmount;
	int admirerNotify;
	string sid;
	string lastName;
	string email;
	string subSiteId;
};

#endif /* MAN_H_ */
