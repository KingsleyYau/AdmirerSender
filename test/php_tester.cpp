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

#define VERSION_STRING "1.0.0"

string fileString = "";

bool Parse(int argc, char *argv[]);
string SqlTransfer(const string& sql);

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

	if( fileString.length() > 0 ) {
		 FILE *file = fopen(fileString.c_str(), "r");
		 if( file != NULL ) {
			 printf("# Open file : %s \n", fileString.c_str());

			 PhpObject obj;
			 string serializeString = "";

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
					 serializeString += buffer;
				 }

				 if( bBreak ) {
					 break;
				 }
			 }

			 if( serializeString.length() > 0 ) {
				 printf("# PhpObject UnSerialize : \n%s\n\n\n", serializeString.c_str());

				 if( obj.UnSerialize(serializeString) ) {
					 PhpObject objNew;
					 PhpObject objAdd;
					 objAdd["womanid"] = "123456";

					 if( obj.isArray() ) {
						 printf("# PhpObject obj is array \n");
						 objNew = obj;
						 objNew.Append(objAdd, 0);
					 } else if ( obj.isMap() ) {
						 printf("# PhpObject obj is map \n");
						 objNew.Append(objAdd, 0);
						 objNew.Append(obj);
					 }
//					 string serializeStringNew = objNew.Serialize();
//					 printf("# PhpObject Serialize : \n%s\n\n\n", serializeStringNew.c_str());

					 string sql = SqlTransfer(obj.Serialize());
					 printf("# PhpObject Serialize sql : \n%s\n\n\n", sql.c_str());

				 } else {
					 printf("# PhpObject UnSerialize fail \n");
				 }
			 } else {
				 printf("# File is empty \n");
			 }

		 } else {
			 printf("# Open file : %s error \n", fileString.c_str());

		 }

	} else {
		printf("# Usage : ./php_tester [ -f <php serialize file> ] \n");
	}

	return EXIT_SUCCESS;
}

bool Parse(int argc, char *argv[]) {
	string key, value;
	for( int i = 1; (i + 1) < argc; i+=2 ) {
		key = argv[i];
		value = argv[i+1];

		if( key.compare("-f") == 0 ) {
			fileString = value;
		}
	}

	return true;
}

string SqlTransfer(const string& sql) {
	string result = "";

	result = StringHandle::replace(sql, "\\", "\\\\");
	result = StringHandle::replace(result, "'", "\\'");
//	result = StringHandle::replace(result, "%", "\\%");
//	result = StringHandle::replace(result, "_", "\\_");

	return result;
}
