/*
 * PhpObject.h
 *
 *  Created on: 2015-12-15
 *      Author: Max
 */

#ifndef PhpObject_H_
#define PhpObject_H_

#include <common/StringHandle.h>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <string>
#include <stack>
#include <map>
#include <list>
#include <vector>
using namespace std;

class PhpObject;
typedef vector<PhpObject> PhpSubObjectList;
typedef map<string, PhpObject> PhpObjectMap;

typedef stack<PhpObject*> ParsePhpObjectStack;

typedef enum ObjectType {
	ObjectTypeUnknow,
	ObjectTypeObject,
	ObjectTypeArray,
	ObjectTypeMap,
	ObjectTypeNull,
} ObjectType;

class PhpObject {
public:
	PhpObject();
	PhpObject(const PhpObject& obj);
	PhpObject(const string& value);
	virtual ~PhpObject();

	void Reset();
	string Serialize();
	bool UnSerialize(const string serializeString);

	/**
	 * Add object to array
	 */
	PhpObject& Append(const PhpObject& obj);
	PhpObject& Append(string value);

	/**
	 * Get object by key
	 */
	PhpObject& operator[](string key);

	/**
	 * Get object by index
	 */
	PhpObject* GetObjectByIndex(int index);
//	PhpObject& operator[](int index);

	/**
	 * Set value
	 */
	PhpObject& operator=(const PhpObject& obj);
	PhpObject& operator=(string value);

	/**
	 * Get value
	 */
	string asString();
	long asInt();
	long asDouble();

	bool isMap();
	bool isArray();
	bool isObject();
	bool isUnknow();
	int size();

private:
	void SetObjectType(ObjectType type);

	// Object
	string mValue;

	// Map
	PhpObjectMap mPhpObjectMap;

	// Array
	PhpSubObjectList mPhpObjectList;

	// Type
	ObjectType mObjectType;

};

#endif /* PHPOBJECT_H_ */
