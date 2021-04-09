# Host: localhost  (Version: 5.7.26)
# Date: 2021-02-05 12:35:18
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tp_address"
#

DROP TABLE IF EXISTS `tp_address`;
CREATE TABLE `tp_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `region` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `name` varchar(10) NOT NULL,
  `moblie` varchar(11) NOT NULL,
  `is_default` int(1) DEFAULT '0' COMMENT '1为默认地址',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_address"
#


#
# Structure for table "tp_admin"
#

DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `reg_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '注册IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态  0 禁用，1正常',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限组',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

#
# Data for table "tp_admin"
#

INSERT INTO `tp_admin` VALUES (1,'admini','d93a5def7511da3d0f2d171d9c344e91','','铁公鸡','','https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200115\\1ed50a8ff67bedbe1d4794705868a234.jpg','127.0.0.1',1611064675,'39.149.12.184',1611064675,1,1,1540975213,0),(2,'admina','00b091d5bbbcbea4a371242e61d644a3','123@163.com','王五一','15237156573','https://hardphp.oss-cn-beijing.aliyuncs.com/vedios/20191220/044a612bd5f0874e669e0755f51ca93e.jpg','127.0.0.1',1540975213,'123.149.208.76',1579146396,1,1,1540975213,0),(60,'test','','','','','https://hardphp.oss-cn-beijing.aliyuncs.com/vedios/20191220/044a612bd5f0874e669e0755f51ca93e.jpg','127.0.0.1',1540975213,'0',1579104327,1,2,1540975213,1579104327),(5831189944471553,'123123','794484e50babce6d890d24bdbcd3a63b','123@123.com','1231','15237156573','https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200115\\1ed50a8ff67bedbe1d4794705868a234.jpg','127.0.0.1',0,'',1579104339,1,2,1579103200,1579104339),(6014628748464129,'3ewr23','42fa3e555eecf2754a3da41c5e86af35','','','','https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200115\\1ed50a8ff67bedbe1d4794705868a234.jpg','127.0.0.1',0,'',1579149556,1,2,1579146935,0),(6026749121007617,'2324dfsdf','80713128888be539a72c80820ea92649','','sdf','','https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200115\\1ed50a8ff67bedbe1d4794705868a234.jpg','127.0.0.1',0,'',1582174917,0,2,1579149824,1582174917);

#
# Structure for table "tp_api"
#

DROP TABLE IF EXISTS `tp_api`;
CREATE TABLE `tp_api` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `api_url` varchar(255) DEFAULT NULL,
  `is_unauth` tinyint(4) NOT NULL DEFAULT '1',
  `is_delete` tinyint(3) DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "tp_api"
#

/*!40000 ALTER TABLE `tp_api` DISABLE KEYS */;
INSERT INTO `tp_api` VALUES (1,'index','index/',1,0,1579104339,1540975213,0),(2,'api','api/',1,0,0,1540975213,0);
/*!40000 ALTER TABLE `tp_api` ENABLE KEYS */;

#
# Structure for table "tp_app"
#

DROP TABLE IF EXISTS `tp_app`;
CREATE TABLE `tp_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `appid` char(18) NOT NULL DEFAULT '' COMMENT '应用id',
  `app_salt` char(32) NOT NULL DEFAULT '' COMMENT '应用签名盐值',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) NOT NULL COMMENT '备注',
  `reg_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '注册IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态  0 禁用，1正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='app应用表';

#
# Data for table "tp_app"
#

INSERT INTO `tp_app` VALUES (1,'ty9fd2848a039ab554','ec32286d0718118861afdbf6e401ee81','管理员端','','127.0.0.1',1521305444,'123.149.208.76',1514962598,1,0);

#
# Structure for table "tp_article"
#

DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT 'seo描述',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0 禁用，1正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sorts` int(3) NOT NULL DEFAULT '100' COMMENT '排序',
  `cate_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类id',
  `column_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

#
# Data for table "tp_article"
#

INSERT INTO `tp_article` VALUES (1,'ty9fd2848a039ab554','管理员端',1582518981,1,1514962598,100,18716532003704833,7264324116680705,'https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200221\\c2a62a8dbba7ae828c5837291e170a4c.jpg'),(139843612476313601,'种田就是好','辅导费',1611054338,1,1611054251,100,139813928006979585,0,'');

#
# Structure for table "tp_article_categery"
#

DROP TABLE IF EXISTS `tp_article_categery`;
CREATE TABLE `tp_article_categery` (
  `id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0 禁用，1正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sorts` int(3) NOT NULL DEFAULT '100' COMMENT '排序',
  `column_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类表';

#
# Data for table "tp_article_categery"
#

INSERT INTO `tp_article_categery` VALUES (139813874135339009,'农村教育','',1611047161,1,1611047161,100,0),(139813928006979585,'科学种田','',1611047174,1,1611047174,100,0);

#
# Structure for table "tp_article_column"
#

DROP TABLE IF EXISTS `tp_article_column`;
CREATE TABLE `tp_article_column` (
  `id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `seo_title` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo关键词',
  `seo_dec` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo描述',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0 禁用，1正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sorts` int(3) NOT NULL DEFAULT '100' COMMENT '排序',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章栏目表';

#
# Data for table "tp_article_column"
#

INSERT INTO `tp_article_column` VALUES (1,'编程语言','ec32286d0718118861afdbf6e401ee81','管理员端',1579444850,1,1514962598,100,0),(7264107703177217,'数据库','1','1',1579445065,1,1579444834,100,0),(7264249676173313,'开发框架','','',1579444868,1,1579444868,100,0),(7264324116680705,'开发工具','','',1579444885,1,1579444885,100,0),(7264576798330881,'应用实例','','',1579444946,1,1579444946,100,0),(7264664253763585,'php','','',1579445040,1,1579444966,100,1),(7264796114292737,'golang','','',1579444998,1,1579444998,100,1),(7264844751441921,'python','','',1579445009,1,1579445009,100,1);

#
# Structure for table "tp_auth_group"
#

DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group` (
  `id` bigint(20) unsigned NOT NULL,
  `title` char(100) DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '为1正常，为0禁用',
  `rules` text COMMENT '用户组拥有的规则id， 多个规则","隔开',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';

#
# Data for table "tp_auth_group"
#

INSERT INTO `tp_auth_group` VALUES (1,'超级管理员',1,'139841475004469249,139852464659763201,139851555619868673,139850206312271873,139849545482899457,139833748324749313,7246645603471361,7247512280895489,7247267136409601,7247034964905985,43,44,39,40,1,38,7,2',1611056379,1544881719),(2,'普通管理员',1,'1,2',1542787522,1542787522),(6119919951417345,'工具人',1,'43,44',1611025613,1579172038);

#
# Structure for table "tp_auth_rule"
#

DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` bigint(20) unsigned NOT NULL,
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) DEFAULT '1' COMMENT '为1正常，为0禁用',
  `status` tinyint(1) DEFAULT '1' COMMENT '1 正常，0=禁用',
  `condition` char(100) DEFAULT '' COMMENT '规则表达式，为空表示存在就验证',
  `pid` bigint(20) DEFAULT '0' COMMENT '上级菜单',
  `sorts` mediumint(8) DEFAULT '0' COMMENT '升序',
  `icon` varchar(50) DEFAULT '',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `path` varchar(255) DEFAULT '' COMMENT '路经',
  `component` varchar(255) DEFAULT '' COMMENT '组件',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '左侧菜单 0==显示,1隐藏',
  `no_cache` tinyint(1) DEFAULT '0' COMMENT '1=不缓存，0=缓存',
  `always_show` tinyint(1) DEFAULT '0' COMMENT '1= 总显示,0=否 依据子菜单个数',
  `redirect` varchar(255) DEFAULT '',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则表';

