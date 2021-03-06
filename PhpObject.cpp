/*
 * PhpObject.cpp
 *
 *  Created on: 2015-12-15
 *      Author: Max
 */

#include "PhpObject.h"

#define ConsoleLog(fmt, ...)
//#define ConsoleLog(fmt, ...) printf(fmt, ## __VA_ARGS__)

PhpObject::PhpObject() {
	// TODO Auto-generated constructor stub
	Reset();
}

PhpObject::PhpObject(const PhpObject& obj) {
	Reset();

	mObjectType = obj.mObjectType;
	mValue = obj.mValue;
	mPhpObjectMap = obj.mPhpObjectMap;
	std::copy(obj.mPhpObjectList.begin(), obj.mPhpObjectList.end(), std::back_inserter(mPhpObjectList));
}

PhpObject::PhpObject(const string& value) {
	Reset();

	mObjectType = ObjectTypeObject;
	mValue = value;
}

PhpObject::~PhpObject() {
	// TODO Auto-generated destructor stub
	Reset();
}

void PhpObject::Reset() {
	mObjectType = ObjectTypeUnknow;
	mValue = "";
	mPhpObjectMap.clear();
	mPhpObjectList.clear();
}

string PhpObject::Serialize() {
	string result = "";
	char len[32];
	string key = "";
	string value = "";
	int index = 0;

	if( isArray() ) {
		// Serialize php array (value1, value2...)
		result += "a:";
		sprintf(len, "%d", (int)mPhpObjectList.size());
		result += len;
		result += ":";
		result += "{";

		index = 0;
		for(PhpSubObjectList::iterator itr = mPhpObjectList.begin(); itr != mPhpObjectList.end(); itr++ ) {
			// Add index if needed
			result += "i:";
			sprintf(len, "%d", index);
			result += len;
			result += ";";

			// Serialize value
			result += itr->Serialize();

			index++;
		}

		result += "}";

	} else if( isMap() ) {
		// Serialize php array (key => value)
		result += "a:";
		sprintf(len, "%d", (int)mPhpObjectMap.size());
		result += len;
		result += ":";
		result += "{";

		for(PhpObjectMap::iterator itr = mPhpObjectMap.begin(); itr != mPhpObjectMap.end(); itr++) {
			// Serialize key
			key = itr->first;
			result += "s:";
			sprintf(len, "%d", (int)key.length());
			result += len;
			result += ":\"";
			result += key;
			result += "\";";

			result += itr->second.Serialize();

		}

		result += "}";

	} else if( isObject() ) {
		// Serialize php object
		value = mValue;
		result += "s:";
		sprintf(len, "%d", (int)value.length());
		result += len;
		result += ":\"";
		result += value;
		result += "\";";

	}

	return result;
}

