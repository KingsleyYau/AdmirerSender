<?php
	
	$input = 'a:5:{i:0;a:15:{s:8:"admireId";s:7:"DDIHJIE";s:10:"admireInfo";s:0:"";s:8:"birthday";s:10:"1991-04-12";s:7:"country";s:5:"China";s:9:"firstname";s:3:"wei";s:6:"height";s:3:"160";s:2:"id";s:5:"42871";s:8:"lastname";s:4:"song";s:5:"marry";s:1:"1";s:5:"owner";s:4:"P216";s:8:"province";s:5:"HuNan";s:9:"send_time";s:19:"2018-04-16 02:32:09";s:13:"template_type";s:1:"A";s:6:"weight";s:2:"46";s:7:"womanid";s:7:"P294670";}i:1;a:15:{s:8:"admireId";s:7:"CDIHIDB";s:10:"admireInfo";s:0:"";s:8:"birthday";s:10:"1973-10-27";s:7:"country";s:5:"China";s:9:"firstname";s:5:"fanny";s:6:"height";s:3:"163";s:2:"id";s:5:"42952";s:8:"lastname";s:3:"liu";s:5:"marry";s:1:"2";s:5:"owner";s:4:"P216";s:8:"province";s:5:"HuNan";s:9:"send_time";s:13:"2018-04-16 02";s:13:"template_type";s:1:"A";s:6:"weight";s:2:"55";s:7:"womanid";s:7:"P557701";}i:2;a:15:{s:8:"admireId";s:7:"BDIHGHI";s:10:"admireInfo";s:0:"";s:8:"birthday";s:10:"1991-10-03";s:7:"country";s:5:"China";s:9:"firstname";s:4:"lily";s:6:"height";s:3:"161";s:2:"id";s:5:"43506";s:8:"lastname";s:4:"xiao";s:5:"marry";s:1:"1";s:5:"owner";s:4:"P216";s:8:"province";s:5:"HuNan";s:9:"send_time";s:13:"2018-04-16 02";s:13:"template_type";s:1:"A";s:6:"weight";s:2:"48";s:7:"womanid";s:7:"P686274";}i:3;a:15:{s:8:"admireId";s:7:"ADIHFCF";s:10:"admireInfo";s:200:"ä»¥ä¸Šè­¯æ–‡ä¸€èµ·ç™¼é€çµ¦ç”·å£«ï¼Œè«‹å‹¾ä»¥ä¸Šè­¯æ–‡ä¸€èµ·ç™¼é€çµ¦ç”·å£«ï¼Œè«‹å‹¾ä»¥ä¸Šè­";s:8:"birthday";s:10:"1987-05-14";s:7:"country";s:5:"China";s:9:"firstname";s:3:"Liu";s:6:"height";s:3:"163";s:2:"id";s:1:"1";s:8:"lastname";s:6:"Huijia";s:5:"marry";s:1:"1";s:5:"owner";s:3:"GZA";s:8:"province";s:8:"Shanghai";s:9:"send_time";s:13:"2018-04-16 02";s:13:"template_type";s:1:"B";s:6:"weight";s:2:"50";s:7:"womanid";s:8:"GZA21001";}i:4;a:15:{s:8:"admireId";s:7:"JDIIJAB";s:10:"admireInfo";s:103:"csdfdsdsfdfafdsfsdfsdfdsfds
	fdsffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	fdfdsfdsfds";s:8:"birthday";s:10:"1966-04-28";s:7:"country";s:5:"China";s:9:"firstname";s:7:"Hongmei";s:6:"height";s:3:"166";s:2:"id";s:4:"4830";s:8:"lastname";s:3:"Zhu";s:5:"marry";s:1:"2";s:5:"owner";s:4:"P201";s:8:"province";s:5:"Hebei";s:9:"send_time";s:13:"2018-04-16 02";s:13:"template_type";s:1:"B";s:6:"weight";s:2:"55";s:7:"womanid";s:8:"P2017108";}}';

	print("########## vector ########\n");
	$vector = array(
		array("key"=>"vector1"),
		array("key"=>"vector2")
	);
	$str = serialize($vector);
//	var_dump($str);
	
	print("########## map ########\n");
	$map = array("key"=>"map1","key2"=>"map2");
	$str = serialize($map);
//	var_dump($str);
	
	print("########## input ########\n");
	$obj = unserialize($input);
	var_dump($obj);
//	print_r($session_data);
	
?>