#
# Data for table "tp_auth_rule"
#

INSERT INTO `tp_auth_rule` VALUES (1,'manage','权限管理',1,1,'',0,0,'component',1542602916,'/manage','layout',0,0,1,'',0),(2,'manage/admin','管理员列表',1,1,'',1,0,'user',1541666364,'admin','manage/admin',0,0,0,'',0),(7,'manage/rules','权限列表',1,1,'',1,0,'lock',1542353476,'rules','manage/rules',0,0,0,'',0),(38,'manage/roles','角色列表',1,1,'',1,0,'list',1542602805,'roles','manage/roles',0,0,0,'',0),(39,'log','日志管理',1,1,'',0,0,'component',1579436605,'/log','layout',0,0,1,'',0),(40,'log/log','登陆日志',1,1,'',39,0,'list',1579435976,'log','log/log',0,0,0,'',0),(43,'icon','图标管理',1,1,'',0,0,'component',1579436588,'/icon','layout',0,0,0,'',0),(44,'icon/index','图标列表',1,1,'',43,0,'list',0,'index','icons/index',0,0,0,'',0),(7246645603471361,'article','文章管理',1,1,'',0,0,'component',1579440670,'/article','layout',0,0,1,'',1579440670),(7247034964905985,'article/categery','分类列表',1,1,'',7246645603471361,0,'list',1579440763,'categery','article/categery',0,0,0,'',1579440763),(7247267136409601,'article/column','栏目列表',1,1,'',7246645603471361,0,'list',1579440819,'column','article/column',0,0,0,'',1579440819),(7247512280895489,'article/blog','文章列表',1,1,'',7246645603471361,0,'list',1579440877,'blog','article/blog',0,0,0,'',1579440877),(139833748324749313,'user','用户',1,1,'',0,0,'component',1611051899,'/user','layout',0,0,1,'noredirect',1611051899),(139841475004469249,'content','内容',1,1,'',0,0,'component',1611053741,'/content','layout',0,1,1,'noredirect',1611053741),(139849545482899457,'content/circle','圈子管理',1,1,'',139841475004469249,0,'list',1611055691,'/content/circle','layout',0,1,1,'noredirect',1611055665),(139850206312271873,'content/topic','话题管理',1,1,'',139841475004469249,0,'list',1611055823,'/content/topic','layout',0,1,1,'noredirect',1611055823),(139851555619868673,'content/talk','帖子管理',1,1,'',139841475004469249,0,'list',1611056145,'/content/talk','layout',0,1,1,'noredirect',1611056145),(139852464659763201,'content/disseminate','宣传页管理',1,1,'',139841475004469249,0,'list',1611056361,'/content/disseminate','layout',0,1,1,'noredirect',1611056361);

#
# Structure for table "tp_category"
#

DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  `is_top` int(1) DEFAULT '0' COMMENT '是否推荐   1推荐 ',
  `cover_image` varchar(255) DEFAULT '',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_category"
#

