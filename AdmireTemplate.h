/*
 * AdmireTemplate.h
 *
 *  Created on: 2015-12-2
 *      Author: Max
 */

#ifndef ADMIRETEMPLATE_H_
#define ADMIRETEMPLATE_H_

#include <string>
#include <list>
using namespace std;

class AdmireTemplate {
public:
	AdmireTemplate() {
		Reset();
	}

	virtual ~AdmireTemplate(){

	}

	AdmireTemplate(const AdmireTemplate& item){
		templateCode = item.templateCode;
		at_greet = item.at_greet;
		at_content_en = item.at_content_en;
		at_show_cn = item.at_show_cn;
		at_content_cn = item.at_content_cn;
		templateType = item.templateType;
		vg_id = item.vg_id;
		at_code = item.at_code;
		std::copy(item.attachmentList.begin(), item.attachmentList.end(), std::back_inserter(attachmentList));
	}

	AdmireTemplate& operator=(const AdmireTemplate& item) {
		templateCode = item.templateCode;
		at_greet = item.at_greet;
		at_content_en = item.at_content_en;
		at_show_cn = item.at_show_cn;
		at_content_cn = item.at_content_cn;
		templateType = item.templateType;
		vg_id = item.vg_id;
		at_code = item.at_code;
		std::copy(item.attachmentList.begin(), item.attachmentList.end(), std::back_inserter(attachmentList));
		return *this;
	}

	void Reset() {
		templateCode = "";
		at_greet = "";
		at_content_en = "";
		at_show_cn = "";
		at_content_cn = "";
		templateType = "";
		vg_id = "";
		at_code = "";
		attachmentList.clear();
	}

	string templateCode;
	string at_greet;
	string at_content_en;;
	string at_show_cn;
	string at_content_cn;
	string templateType;
	string vg_id;
	string at_code;

	// 附件
	list<string> attachmentList;
};

#endif /* ADMIRETEMPLATE_H_ */