bool PhpObject::UnSerialize(string serializeString) {
	bool bFlag = true;
	Reset();

	int sep = -1, index = 0;
	string param = "";
	string key = "";
	string value = "";

	ParsePhpObjectStack parsePhpObjectStack;

	PhpObject tempObj;
	PhpObject* pParrentObj = NULL;
	PhpObject* pCurObj = this;

	while( bFlag && index < (int)serializeString.length() ) {
		ConsoleLog("# Parse index : %d, char : %c \n", index, serializeString[index] );

		switch( serializeString[index] ) {
		case '{':{
			ConsoleLog("# Parse '{' \n");

			if( index + 1 < (int)serializeString.length() ) {
				switch (serializeString[index + 1]) {
				case 's': {
					ConsoleLog("# Parse '{' : ObjectTypeMap \n");
					pCurObj->SetObjectType(ObjectTypeMap);

				}break;
				case 'i': {
					ConsoleLog("# Parse '{' : ObjectTypeArray \n");
					pCurObj->SetObjectType(ObjectTypeArray);

				}break;
				default: {
					ConsoleLog("# Parse '{' : ObjectTypeUnknow \n");
					bFlag = false;

				}break;
				}
			}

			if( !bFlag ) {
				// parse error
				break;

			} else {
				// get parent
				if( !parsePhpObjectStack.empty() ) {
					pParrentObj = parsePhpObjectStack.top();

					// parent node type
					switch( pParrentObj->mObjectType ) {
					case ObjectTypeArray: {
						// array (value1, value2...)
						ConsoleLog("# Parse '{' parent : ObjectTypeArray \n");

						pCurObj = &((*pParrentObj).Append(*pCurObj));

					}break;
					case ObjectTypeMap: {
						// map (key => value)
						ConsoleLog("# Parse '{' parent : ObjectTypeMap, key : %s \n", key.c_str());

						if( key.length() > 0 ) {
							(*pParrentObj)[key] = *pCurObj;
							pCurObj = &((*pParrentObj)[key]);
							key = "";
						}

					}break;
					default: {
						// parse error
						ConsoleLog("# Parse '{' parent : ObjectTypeUnknow \n");
						bFlag = false;

					}break;
					}

				}

				// push self to stack
				parsePhpObjectStack.push(pCurObj);

				pParrentObj = pCurObj;
				pCurObj = &tempObj;

				sep = index;
			}

		}break;
		case '}':{
			ConsoleLog("# Parse '}' \n");
			if( !parsePhpObjectStack.empty() ) {
				pParrentObj = parsePhpObjectStack.top();
				parsePhpObjectStack.pop();

			} else {
				bFlag = false;

			}

			if( !bFlag ) {
				// parse error
				ConsoleLog("# Parse '}', ObjectTypeUnknow \n");
				break;

			} else {
				sep = index;

			}

		}break;
		case ';':{
			ConsoleLog("# Parse ';' \n");
			if( !parsePhpObjectStack.empty() ) {
				pParrentObj = parsePhpObjectStack.top();

			}

			// Separate object string
			string objectString = serializeString.substr(sep + 1, index - (sep + 1));
			ConsoleLog("# Parse ';', objectString : %s \n", objectString.c_str());

			string objectType = "";
			string objectLength = "";
			string objectName = "";

			// Find objectType(ex:s)
			string::size_type objectTypeIndex = objectString.find(":");
			if( objectTypeIndex != string::npos) {
				objectType = objectString.substr(0, objectTypeIndex);

				// Find objectLength(ex:9)
				string::size_type objectLengthIndex = objectString.find(":", objectTypeIndex + 1);
				if( objectLengthIndex != string::npos) {
					objectLength = objectString.substr(objectTypeIndex + 1, objectLengthIndex - (objectTypeIndex + 1));

					if( objectString.length() > (objectLengthIndex + 1) ) {
						// Find objectName(ex:womanId)
						objectName = objectString.substr(objectLengthIndex + 1, objectString.length() - (objectLengthIndex + 1));
					}
				} else {
					if( objectString.length() > (objectTypeIndex + 1) ) {
						// Find objectLength(ex:9)
						objectLength = objectString.substr(objectTypeIndex + 1, objectString.length() - (objectTypeIndex + 1));
					}
				}
			}

			if( (strcmp(objectType.c_str(), "s") == 0) && objectLength.length() > 0 && objectName.length() > 0 ) {
				if( pParrentObj != NULL ) {
					// Parent node type
					switch( pParrentObj->mObjectType ) {
					case ObjectTypeArray: {
						// array (value1, value2...)
						value = StringHandle::replace(objectName, "\"", "");
						(*pParrentObj).Append(value);
						ConsoleLog("# Parse ';', ObjectTypeArray, value : %s \n", value.c_str());

					}break;
					case ObjectTypeMap: {
						// map (key => value)
						if( key.length() == 0 ) {
							key = StringHandle::replace(objectName, "\"", "");
							ConsoleLog("# Parse ';', ObjectTypeMap, key : %s \n", key.c_str());

						} else {
							value = StringHandle::replace(objectName, "\"", "");
							ConsoleLog("# Parse ';', ObjectTypeMap, value : %s \n", value.c_str());

							if( key.length() > 0 ) {
								(*pParrentObj)[key] = value;

							} else {
								// parse error
								ConsoleLog("# Parse ';', ObjectTypeMap, key error \n");
								bFlag = false;

							}
							ConsoleLog("# Parse ';', ObjectTypeMap, key : %s, value : %s \n", key.c_str(), value.c_str());
							key = "";
						}

					}break;
					default: {
						// Parse error
						ConsoleLog("# Parse ';', ObjectTypeUnknow \n");
						bFlag = false;

					}break;
					}

				} else {
					// Current node
					ConsoleLog("# Parse ';' : Current node \n");
					value = StringHandle::replace(objectName, "\"", "");
					(*pCurObj) = value;

				}

			} else if( (strcmp(objectType.c_str(), "i") == 0) ) {
				// Array object index, continue
				ConsoleLog("# Parse ';', ObjectTypeArray, index : %s, continue \n", objectLength.c_str());

			} else {
				// Parse error
				ConsoleLog("# Parse ';', objectType : %s, objectLength : %s, objectName : %s, unknow error \n", objectType.c_str(), objectLength.c_str(), objectName.c_str());

				bFlag = false;
				break;
			}

			if( !bFlag ) {
				// parse error
				ConsoleLog("# Parse ';' error \n");
				break;

			} else {
				sep = index;

			}

		}break;
		default:break;
		}

		index++;
	}

	return bFlag;
}

