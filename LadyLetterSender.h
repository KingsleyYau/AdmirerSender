/*
 * LadyLetterSender.h
 *
 *  Created on: 2015-11-4
 *      Author: Max
 */

#ifndef LADYLETTERSENDER_H_
#define LADYLETTERSENDER_H_

#include "ILetterSender.h"
#include "Lady.h"

class LadyLetterSender : public ILetterSender {
public:
	LadyLetterSender(const Lady& lady) {
		mLady = lady;
	}

	virtual ~LadyLetterSender() {

	}

protected:
	Lady mLady;
};

#endif /* LADYLETTERSENDER_H_ */
