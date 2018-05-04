/*
 * DBStruct.cpp
 *
 *  Created on: 2017-04-27
 *      Author: Samson
 */

#include "DBStruct.h"
#include <regex.h>
#include <common/LogManager.h>

DBRECVSTRUCT GetRecvStructWithLady(const DBSTRUCT& dbStruct, const Lady& lady)
{
	DBRECVSTRUCT result;
	result.mFreeRecv = dbStruct.mDefFreeRecv;
	result.mPaidRecv = dbStruct.mDefPaidRecv;
	result.mPostfix = dbStruct.mDefPostfix;

	// for test
	string condition("");

	for (DBRECVLIST::const_iterator iter = dbStruct.mRecvList.begin();
		iter != dbStruct.mRecvList.end();
		iter++)
	{
		regex_t ex = {0};
		if (!(*iter).mCondition.empty()) {
			if (0 == regcomp(&ex, (*iter).mCondition.c_str(), REG_EXTENDED|REG_NOSUB|REG_ICASE))
			{
				bool match = false;
				if (0 == regexec(&ex, lady.country.c_str(), 0, NULL, 0))
				{
					result.mFreeRecv = (*iter).mFreeRecv;
					result.mPaidRecv = (*iter).mPaidRecv;
					result.mPostfix = (*iter).mPostfix;

					// for test
					condition = (*iter).mCondition;

					match = true;
				}
				regfree(&ex);

				if (match) {
					break;
				}
			}
		}
	}

	LogManager::GetLogManager()->Log(
			LOG_STAT,
			"GetRecvStructWithLady() "
			"condition: %s, "
			"lady.country: %s, "
			"freeRecv: %d, "
			"paidRecv: %d, "
			"postfix: %s"
			")",
			condition.c_str(),
			lady.country.c_str(),
			result.mFreeRecv,
			result.mPaidRecv,
			result.mPostfix.c_str()
			);

	return result;
}