PhpObject& PhpObject::Append(const PhpObject& obj) {
	mObjectType = ObjectTypeArray;
	mPhpObjectList.push_back(obj);
	return mPhpObjectList.back();
}

PhpObject& PhpObject::Append(const PhpObject& obj, int index) {
	mObjectType = ObjectTypeArray;
	PhpSubObjectList::iterator itr = mPhpObjectList.begin();
	for(int i = 0; itr != mPhpObjectList.end(); i++) {
		if(i == index) {
			PhpSubObjectList::iterator newItr = mPhpObjectList.insert(itr, obj);
			break;
		} else {
			itr++;
		}
	}

	if( itr == mPhpObjectList.end() ) {
		mPhpObjectList.push_back(obj);
		itr = mPhpObjectList.end();
	}

	return *itr;
}

PhpObject& PhpObject::Append(string value) {
	mObjectType = ObjectTypeArray;
	mPhpObjectList.push_back(PhpObject(value));
	return mPhpObjectList.back();
}

void PhpObject::SetObjectType(ObjectType type) {
	mObjectType = type;
}

PhpObject& PhpObject::operator[](string key) {
	SetObjectType(ObjectTypeMap);

	return mPhpObjectMap[key];
}

PhpObject* PhpObject::GetObjectByIndex(int index) {
	PhpObject* obj = NULL;
	if( index < (int)mPhpObjectList.size() ) {
		return &mPhpObjectList.at(index);
	}
	return obj;
}

PhpObject& PhpObject::operator=(const PhpObject& obj) {
	Reset();

	mObjectType = obj.mObjectType;
	mValue = obj.mValue;
	mPhpObjectMap = obj.mPhpObjectMap;
	std::copy(obj.mPhpObjectList.begin(), obj.mPhpObjectList.end(), std::back_inserter(mPhpObjectList));

	return *this;
}

PhpObject&  PhpObject::operator=(string value) {
	Reset();

	mObjectType = ObjectTypeObject;
	mValue = value;

	return *this;
}

string PhpObject::asString() {
	return mValue;
}

long PhpObject::asInt() {
	return atol(mValue.c_str());
}

long PhpObject::asDouble() {
	return atof(mValue.c_str());
}

bool PhpObject::isMap() {
	return (mObjectType == ObjectTypeMap);
}

bool PhpObject::isArray() {
	return (mObjectType == ObjectTypeArray);
}

bool PhpObject::isObject() {
	return (mObjectType == ObjectTypeObject);
}

bool PhpObject::isUnknow() {
	return (mObjectType == ObjectTypeUnknow);
}

int PhpObject::size() {
	if( mObjectType == ObjectTypeArray ) {
		return mPhpObjectList.size();
	} else if( mObjectType == ObjectTypeMap ) {
		return mPhpObjectMap.size();
	} else {
		return 0;
	}
}
