/*
 * PhpObject.cpp
 *
 *  Created on: 2015-12-15
 *      Author: Max
 */

#include "PhpObject.h"

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
		switch( serializeString[index] ) {
		case '{':{
//			printf("# parse : '{' \n");

			if( index + 1 < (int)serializeString.length() ) {
				switch (serializeString[index + 1]) {
				case 's': {
					pCurObj->SetObjectType(ObjectTypeMap);

				}break;
				case 'i': {
					pCurObj->SetObjectType(ObjectTypeArray);

				}break;
				default: {
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
						pCurObj = &((*pParrentObj).Append(*pCurObj));

					}break;
					case ObjectTypeMap: {
						// map (key => value)
						if( key.length() > 0 ) {
//							printf("# use : 'key' : %s \n", key.c_str());
							(*pParrentObj)[key] = *pCurObj;
							pCurObj = &((*pParrentObj)[key]);
							key = "";
						}

					}break;
					default: {
						// parse error
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
//			printf("# parse : '}' \n");
			if( !parsePhpObjectStack.empty() ) {
				pParrentObj = parsePhpObjectStack.top();
				parsePhpObjectStack.pop();

			} else {
				bFlag = false;

			}

			if( !bFlag ) {
				// parse error
				break;

			} else {
				sep = index;

			}

		}break;
		case ';':{
//			printf("# parse : ';' \n");
			if( !parsePhpObjectStack.empty() ) {
				pParrentObj = parsePhpObjectStack.top();

			}

			string paramString = serializeString.substr(sep + 1, index - (sep + 1));
//			printf("# paramString : %s \n", paramString.c_str());
			vector<string> param = StringHandle::splitWithVector(paramString, ":");
			if( param.size() > 2 ) {
				if( param[0] == "s" && param.size() == 3 ) {
//					printf("# parse : 's' \n");
					if( pParrentObj != NULL ) {
						// parent node type
						switch( pParrentObj->mObjectType ) {
						case ObjectTypeArray: {
							// array (value1, value2...)
							value = StringHandle::replace(param[2], "\"", "");
							(*pParrentObj).Append(value);
//							printf("# value : %s \n", value.c_str());

						}break;
						case ObjectTypeMap: {
							// map (key => value)
//							printf("# map (key => value) \n");
							if( key.length() == 0 ) {
								key = StringHandle::replace(param[2], "\"", "");
//								printf("# key : %s \n", key.c_str());

							} else {
								value = StringHandle::replace(param[2], "\"", "");
//								printf("# value : %s \n", value.c_str());

								if( key.length() > 0 ) {
									(*pParrentObj)[key] = value;
									key = "";

								} else {
									// parse error
									bFlag = false;

								}
//								printf("# use : 'key' : %s, 'value' : %s \n", key.c_str(), value.c_str());
							}

						}break;
						default: {
							// parse error
							bFlag = false;

						}break;
						}

					} else {
						// current node
						value = StringHandle::replace(param[2], "\"", "");
						(*pCurObj) = value;

					}

				} else if( param[0] == "i" ) {
					// array object index, continue

				} else {
					// parse error
					bFlag = false;
					break;
				}
			}

			if( !bFlag ) {
				// parse error
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
