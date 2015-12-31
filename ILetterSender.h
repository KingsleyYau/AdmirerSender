/*
 * ILetterSender.h
 *
 *  Created on: 2015-11-4
 *      Author: Max
 */

#ifndef ILETTERSENDER_H_
#define ILETTERSENDER_H_

#include <string>
using namespace std;

typedef enum ErrorCode {
	NONE,
	SEND_FIAL_TOO_MORE_TIME,
} ERRORCODE;

class ILetterSender {
public:
	virtual ~ILetterSender(){};

	virtual bool CanSendLetter() = 0;
	virtual bool SendLetter() = 0;
	virtual int GetErrorCode() = 0;
	virtual bool FinishLetter() = 0;

//	virtual string GetAgentId() = 0;
//	virtual string GetPersonId() = 0;
};

#endif /* ILETTERSENDER_H_ */
