/*
 * DataHttpParser.h
 *
 *  Created on: 2015-9-28
 *      Author: Max
 */

#ifndef DATAHTTPPARSER_H_
#define DATAHTTPPARSER_H_

#include "DataParser.h"
#include <common/MessageList.h>

#include <common/Arithmetic.hpp>
#include <common/KMutex.h>

#include <stdio.h>
#include <stdlib.h>

#include <ctype.h>
#include <algorithm>

#include <string>
#include <map>
using namespace std;

struct ParamCompare: public std::binary_function<std::string, std::string, bool> {
	bool operator()(const std::string& left,const std::string& right) const {
		return strcasecmp(left.c_str(), right.c_str()) < 0;
	}
};
typedef map<string, string, ParamCompare> Parameters;

typedef enum _tagHttpType {
	GET,
	POST,
	UNKNOW,
} HttpType;

class DataHttpParser : public DataParser {
public:
	DataHttpParser();
	virtual ~DataHttpParser();

	int ParseData(char* buffer, int len);

	string GetParam(const string& key);
	string GetPath();
	HttpType GetType();

	void Reset();

private:
	HttpType mHttpType;
	int miContentLength;
	Parameters mParameters;
	string mPath;

	bool ParseFirstLine(const string& line);
	void ParseParameters(const string& line);
};

#endif /* DATAHTTPPARSER_H_ */