INSERT INTO `tp_category` VALUES (1,'互联网',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(2,'音乐',1,'https://oss.ymeoo.cn/20201128160653247473674.jpg'),(3,'生活',1,'https://oss.ymeoo.cn/20201128160653247734811.jpg'),(4,'爱好',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(5,'运动',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(6,'旅行',1,'https://oss.ymeoo.cn/20201128160653509571713.jpg'),(7,'知识',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(8,'动漫',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(9,'情感',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(10,'娱乐',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(11,'萌宠',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(13,'美食',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(14,'职场',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(15,'摄影',1,'https://oss.ymeoo.cn/20201128160655959720380.jpg'),(16,'时尚',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(17,'阅读',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg'),(18,'游戏',0,'https://oss.ymeoo.cn/20201128160653507763323.jpg');

#
# Structure for table "tp_comment"
#

DROP TABLE IF EXISTS `tp_comment`;
CREATE TABLE `tp_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_comment"
#


#
# Structure for table "tp_config"
#

DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `name` varchar(20) NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_config"
#

INSERT INTO `tp_config` VALUES ('wxpay','{\"appid\":\"wx88d4c53514cf8542\",\"mch_id\":\"1604616229\",\"key\":\"qoyjg782412587fghkyas98qw4b4trqw\"}');

#
# Structure for table "tp_discuss"
#

DROP TABLE IF EXISTS `tp_discuss`;
CREATE TABLE `tp_discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `introduce` varchar(255) NOT NULL,
  `read_count` int(255) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_discuss"
#


#
# Structure for table "tp_failed_jobs"
#

DROP TABLE IF EXISTS `tp_failed_jobs`;
CREATE TABLE `tp_failed_jobs` (
  `id` bigint(20) NOT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1=小程序，2=短信',
  `data` text COMMENT '数据',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='队列失败任务记录';

#
# Data for table "tp_failed_jobs"
#


#
# Structure for table "tp_follow"
#

DROP TABLE IF EXISTS `tp_follow`;
CREATE TABLE `tp_follow` (
  `uid` int(11) NOT NULL,
  `follow_uid` int(11) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`follow_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_follow"
#


#
# Structure for table "tp_goods"
#

DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `class_id` int(100) DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `introduce` text NOT NULL COMMENT '商品详情',
  `state` int(1) DEFAULT '0',
  `album` text COMMENT '商品相册',
  `cover_img` varchar(255) NOT NULL COMMENT '商品封面',
  `recommend` varchar(255) DEFAULT NULL COMMENT '推荐 ，1  购物车  2 我的',
  `unit` varchar(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_goods"
#

INSERT INTO `tp_goods` VALUES (26,1,1,'保温杯运动男士大容量水壶保温杯码便携学生304不锈钢1000ml杯子',39.00,'<p><img src=\"https://oss.ymeoo.cn/20201211160769756557941.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769758563186.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769759341651.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769762082286.jpg\" style=\"max-width:100%;\"></p>',0,'[\"https:\\/\\/oss.ymeoo.cn\\/20201211160769715281015.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769715258116.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769715278975.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769715280751.jpg\"]','https://oss.ymeoo.cn/20201211160769714517460.jpg',NULL,'件',1607697627),(27,1,1,'大学生书包女双肩包韩版简约时尚潮男大容量电脑包背包2020年新款',1.00,'<p><img src=\"https://oss.ymeoo.cn/20201211160769850152138.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769851568944.jpg\" style=\"max-width:100%;\"></p>',0,'[\"https:\\/\\/oss.ymeoo.cn\\/20201211160769849367718.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769849347169.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769849382771.jpg\"]','https://oss.ymeoo.cn/20201211160769848533177.jpg',NULL,'件',1607698519),(28,1,1,'蓝牙耳机头戴式无线发光炫酷潮男女通用带麦降噪音乐重低音耳麦学生电脑台式手机游戏专用有线轻便原装正品',129.00,'<p><img src=\"https://oss.ymeoo.cn/20201211160769879263265.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769880072294.jpg\" style=\"max-width:100%;\"></p><p><img src=\"https://oss.ymeoo.cn/20201211160769880638483.jpg\" style=\"max-width:100%;\"></p>',0,'[\"https:\\/\\/oss.ymeoo.cn\\/20201211160769876390939.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769876322040.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201211160769876354783.jpg\"]','https://oss.ymeoo.cn/20201211160769875716133.jpg',NULL,'件',1607698809),(29,1,1,'TaTanice 贺卡 圣诞节迷你花束礼品卡生日礼物明信片礼物创意卡片送男女朋友 四张装',0.01,'<p><img src=\"https://oss.ymeoo.cn/20201212160773614167742.jpg\" style=\"max-width:100%;\"><img src=\"https://oss.ymeoo.cn/20201212160773615865578.png\" style=\"max-width:100%;\"><img src=\"https://oss.ymeoo.cn/20201212160773616642523.png\" style=\"max-width:100%;\"></p>',0,'[\"https:\\/\\/oss.ymeoo.cn\\/20201212160773613538785.png\",\"https:\\/\\/oss.ymeoo.cn\\/20201212160773613520434.png\",\"https:\\/\\/oss.ymeoo.cn\\/20201212160773613589912.png\"]','https://oss.ymeoo.cn/20201212160773612966934.png',NULL,'件',1607736201);

#
# Structure for table "tp_goods_class"
#

DROP TABLE IF EXISTS `tp_goods_class`;
CREATE TABLE `tp_goods_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(10) NOT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_goods_class"
#

/*!40000 ALTER TABLE `tp_goods_class` DISABLE KEYS */;
INSERT INTO `tp_goods_class` VALUES (1,'数码影音',198798419),(2,'时尚美妆',7981961),(3,'潮流男装',98716987),(4,'精品女装',987941981),(5,'生活馆',98419841);
/*!40000 ALTER TABLE `tp_goods_class` ENABLE KEYS */;

#
# Structure for table "tp_group"
#

DROP TABLE IF EXISTS `tp_group`;
CREATE TABLE `tp_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_group"
#

INSERT INTO `tp_group` VALUES (1,'超级管理员',1587854384),(4,'演示用户',1608213269);

#
# Structure for table "tp_group_rule"
#

DROP TABLE IF EXISTS `tp_group_rule`;
CREATE TABLE `tp_group_rule` (
  `group_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_group_rule"
#

INSERT INTO `tp_group_rule` VALUES (4,1),(4,6),(4,25),(4,52),(4,51),(4,2),(4,7),(4,26),(4,8),(4,27),(4,3),(4,9),(4,10),(4,28),(4,12),(4,30),(4,53),(4,4),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,43),(4,55),(4,56),(4,57),(4,59),(4,5),(4,19),(4,20),(4,21),(4,22),(4,45),(4,23),(1,1),(1,6),(1,25),(1,52),(1,51),(1,2),(1,7),(1,26),(1,8),(1,27),(1,3),(1,9),(1,10),(1,11),(1,28),(1,29),(1,49),(1,50),(1,12),(1,30),(1,31),(1,32),(1,33),(1,34),(1,53),(1,54),(1,4),(1,13),(1,14),(1,35),(1,36),(1,37),(1,15),(1,38),(1,39),(1,40),(1,16),(1,41),(1,17),(1,42),(1,18),(1,43),(1,44),(1,55),(1,56),(1,58),(1,57),(1,59),(1,60),(1,5),(1,19),(1,20),(1,21),(1,22),(1,45),(1,46),(1,23),(1,47),(1,48),(1,24),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73);

#
# Structure for table "tp_image_hash"
#

DROP TABLE IF EXISTS `tp_image_hash`;
CREATE TABLE `tp_image_hash` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `hash` varchar(50) DEFAULT '' COMMENT '图片hash',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

#
# Data for table "tp_image_hash"
#

/*!40000 ALTER TABLE `tp_image_hash` DISABLE KEYS */;
INSERT INTO `tp_image_hash` VALUES (5819117802229761,'https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200115\\1ed50a8ff67bedbe1d4794705868a234.jpg','d3ab533b8b10e4f3daeee85dde4179df68cfcc4d',1579100321,1579100321),(19177852159266817,'https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20200221\\c2a62a8dbba7ae828c5837291e170a4c.jpg','b3857f39fb233da316eae01bbbedc67561519cdb',1582285292,1582285292),(139843661096685569,'https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20210119\\5c5160359c08e51314cbbee59ac95d20.png','666e02d7586c8d27df3dabe508a046922374d89e',1611054262,1611054262),(139843758127714305,'https://hardphp.oss-cn-beijing.aliyuncs.com\\images/20210119\\992d9022979922ef6393bf7db1651165.jpg','f10f05293dc0b53d79d155aea28cb374e8c1f7ed',1611054286,1611054286);
/*!40000 ALTER TABLE `tp_image_hash` ENABLE KEYS */;

#
# Structure for table "tp_link"
#

DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(1) DEFAULT '1' COMMENT '1轮播图 2导航菜单',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_link"
#

INSERT INTO `tp_link` VALUES (30,'数码影音','#','https://oss.ymeoo.cn/20201212160776609054256.png',2,1607766100),(31,'美妆护肤','#','https://oss.ymeoo.cn/20201212160776627959602.png',2,1607766281),(32,'时尚男装','#','https://oss.ymeoo.cn/20201212160776639421444.png',2,1607766397),(33,'精美女装','#','https://oss.ymeoo.cn/20201212160776647423175.png',2,1607766477),(34,'双12','#','https://oss.ymeoo.cn/20201212160776670459825.png',1,1607766707),(35,'11','#','https://oss.ymeoo.cn/20201212160776689222472.png',1,1607766893);

#
# Structure for table "tp_login_log"
#

DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `login_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `roles` varchar(50) NOT NULL DEFAULT '' COMMENT '角色',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员登录';

#
# Data for table "tp_login_log"
#

INSERT INTO `tp_login_log` VALUES (502,1,'admin','115.60.16.49',1569570610,'超级管理员',0,0),(503,1,'admin','115.60.16.49',1569570926,'超级管理员',0,0),(504,1,'admin','115.60.16.49',1569571106,'超级管理员',0,0),(505,1,'admin','115.60.16.49',1569571198,'超级管理员',0,0),(506,1,'admin','115.60.16.49',1569572567,'超级管理员',0,0),(507,1,'admin','115.60.16.49',1569572862,'超级管理员',0,0),(508,1,'admin','115.60.16.49',1569577336,'超级管理员',0,0),(509,1,'admin','115.60.16.49',1569577374,'超级管理员',0,0),(510,1,'admin','115.60.16.49',1569579992,'超级管理员',0,0),(511,1,'admin','115.60.16.49',1569580000,'超级管理员',0,0),(512,1,'admin','115.60.16.49',1569580041,'超级管理员',0,0),(513,1,'admin','115.60.16.49',1569580343,'超级管理员',0,0),(514,1,'admin','115.60.16.49',1569580809,'超级管理员',0,0),(515,1,'admin','115.60.16.49',1569580949,'超级管理员',0,0),(516,1,'admin','115.60.16.49',1569581081,'超级管理员',0,0),(517,1,'admin','115.60.16.49',1569581087,'超级管理员',0,0),(518,1,'admin','115.60.16.49',1569581136,'超级管理员',0,0),(519,1,'admin','115.60.16.49',1569581209,'超级管理员',0,0),(520,1,'admin','115.60.16.49',1569581628,'超级管理员',0,0),(521,1,'admin','115.60.16.49',1569581657,'超级管理员',0,0),(522,1,'admin','115.60.16.49',1569581699,'超级管理员',0,0),(523,1,'admin','115.60.16.49',1569581722,'超级管理员',0,0),(524,1,'admin','115.60.16.49',1569583325,'超级管理员',0,0),(525,1,'admin','115.60.19.188',1569634122,'超级管理员',0,0),(526,1,'admin','115.60.19.188',1569639797,'超级管理员',0,0),(527,1,'admin','115.60.19.188',1569639873,'超级管理员',0,0),(528,1,'admin','115.60.19.188',1569640203,'超级管理员',0,0),(529,1,'admin','115.60.19.188',1569640213,'超级管理员',0,0),(530,1,'admin','115.60.19.188',1569642217,'超级管理员',0,0),(531,1,'admin','39.149.247.160',1574342514,'超级管理员',0,0),(532,1,'admin','39.149.247.160',1574468895,'超级管理员',0,0),(533,1,'admin','223.88.30.142',1574846370,'超级管理员',0,0),(534,1,'admin','223.88.30.142',1574848961,'超级管理员',0,0),(535,1,'admin','223.88.30.142',1574849547,'超级管理员',0,0),(536,1,'admin','223.88.30.142',1574849754,'超级管理员',0,0),(537,1,'admin','223.88.30.142',1574850555,'超级管理员',0,0),(538,1,'admin','223.88.30.142',1574850985,'超级管理员',0,0),(139600432254291969,1,'admini','127.0.0.1',1610996272,'超级管理员',1610996272,1610996272),(139813320516571137,1,'admini','127.0.0.1',1611047029,'超级管理员',1611047029,1611047029),(139887333947346945,1,'admini','127.0.0.1',1611064675,'超级管理员',1611064675,1611064675);

#
# Structure for table "tp_message"
#

DROP TABLE IF EXISTS `tp_message`;
CREATE TABLE `tp_message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(255) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0未读，1已读',
  `type` int(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`m_id`) USING BTREE,
  UNIQUE KEY `from_uid` (`from_uid`,`to_uid`,`post_id`,`type`,`content`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_message"
#


#
# Structure for table "tp_notice_send_log"
#

DROP TABLE IF EXISTS `tp_notice_send_log`;
CREATE TABLE `tp_notice_send_log` (
  `id` bigint(20) NOT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1=小程序，2=公众号，3=短信',
  `data` text COMMENT '数据',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `result` text COMMENT '结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知消息发送记录';

#
# Data for table "tp_notice_send_log"
#


#
# Structure for table "tp_order"
#

DROP TABLE IF EXISTS `tp_order`;
CREATE TABLE `tp_order` (
  `id` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `goods_info` varchar(255) NOT NULL,
  `total_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(255) NOT NULL DEFAULT '0' COMMENT '-1=>''已取消'',0=>''待付款'',1=>''待发货'',2=>''待收货'',5=>''已完成''',
  `address_id` int(255) DEFAULT NULL,
  `express_company` varchar(255) DEFAULT NULL COMMENT '物流公司',
  `express_number` varchar(100) DEFAULT NULL COMMENT '物流单号',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tp_order"
#


#
# Structure for table "tp_post"
#

DROP TABLE IF EXISTS `tp_post`;
CREATE TABLE `tp_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT '0',
  `discuss_id` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `content` text,
  `media` text,
  `read_count` int(255) DEFAULT '0',
  `post_top` int(1) DEFAULT '0',
  `type` int(1) DEFAULT NULL COMMENT '帖子类型：1 图文 ，2视频 ，3文章',
  `longitude` double(10,6) DEFAULT '0.000000',
  `latitude` double(10,6) DEFAULT '0.000000',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_post"
#

INSERT INTO `tp_post` VALUES (1,1,0,0,'关于云喵圈子购买和使用说明','<section><section><p><img src=\"https://oss.ymeoo.cn/20201222160864104927633.png\" width=\"100%\"></p><p><br></p></section><section><h2><font><strong>欢迎加入云喵圈子</strong></font></h2><div><br></div></section><section><p>云喵圈子定位为移动端兴趣社区圈子系统，功能分为四大模块，分别为<font><b>圈子</b></font>、<b><font>话题</font></b>、<b><font>帖子</font></b>、<b><font>商城</font></b>，基于四大板块衍生出其他功能模块。</p><p><br></p><p>云喵圈子技术栈：<font><b>ThinkPHP6 + vue + uniapp</b></font>，前后端分离架构，使用户有更加良好的体验，uniapp的优势 是能让产品跨多个终端使用，在各平台小程序,H5,安卓APP，IOS等平台上运行（目前只适配微信小程序端）。</p><p><br></p><p><br></p></section><section><section><section style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: center; align-items: flex-start;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; width: 50%; overflow-wrap: break-word !important;\"><section style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: flex-end; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; font-size: 18px; letter-spacing: 1.5px; color: rgb(255, 255, 255); background: rgb(255, 86, 86); width: 30px; height: 30px; font-weight: bold; line-height: 30px; text-align: center; border-bottom-left-radius: 10px;\">1</section></section><section style=\"margin: -30px 0px 0px; padding: 1em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; box-shadow: rgb(242, 242, 242) 0px 0px 4px;\"><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 16px; letter-spacing: 1.5px; font-weight: bold;\">内容</section><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px; letter-spacing: 1.5px; color: rgb(116, 116, 116);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">以圈子、话题、帖子为单元的内容系统， 满足不同场景的内容需求。</span></section></section></section><section style=\"box-sizing:border-box;margin: 0px 0px 0px 10px; padding: 0px; max-width: 100%; width: 50%; overflow-wrap: break-word !important;\"><section style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: flex-end; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; font-size: 18px; letter-spacing: 1.5px; color: rgb(255, 255, 255); background: rgb(255, 86, 86); width: 30px; height: 30px; font-weight: bold; line-height: 30px; text-align: center; border-bottom-left-radius: 10px;\">2</section></section><section style=\"margin: -30px 0px 0px; padding: 1em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; box-shadow: rgb(242, 242, 242) 0px 0px 4px;\"><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 16px; letter-spacing: 1.5px; font-weight: bold;\">社交</section><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px; letter-spacing: 1.5px; color: rgb(116, 116, 116);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">点赞、关注、粉丝、私信、认证、分享等功能 增强用户互动性更强。</span></section></section></section></section><section style=\"margin: 1em 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: center; align-items: flex-start;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; width: 50%; overflow-wrap: break-word !important;\"><section style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: flex-end; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; font-size: 18px; letter-spacing: 1.5px; color: rgb(255, 255, 255); background: rgb(255, 86, 86); width: 30px; height: 30px; font-weight: bold; line-height: 30px; text-align: center; border-bottom-left-radius: 10px;\">3</section></section><section style=\"margin: -30px 0px 0px; padding: 1em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; box-shadow: rgb(242, 242, 242) 0px 0px 4px;\"><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 16px; letter-spacing: 1.5px; font-weight: bold;\">同城</section><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px; letter-spacing: 1.5px; color: rgb(116, 116, 116);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">同城动态，用户等，让社交更具现实意义。</span></section></section></section><section style=\"box-sizing:border-box;margin: 0px 0px 0px 10px; padding: 0px; max-width: 100%; width: 50%; overflow-wrap: break-word !important;\"><section style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: flex-end; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; font-size: 18px; letter-spacing: 1.5px; color: rgb(255, 255, 255); background: rgb(255, 86, 86); width: 30px; height: 30px; font-weight: bold; line-height: 30px; text-align: center; border-bottom-left-radius: 10px;\">4</section></section><section style=\"margin: -30px 0px 0px; padding: 1em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; box-shadow: rgb(242, 242, 242) 0px 0px 4px;\"><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 16px; letter-spacing: 1.5px; font-weight: bold;\">变现</section><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 14px; letter-spacing: 1.5px; color: rgb(116, 116, 116);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">圈子付费、广告分成、文章打赏、电商系统，无论你是自媒体还是电商运营，都能轻松变现</span></section></section></section></section></section></section><section><section><br></section><section><font><br></font></section><section><font>系统的使用以及版权问题：</font></section><section><font>系统有：免费版本、基础商业授权版、尊享版</font></section></section><section><section><section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 10px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: inline-block; background: rgb(255, 255, 255);\"><section style=\"margin: 0px; padding: 6px 2em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; letter-spacing: 2px; color: rgb(255, 255, 255); font-weight: bold; background: rgb(255, 98, 55); border-radius: 30px; box-shadow: rgb(239, 88, 10) 3px 3px 1px;\">免费版本</section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: -16px 16px 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background: rgb(255, 245, 247);\"><section style=\"margin: 0px; padding: 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-left: 1px solid rgb(252, 122, 154); border-right: 1px solid rgb(252, 122, 154);\"><section style=\"margin: 0px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 16px; letter-spacing: 1.5px; color: rgb(255, 83, 36); font-weight: bold; text-align: left;\"><h4 style=\"margin: 0px 16px; padding: 0px; font-weight: bold; font-size: 14px; max-width: 100%; text-align: center; line-height: 2; color: rgb(239, 72, 104); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">0费用/永久</h4></section><section style=\"margin: 15px 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; text-align: justify; line-height: 1.75em; letter-spacing: 1.5px; font-size: 14px; color: rgb(255, 83, 36);\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">授权期限：永久</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">适用范围：个人学习使用，不得用于商业运营</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">技术支持：技术支持微信群</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">软件源码：可获得uniapp端代码 + php服务端代码</section></section></section></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 10px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: inline-block; background: rgb(255, 255, 255);\"><section style=\"margin: 0px; padding: 6px 2em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; letter-spacing: 2px; color: rgb(255, 255, 255); font-weight: bold; background: rgb(255, 98, 55); border-radius: 30px; box-shadow: rgb(239, 88, 10) 3px 3px 1px;\">基础商业授权版</section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: -16px 16px 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background: rgb(255, 245, 247);\"><section style=\"margin: 0px; padding: 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-left: 1px solid #fc7a9a; border-right: 1px solid #fc7a9a;\"><section style=\"margin: 0px 16px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; font-size: 16px; letter-spacing: 1.5px; color: #ff5324; font-weight: bold; text-align: center; overflow-wrap: break-word !important;\">￥1280/永久</section><section style=\"margin: 15px 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; text-align: justify; line-height: 1.75em; letter-spacing: 1.5px; font-size: 14px; color: #ff5324;\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">授权期限：永久</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">适用范围：用于商业运营的歌人或者企业</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">技术支持：提供安装服务以及售后专人技术支持</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">二次开发：可进行二次开发，不提供开发咨询以及文档</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">软件源码：可获得uniapp端代码 + php服务端代码</section></section></section></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: -20px 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: center; align-items: center;\"><section style=\"margin: 0px; padding: 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background: #ffffff;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 40px;\"><img src=\"https://mmbiz.qpic.cn/mmbiz_png/Tp84DWic4ekiabgD1fpibUkQoTDcdPdZicsB6Jcx8SZCSHF6Ahk9Pvp4uXnpSwLWw5KoWlWFxdVtm3ib56lXK8JQiaAg/640?wx_fmt=png\" alt=\"图片\" style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; display: block; width: 100%; overflow-wrap: break-word !important; height: auto !important; visibility: visible !important;\"></section></section></section></section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 10px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: inline-block; background: rgb(255, 255, 255);\"><section style=\"margin: 0px; padding: 6px 2em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px; letter-spacing: 2px; color: rgb(255, 255, 255); font-weight: bold; background: rgb(255, 98, 55); border-radius: 30px; box-shadow: rgb(239, 88, 10) 3px 3px 1px;\">尊享版</section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: -16px 16px 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px; padding: 0px 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background: rgb(255, 245, 247);\"><section style=\"margin: 0px; padding: 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-left: 1px solid #fc7a9a; border-right: 1px solid #fc7a9a;\"><section style=\"margin: 0px 16px; padding: 4px 0em; max-width: 100%; box-sizing: border-box; font-size: 16px; letter-spacing: 1.5px; color: rgb(255, 83, 36); font-weight: bold; text-align: center; overflow-wrap: break-word !important;\">￥2580/永久</section><section style=\"margin: 15px 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; text-align: justify; line-height: 1.75em; letter-spacing: 1.5px; font-size: 14px; color: #ff5324;\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">适用范围：用于商业运营的个人或者企业</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">技术支持：提供安装服务以及售后专人技术支持</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">二次开发：提供二次开发说明文档，提供二开技术咨询服务</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">软件源码：可获得uniapp端代码 + php服务端代码 + vue管理后台代码</section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: space-between; align-items: flex-end;\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 1px; height: 30px; background: rgb(252, 122, 154); overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section><section style=\"margin: 0px 1em; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"box-sizing:border-box;margin: 0px 16px; padding: 0px; max-width: 100%; width: 100%; height: 1px; background: red; overflow: hidden; overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: -20px 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; display: flex; justify-content: center; align-items: center;\"><section style=\"margin: 0px; padding: 0px 10px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; background: rgb(255, 255, 255);\"><section style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word !important; width: 40px;\"><img src=\"https://mmbiz.qpic.cn/mmbiz_png/Tp84DWic4ekiabgD1fpibUkQoTDcdPdZicsB6Jcx8SZCSHF6Ahk9Pvp4uXnpSwLWw5KoWlWFxdVtm3ib56lXK8JQiaAg/640?wx_fmt=png\" alt=\"图片\" style=\"box-sizing:border-box;margin: 0px; padding: 0px; max-width: 100%; display: block; width: 100%; overflow-wrap: break-word !important; height: auto !important; visibility: visible !important;\"></section></section></section></section><section style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(97, 97, 97); font-size: medium; box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: 微软雅黑;\">云喵圈子还存在着许多缺陷，但我们会持续的自我进化，从用户体验以及经营者角度进行全面的优化和改善。</span></section><section style=\"margin: 0px 16px; padding: 0px; max-width: 100%; color: rgb(51, 51, 51); font-size: 17px; font-weight: normal; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); box-sizing: border-box !important; overflow-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></section></section></section></section><section>官网：<font>https://www.ymeoo.cn</font></section><section>码云：<font>https://gitee.com/ym721/cloud-meow-uni</font></section><section><strong>添加微信拉入交流群：<br><img src=\"https://oss.ymeoo.cn/20201222160864279924043.jpg\" style=\"max-width:100%;\" width=\"50%\"></strong></section></section>','https://oss.ymeoo.cn/20201224160881852415469.png',136,0,3,0.000000,0.000000,1608643255),(2,1,2,0,'mmm','你看恋人交换信物，\n或是冬夜降下大雾，\n等到破碎之际万物都曾值得被爱护','[\"https:\\/\\/oss.ymeoo.cn\\/20201128160653521979486.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653522244960.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653522536967.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653522815722.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653523097478.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653523360249.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653523545651.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653523875344.jpeg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653524074621.jpeg\"]',263,3,1,0.000000,0.000000,1606535242),(5,2,2,0,'mm','热爱你的热爱','[\"https:\\/\\/oss.ymeoo.cn\\/20201128160653772614500.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653772828548.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653773051345.jpg\"]',96,0,1,0.000000,0.000000,1606537732),(6,2,2,0,'m','坐看云起时','[\"https:\\/\\/oss.ymeoo.cn\\/20201128160653801914876.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653802141371.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653802389221.jpg\",\"https:\\/\\/oss.ymeoo.cn\\/20201128160653802569363.jpg\"]',164,1,1,0.000000,0.000000,1606538028);

#
# Structure for table "tp_post_collection"
#

DROP TABLE IF EXISTS `tp_post_collection`;
CREATE TABLE `tp_post_collection` (
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_post_collection"
#


#
# Structure for table "tp_post_fabulous"
#

DROP TABLE IF EXISTS `tp_post_fabulous`;
CREATE TABLE `tp_post_fabulous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_post_fabulous"
#


#
# Structure for table "tp_rule"
#

DROP TABLE IF EXISTS `tp_rule`;
CREATE TABLE `tp_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(2) DEFAULT NULL,
  `icon` varchar(255) DEFAULT '',
  `url` varchar(100) DEFAULT '',
  `name` varchar(255) NOT NULL,
  `is_menu` int(2) NOT NULL DEFAULT '0' COMMENT '0不显示菜单，1显示菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_rule"
#

INSERT INTO `tp_rule` VALUES (1,0,'','/','首页',1),(2,0,'','/wechat-mini','全局',1),(3,0,'','/user-list','用户',1),(4,0,'','/topic-list','内容',1),(5,0,'','/order-list','商城',1),(6,1,'el-icon-stopwatch','/','系统信息',1),(7,2,'el-icon-news','/wechat-mini','微信小程序',1),(8,2,'el-icon-upload','/upload-set','上传配置',1),(9,3,'el-icon-user-solid','/user-list','用户管理',1),(10,3,'el-icon-connection','/user-role','权限管理',1),(11,10,'el-icon-menu','/admin-list','管理员',1),(12,10,'el-icon-menu','/user-role','角色管理',1),(13,4,'el-icon-s-help','/topic-list','圈子管理',1),(14,13,'el-icon-menu','/topic-class','圈子类目',1),(15,13,'el-icon-menu','/topic-list','圈子列表',1),(16,4,'el-icon-menu','/discuss-list','话题管理',1),(17,4,'el-icon-chat-square','/post-list','帖子管理',1),(18,4,'el-icon-chat-dot-round','/comment-list','评论管理',1),(19,5,'el-icon-document','/order-list','商城配置',1),(20,19,'el-icon-document','/swiper-list','轮播图',1),(21,19,'el-icon-document','/nav-list','导航菜单',1),(22,5,'el-icon-document','/order-list','订单列表',1),(23,5,'el-icon-shopping-bag-2','/goods-list','商品列表',1),(24,5,'el-icon-sell','/goods-add','添加商品',1),(25,6,'','api/system/statistics','查看',0),(26,7,'','api/system/miniConfig','查看',0),(27,8,'','api/system/uploadConfig','查看',0),(28,11,'','api/user/adminList','查看',0),(29,11,'','api/user/adminAdd','添加',0),(30,12,'','api/user/roleList','查看',0),(31,12,'','api/user/roleDel','删除',0),(32,12,'','/api/user/roleAdd','添加',0),(33,12,'','api/user/roleRuleList','编辑',0),(34,12,'','api/user/userRuleSave','编辑-保存',0),(35,14,'','api/topic/cateAddEdit','添加',0),(36,14,'','api/topic/cateDel','删除',0),(37,14,'','api/topic/cateAddEdit','编辑',0),(38,15,'','api/topic/topicAdd','添加',0),(39,15,'','api/topic/topicDel','删除',0),(40,15,'','api/topic/topicEdit','编辑',0),(41,16,'','api/discuss/del','删除',0),(42,17,'','api/post/del','删除',0),(43,18,'','api/post/commentList','查看',0),(44,18,'','api/post/commentDel','删除',0),(45,22,'','api/order/list','查看',0),(46,22,'','api/order/del','删除',0),(47,23,'','api/goods/del','删除',0),(48,23,'','api/goods/add','添加',0),(49,11,'','api/user/saveUserInfo','编辑',0),(50,11,'','api/user/delAdmin','删除',0),(51,1,'el-icon-s-data','/statistics','营销数据',1),(52,6,'','api/system/sysInfo','查看',0),(53,3,'el-icon-position','/send-message','推送消息',1),(54,53,'','api/message/sendArticle','发送',0),(55,4,'el-icon-picture-outline','/article-list','图文管理',1),(56,55,'el-icon-edit-outline','/article-add','新建图文',1),(57,55,'el-icon-s-order','/article-list','图文列表',1),(58,56,'','api/post/articleAdd','保存',0),(59,57,'','api/post/articleList','查看',0),(60,57,'','api/post/editPost','编辑',0),(61,7,'','api/system/baseSet','保存',0),(62,2,'el-icon-wallet\r\nel-icon-wallet\r\nel-icon-mobile','/pay-set','微信支付',1),(63,62,'','api/common/setConfig','查看',0),(64,63,'','api/common/getConfig','编辑',0),(65,22,'','api/order/orderExpress','订单发货',0),(66,8,'','api/system/uploadType','编辑',0),(67,9,'','api/user/delUser','删除',0),(68,9,'','api/user/Changedel','批量删除',0),(69,12,'','api/user/roleAdd','添加',0),(70,18,'','api/post/ChangeCommentdel','批量删除',0),(71,19,'','api/link/add','保存配置',0),(72,19,'','api/link/del','删除配置',0),(73,3,'','api/user/editAdmin','保存管理员信息',0);

#
# Structure for table "tp_sms"
#

DROP TABLE IF EXISTS `tp_sms`;
CREATE TABLE `tp_sms` (
  `id` bigint(20) unsigned NOT NULL,
  `phone` char(11) NOT NULL COMMENT '手机号',
  `code` varchar(10) NOT NULL COMMENT '验证码',
  `ip` varchar(50) NOT NULL COMMENT 'ip地址',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=注册，2=登录，3=找回密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 未使用，1已使用',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机验证码';

#
# Data for table "tp_sms"
#


#
# Structure for table "tp_system"
#

DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system` (
  `config` varchar(50) NOT NULL,
  `value` text,
  `extend` text,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_system"
#

INSERT INTO `tp_system` VALUES ('miniapp','','',''),('uploadType','2','{\"endpoint\":\"\",\"OssName\":\"\",\"accessKeyId\":\"\",\"accessKeySecret\":\"\"}',''),('wxpay',NULL,NULL,NULL);

#
# Structure for table "tp_topic"
#

DROP TABLE IF EXISTS `tp_topic`;
CREATE TABLE `tp_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `topic_name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `cover_image` varchar(100) DEFAULT '',
  `bg_image` varchar(100) DEFAULT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_topic"
#

INSERT INTO `tp_topic` VALUES (1,1,2,'音乐资讯站','你的音乐杂志','https://oss.ymeoo.cn/20201128160653247473674.jpg','https://oss.ymeoo.cn/20201128160653247734811.jpg',1606532480),(2,1,2,'手机也能拍大片','这里是手机摄影， 爱生活，爱拍照，小小手机记录万千世界。欢迎各位大佬及萌新的到来，共同营造良好的话题氛围','https://oss.ymeoo.cn/20201128160653507763323.jpg','https://oss.ymeoo.cn/20201128160653509571713.jpg',1606535097),(3,1,15,'爱摄影','欢迎各位摄影爱好者发布原创摄影作品','https://oss.ymeoo.cn/20201128160655958864152.jpg','https://oss.ymeoo.cn/20201128160655959720380.jpg',1606559605),(4,1,13,'关乎吃货的尊严','世间万物，唯有美食与爱不可辜负。','https://oss.ymeoo.cn/20201128160655979657178.jpg','https://oss.ymeoo.cn/20201128160655984466197.jpg',1606559848),(5,1,16,'男生穿搭','欢迎分享男生喜欢的穿搭，禁交友宣群卖衣服单纯发自拍，文明上网，玩得愉快','https://oss.ymeoo.cn/20201128160655996446289.jpg','https://oss.ymeoo.cn/20201128160655996882177.jpg',1606559972),(8,1,9,'文案馆','写进心里的文案～','https://oss.ymeoo.cn/20201203160699487025922.jpg','https://oss.ymeoo.cn/20201203160699489527608.jpg',1606994899),(11,2,2,'网抑云','网抑云','https://oss.ymeoo.cn/20201205160715631525159.jpg','https://oss.ymeoo.cn/20201205160715632261962.jpg',1607156325),(12,1,1,'产品运营社','互联网营销，公众号运营，短视频运营交流社区','https://oss.ymeoo.cn/20201205160718345522054.jpg','https://oss.ymeoo.cn/20201205160718346012305.jpg',1607183463),(14,1,1,'网站SEO','SEO优化交流','https://oss.ymeoo.cn/20201206160722681352740.jpg','https://oss.ymeoo.cn/20201206160722681610198.jpg',1607226820),(15,1,1,'公众号运营','公众号运营、引流推广技巧分享交流','https://oss.ymeoo.cn/20201206160722684430192.jpg','https://oss.ymeoo.cn/20201206160722684766301.jpg',1607226853),(16,1,1,'短视频运营','抖音、快手、视频号运营交流','https://oss.ymeoo.cn/20201206160722688860413.jpg','https://oss.ymeoo.cn/20201206160722689144175.jpg',1607226894);

#
# Structure for table "tp_topic_cate"
#

DROP TABLE IF EXISTS `tp_topic_cate`;
CREATE TABLE `tp_topic_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_topic_cate"
#

INSERT INTO `tp_topic_cate` VALUES (1,'情感'),(2,'摄影'),(3,'校园'),(4,'头像'),(5,'爱好');

#
# Structure for table "tp_user"
#

DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `openid` varchar(150) NOT NULL DEFAULT '' COMMENT '微信身份标识',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '32位小写MD5密码',
  `phone` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像URL',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别标志：0，其他；1，男；2，女',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `birth` varchar(50) NOT NULL DEFAULT '' COMMENT '生日',
  `descript` varchar(200) NOT NULL DEFAULT '',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户总金额',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '注册IP',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP',
  `login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主系统用户表。';

#
# Data for table "tp_user"
#

INSERT INTO `tp_user` VALUES (1,'','','15237156573','12312333',1,'xiegaolei','/uploads/images/20180512/6c7cf3ee6e3e83c031e260c5fa0844fb.jpg',0,20210.00,'1989-10-10','我要给你一个拥抱 给你一双温热手掌',525225.00,1515057952,'123.149.214.69','',0,0,0),(10,'','','','',1,'','',0,0.00,'','',0.00,0,'','',0,0,0);

#
# Structure for table "tp_user_discuss"
#

DROP TABLE IF EXISTS `tp_user_discuss`;
CREATE TABLE `tp_user_discuss` (
  `uid` int(11) NOT NULL,
  `discuss_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_user_discuss"
#


#
# Structure for table "tp_user_topic"
#

DROP TABLE IF EXISTS `tp_user_topic`;
CREATE TABLE `tp_user_topic` (
  `uid` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`topic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tp_user_topic"
#


#
# Structure for table "ym_user"
#

DROP TABLE IF EXISTS `ym_user`;
CREATE TABLE `ym_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `gender` int(1) NOT NULL DEFAULT '0',
  `province` varchar(10) DEFAULT '',
  `city` varchar(20) DEFAULT '',
  `openid` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `intro` varchar(255) DEFAULT '这个人很懒，没留下什么',
  `integral` int(255) DEFAULT '0',
  `last_login_ip` varchar(20) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `tag_str` varchar(255) DEFAULT NULL COMMENT '用户标签，json格式',
  `type` int(1) DEFAULT '0' COMMENT '0为普通用户，1为官方账号',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "ym_user"
#

INSERT INTO `ym_user` VALUES (1,'Teen',NULL,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/6PMqUSuX5LyZZT998dVicoZGwrrIahcsS6iaDXK23FoKZ8bzafVhiabjFicF1tmfbWAvEFGcW2YhzSYetIqXK95z7A/132',1,'云南','昭通','ocob94nVZnLv9fA-zE6xTXucjyf4',0,'我来自偶然 像一颗尘土',0,NULL,1606788177,'[\"\\u5708\\u5b50\\u8fbe\\u4eba\",\"\\u65c5\\u884c\",\"\\u70ed\\u7231\\u751f\\u6d3b\",\"\\u6469\\u7faf\\u5ea7\",\"\\u6444\\u5f71\",\"\\u770b\\u7535\\u5f71\"]',0,1605669845),(2,'喵大人',NULL,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/iaM90nWSxZicQq9IZ6EnSzyLY6wibXrVrQr4XdKiaQGZIY4ykiaC9LRUhMHNRdbRMq3Hge452iajb9LY18ZAEdLiaaj1w/132',1,'云南','昆明','ocob94vctwF7agjtaIWPn7QTmfGU',0,'',0,NULL,1607235520,'[\"\\u5708\\u5b50\\u8fbe\\u4eba\",\"\\u65c5\\u884c\",\"\\u70ed\\u7231\\u751f\\u6d3b\",\"\\u6469\\u7faf\\u5ea7\",\"\\u6444\\u5f71\",\"\\u770b\\u7535\\u5f71\",\"\\u542c\\u6b4c\"]',0,1605939163);
