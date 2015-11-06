/*
 * LadyDBLetterSender.h
 *
 *  Created on: 2015-11-4
 *      Author: Max
 */

#ifndef LadyDBLetterSender_H_
#define LadyDBLetterSender_H_

#include "LadyLetterSender.h"
#include "DBManager.h"

class LadyDBLetterSender : public LadyLetterSender {
public:
	LadyDBLetterSender(const Lady& lady, DBManager* pDBManager);
	virtual ~LadyDBLetterSender();

	bool CanSendLetter();
	bool SendLetter();
	int GetErrorCode();
	string GetAgentId();

protected:
	DBManager* mpDBManager;
};

#endif /* LADYDBLETTERSENDER_H_ */
