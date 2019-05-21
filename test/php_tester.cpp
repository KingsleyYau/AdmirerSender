/*
 * php_tester.cpp
 *
 *  Created on: 2015-9-28
 *      Author: Max.Chiu
 *      Email: Kingsleyyau@gmail.com
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <stdint.h>

#include <string>
#include <map>
using namespace std;

#include "../PhpObject.h"

#include "../common/StringHandle.h"
#include "../json/json/json.h"

#define VERSION_STRING "1.0.0"

typedef enum ParseType {
	ParseTypePhp,
	ParseTypeJson,
	ParseTypeUnknow,
}ParseType;

string gFileString = "";
string gTypeString = "";
ParseType gParseType = ParseTypePhp;

bool Parse(int argc, char *argv[]);
string ReadStringFromFile(const string& fileString);
string SqlTransfer(const string& sql);
void ParseString2PhpObject(const string& serializeString);
void ParseString2JsonObject(const string& serializeString);

int main(int argc, char *argv[]) {
	printf("############## php_tester ############## \n");
	printf("# Version : %s \n", VERSION_STRING);
	printf("# Build date : %s %s \n", __DATE__, __TIME__ );
	srand(time(0));

	/* Ignore SIGPIPE */
	struct sigaction sa;
	sa.sa_handler = SIG_IGN;
	sigemptyset(&sa.sa_mask);
	sigaction(SIGPIPE, &sa, 0);

	Parse(argc, argv);

	if( gFileString.length() > 0 ) {
		string serializeString = ReadStringFromFile(gFileString);
		if( serializeString.length() > 0 ) {
			switch( gParseType ) {
			case ParseTypePhp:{
				ParseString2PhpObject(serializeString);
			}break;
			case ParseTypeJson:{
				ParseString2JsonObject(serializeString);
			}break;
			default:{
				printf("# Unknow parse type \n");
			}break;
			}

		 } else {
			 printf("# File is empty \n");
		 }

	} else {
		printf("# Usage : ./php_tester -f <file> -t <parse type>[php,json] \n");
	}

	return EXIT_SUCCESS;
}

bool Parse(int argc, char *argv[]) {
	string key, value;
	for( int i = 1; (i + 1) < argc; i+=2 ) {
		key = argv[i];
		value = argv[i+1];

		if( key.compare("-f") == 0 ) {
			gFileString = value;
		}

		if( key.compare("-t") == 0 ) {
			gTypeString = value;

			if( gTypeString.compare("php") == 0 ) {
				gParseType = ParseTypePhp;
			} else if ( gTypeString.compare("json") == 0 ) {
				gParseType = ParseTypeJson;
			} else {
				gParseType = ParseTypeUnknow;
			}
		}
	}

	return true;
}

string ReadStringFromFile(const string& fileString) {
	string result = "";
	if( fileString.length() > 0 ) {
		 FILE *file = fopen(fileString.c_str(), "r");
		 if( file != NULL ) {
			 printf("# Open file : %s \n", fileString.c_str());

			 unsigned int ret = 0;
			 char buffer[1024];

			 bool bBreak = false;
			 while( true ) {
				 ret = fread(buffer, 1, sizeof(buffer), file);
				 printf("# Read file ret : %d \n", ret);

				 if( ret < sizeof(buffer) ) {
					 if ( feof(file) == 0 ) {
						 // 不正常退出
						 printf("# Read file error, ret : %d \n", ret);
						 bBreak = true;
					 } else {
						 // 文件尾退出
						 printf("# Read file finish, ret : %d \n", ret);
						 bBreak = true;
					 }
				 }

				 if( ret > 0 ) {
					 result += buffer;
				 }

				 if( bBreak ) {
					 break;
				 }
			 }
		 } else {
			 printf("# Open file : %s error \n", fileString.c_str());

		 }
	}
	return result;
}

string SqlTransfer(const string& sql) {
	string result = "";

	result = StringHandle::replace(sql, "\\", "\\\\");
	result = StringHandle::replace(result, "'", "\\'");
//	result = StringHandle::replace(result, "%", "\\%");
//	result = StringHandle::replace(result, "_", "\\_");

	return result;
}

void ParseString2PhpObject(const string& serializeString) {
	 printf("# PhpObject UnSerialize : \n%s\n\n\n", serializeString.c_str());

	 PhpObject obj;
	 if( obj.UnSerialize(serializeString) ) {
		 PhpObject objNew;
		 PhpObject objAdd;
		 objAdd["womanid"] = "womanid2";

		 time_t stm = time(NULL);
		 struct tm tTime;
		 localtime_r(&stm, &tTime);
		 char sendTime[128] = {'\0'};
		 snprintf(sendTime, 64, "%d-%02d-%02d %02d:%02d:%02d", tTime.tm_year+1900, tTime.tm_mon+1, tTime.tm_mday, tTime.tm_hour, tTime.tm_min, tTime.tm_sec);
		 objAdd["send_time"] = sendTime;

		 if( obj.isArray() ) {
			 printf("# PhpObject obj is array \n");
			 objNew = obj;
			 objNew.Append(objAdd, 0);
		 } else if ( obj.isMap() ) {
			 printf("# PhpObject obj is map \n");
			 objNew.Append(objAdd, 0);
			 objNew.Append(obj);
		 }
		 string serializeStringNew = objNew.Serialize();
		 printf("# PhpObject Serialize : \n%s\n\n\n", serializeStringNew.c_str());

//		string sql = SqlTransfer(obj.Serialize());
//		printf("# PhpObject Serialize sql : \n%s\n\n\n", sql.c_str());

	 } else {
		 printf("# PhpObject UnSerialize fail \n");
	 }
}

void ParseString2JsonObject(const string& serializeString) {
	 printf("# Json UnSerialize : \n%s\n\n\n", serializeString.c_str());

	 Json::Reader reader;
	 Json::Value root;
	 bool bFlag = reader.parse(serializeString.c_str(), root);
	 if( bFlag ) {
		 Json::Value obj;
		 obj["womanid"] = "womanid2";

		 time_t stm = time(NULL);
		 struct tm tTime;
		 localtime_r(&stm, &tTime);
		 char sendTime[128] = {'\0'};
		 snprintf(sendTime, 64, "%d-%02d-%02d %02d:%02d:%02d", tTime.tm_year+1900, tTime.tm_mon+1, tTime.tm_mday, tTime.tm_hour, tTime.tm_min, tTime.tm_sec);
		 obj["send_time"] = sendTime;

		 root.append(obj);

		 Json::FastWriter writer;
		 string serializeStringNew = writer.write(root);
		 printf("# Json Serialize : \n%s\n\n\n", serializeStringNew.c_str());

	 } else {
		 printf("# Json UnSerialize fail \n");
	 }
}
