-- MySQL dump 10.13  Distrib 5.7.20, for osx10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: cyfm
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cy_sys_authorize`
--

DROP TABLE IF EXISTS `cy_sys_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_authorize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target_id` bigint(20) NOT NULL,
  `auth_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_authorize`
--

LOCK TABLES `cy_sys_authorize` WRITE;
/*!40000 ALTER TABLE `cy_sys_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `cy_sys_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_permission`
--

DROP TABLE IF EXISTS `cy_sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_permission`
--

LOCK TABLES `cy_sys_permission` WRITE;
/*!40000 ALTER TABLE `cy_sys_permission` DISABLE KEYS */;
INSERT INTO `cy_sys_permission` VALUES (1,'创建权限','create','资源的创建权限----值为:create 实际用法 资源标识:create'),(2,'修改权限','update','资源的创建权限----值为:update 实际用法 资源标识:update '),(3,'删除权限','delete','资源的删除权限----值为:delete 实际用法 资源标识:delete '),(4,'查看权限','view','资源的查看权限----值为:view 实际用法 资源标识:view  '),(5,'导入权限','import','资源的导入权限----值为:import 实际用法 资源标识:import '),(6,'导出权限','export','资源的导出权限----值为:export 实际用法 资源标识:export ');
/*!40000 ALTER TABLE `cy_sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_resource`
--

DROP TABLE IF EXISTS `cy_sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `_identity` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `resource_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_resource`
--

LOCK TABLES `cy_sys_resource` WRITE;
/*!40000 ALTER TABLE `cy_sys_resource` DISABLE KEYS */;
INSERT INTO `cy_sys_resource` VALUES (1,'系统功能','icon-th-large','root',0,'0','/',1,'',0),(20,'系统管理','fa fa-cogs','sys',1,'01/','',1,'',0),(21,'用户管理','fa fa-user','sys:user',20,'01/20/','/sys/user',1,'',0),(22,'团队管理','fa fa-users','sys:team',20,'01/20/','/sys/team',2,'\0',0),(23,'角色管理','ztree_file','sys:role',20,'01/20/','/sys/role',3,'',0),(24,'权限管理','icon-refresh','sys:permission',20,'01/20/','/sys/permission',4,'\0',0),(25,'授权管理','icon-refresh','sys:authorize',20,'01/20/','/sys/authorize',5,'\0',0),(26,'资源管理','icon-refresh','sys:resource',20,'01/20/','/sys/resource',6,'',0),(30,'系统监控','fa fa-cogs','monitor',1,'01/','',2,'\0',0),(31,'Druid监控','ztree_file','monitor:druid',30,'01/30/','/manage/monitor/druid/index.html',1,'',0),(32,'JVM监控','ztree_file','monitor:jvm',30,'01/30/','/manage/monitor/jvm',2,'',0),(33,'SQL/JPQL操作','ztree_file','monitor:ql',30,'01/30/','/manage/monitor/db/sql',3,'',0),(34,'Ehcache监控','ztree_file','monitor:ehcache',30,'01/30/','/manage/monitor/ehcache',4,'',0),(35,'Hibernate监控','ztree_file','monitor:hibernate',30,'01/30/','/manage/monitor/hibernate',5,'',0),(40,'系统维护','ztree_file','',1,'01/','',3,'\0',0),(41,'静态资源管理','ztree_file','',40,'01/40/','/manage/maintain/staticResource',1,'',0),(50,'演示功能','ztree_file','',1,'01/','',4,'\0',0),(51,'dialog演示','ztree_file','',50,'01/50/','/demo/ui/dialog',1,'',0),(1000,'基础信息维护','ztree_file','',1,'01/','',5,'',0),(1001,'实验计划管理','ztree_file','',1,'01/','',6,'',0),(1002,'专业管理','ztree_file','info:major',1000,'01/1000/','/info/major',1,'',0),(1003,'年级管理','ztree_file','info:grade',1000,'01/1000/','/info/grade',2,'',0),(1004,'班级管理','ztree_file','info:classes',1000,'01/1000/','/info/classes',3,'',0),(1005,'课程管理','ztree_file','info:course',1000,'01/1000/','/info/course',4,'',0),(1006,'实验场地管理','ztree_file','info:experimentPlace',1000,'01/1000/','/info/experimentPlace',5,'',0),(1007,'实验设备管理','ztree_file','info:experimentDevice',1000,'01/1000/','/info/experimentDevice',6,'',0),(1008,'我的实验计划','ztree_file','experi:experimentPlan',1001,'01/1001/','/experi/experimentPlan',1,'',0),(1009,'实验计划审核','ztree_file','experi:planApprove',1001,'01/1001/','/experi/planApprove',2,'',0),(1010,'实验项目管理','ztree_file','experi:experimentProject',1001,'01/1001/','',3,'',0),(1011,'基础信息上传','ztree_file','info:excelImport',1000,'01/1000/','/excel/infoImport',7,'',0),(1012,'报表导出','ztree_file','excel:export',1001,'01/1001/','/excel/report',4,'',0);
/*!40000 ALTER TABLE `cy_sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_role`
--

DROP TABLE IF EXISTS `cy_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `permissions` text,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_role`
--

LOCK TABLES `cy_sys_role` WRITE;
/*!40000 ALTER TABLE `cy_sys_role` DISABLE KEYS */;
INSERT INTO `cy_sys_role` VALUES (1,'超级管理员','Admin','*','超级管理员角色'),(2,'普通用户','User','user:view','普通用户角色'),(1000,'教师','teacher','root:*','教师角色'),(1001,'实验计划审批管理员','manage','root:*','manage');
/*!40000 ALTER TABLE `cy_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_role_resource_permission`
--

DROP TABLE IF EXISTS `cy_sys_role_resource_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_role_resource_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `permission_ids` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_role_resource_permission` (`role_id`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_role_resource_permission`
--

LOCK TABLES `cy_sys_role_resource_permission` WRITE;
/*!40000 ALTER TABLE `cy_sys_role_resource_permission` DISABLE KEYS */;
INSERT INTO `cy_sys_role_resource_permission` VALUES (1007,1001,1002,'1,2,3,4,5,6,'),(1008,1001,1003,'1,2,3,4,5,6,'),(1009,1001,1004,'1,2,3,4,5,6,'),(1010,1001,1005,'1,2,3,4,5,6,'),(1011,1001,1006,'1,2,3,4,5,6,'),(1012,1001,1007,'1,2,3,4,5,6,'),(1013,1001,1009,'1,2,3,4,5,6,'),(1015,1001,1011,'1,2,3,4,5,6,'),(1018,1001,1012,'1,2,3,4,5,6,'),(1019,1000,1002,'1,2,4,5,6,'),(1020,1000,1003,'1,2,4,5,6,'),(1021,1000,1004,'1,2,4,5,6,'),(1022,1000,1005,'1,2,4,5,6,'),(1023,1000,1006,'1,2,4,5,6,'),(1024,1000,1007,'1,2,4,5,6,'),(1025,1000,1008,'1,2,3,4,5,6,'),(1026,1000,1012,'1,2,3,4,5,6,'),(1027,1000,1010,'1,2,3,4,5,6,'),(1028,1001,1010,'1,2,3,4,5,6,');
/*!40000 ALTER TABLE `cy_sys_role_resource_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_team`
--

DROP TABLE IF EXISTS `cy_sys_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_team`
--

LOCK TABLES `cy_sys_team` WRITE;
/*!40000 ALTER TABLE `cy_sys_team` DISABLE KEYS */;
INSERT INTO `cy_sys_team` VALUES (1,'Dolphin',1);
/*!40000 ALTER TABLE `cy_sys_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_user`
--

DROP TABLE IF EXISTS `cy_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_user`
--

LOCK TABLES `cy_sys_user` WRITE;
/*!40000 ALTER TABLE `cy_sys_user` DISABLE KEYS */;
INSERT INTO `cy_sys_user` VALUES (1,'admin','管理员','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','admin@springside.org.cn','13888888888','enabled',1,'2012-01-01 00:00:00',0),(2,'teacher','主讲教师-xxx','e6611671c59cc426305bb1b717d3adef4d463b70','861473ebe59cb609','t@q.com','13211111112','enabled',1,'2012-01-01 00:00:00',0),(3,'manage','审批管理-张某某','500242bdfb6c8d997fc70f605a240a1731acbac6','6a34cf52ce0840a6','m@q.com','13211111113','enabled',1,'2012-01-01 00:00:00',0);
/*!40000 ALTER TABLE `cy_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_user_online`
--

DROP TABLE IF EXISTS `cy_sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_user_online` (
  `id` varchar(255) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  `last_access_time` datetime DEFAULT NULL,
  `online_session` longtext,
  `start_timestamp` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `system_host` varchar(255) DEFAULT NULL,
  `timeout` bigint(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_user_online`
--

LOCK TABLES `cy_sys_user_online` WRITE;
/*!40000 ALTER TABLE `cy_sys_user_online` DISABLE KEYS */;
INSERT INTO `cy_sys_user_online` VALUES ('35a22b0d-a5dc-4c71-9bff-3f6bec27ff43','127.0.0.1','2017-12-10 22:18:17','aced00057372002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c00067374617475737400394c6f72672f6170616368652f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c00067573657249647400104c6a6176612f6c616e672f4c6f6e673b4c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002433356132326230642d613564632d346337312d396266662d3366366265633237666634337372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000016040ca664b787371007e000777080000016040ca721d78771300000000001b774000093132372e302e302e31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000047400476f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e00097400506f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f41555448454e544943415445445f53455353494f4e5f4b4559737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e000a3f4000000000000c770800000010000000017400246f72672e6170616368652e736869726f2e7265616c6d2e5573657244425265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000173720020636f6d2e70706378792e636f6d6d6f6e2e7574696c732e536869726f5573657298d5f0847d7488260200024c00046e616d6571007e00024c0008757365726e616d6571007e00027870740010e4b8bbe8aeb2e69599e5b8882d7878787400077465616368657278780077010171007e001578740008757365726e616d6571007e001d78787e7200376f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e6574000e3132372e302e302e313a383038307400754d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31335f3129204170706c655765624b69742f3630342e332e3520284b48544d4c2c206c696b65204765636b6f292056657273696f6e2f31312e302e31205361666172692f3630342e332e357372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740007746561636865727702000f71007e002771007e002471007e002171007e002878','2017-12-10 22:18:14','on_line','127.0.0.1:8080',1800000,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0.1 Safari/604.3.5',2,'teacher'),('933da84a-7d5d-4da7-99dc-493be6188149','0:0:0:0:0:0:0:1','2017-12-10 22:23:00','aced00057372002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c00067374617475737400394c6f72672f6170616368652f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c00067573657249647400104c6a6176612f6c616e672f4c6f6e673b4c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002439333364613834612d376435642d346461372d393964632d3439336265363138383134397372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000016040cdb88d787371007e000777080000016040cec1dd78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000047400476f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e00097400506f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f41555448454e544943415445445f53455353494f4e5f4b4559737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e000a3f4000000000000c770800000010000000017400246f72672e6170616368652e736869726f2e7265616c6d2e5573657244425265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000173720020636f6d2e70706378792e636f6d6d6f6e2e7574696c732e536869726f5573657298d5f0847d7488260200024c00046e616d6571007e00024c0008757365726e616d6571007e00027870740016e5aea1e689b9e7aea1e790862de5bca0e69f90e69f907400066d616e61676578780077010171007e001578740008757365726e616d6571007e001d78787e7200376f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383038307400754d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31335f3129204170706c655765624b69742f3630342e332e3520284b48544d4c2c206c696b65204765636b6f292056657273696f6e2f31312e302e31205361666172692f3630342e332e357372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000000037400066d616e6167657702000f71007e002771007e002471007e002171007e002878','2017-12-10 22:21:52','on_line','0:0:0:0:0:0:0:1:8080',1800000,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0.1 Safari/604.3.5',3,'manage');
/*!40000 ALTER TABLE `cy_sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cy_sys_user_role`
--

DROP TABLE IF EXISTS `cy_sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cy_sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cy_sys_user_role`
--

LOCK TABLES `cy_sys_user_role` WRITE;
/*!40000 ALTER TABLE `cy_sys_user_role` DISABLE KEYS */;
INSERT INTO `cy_sys_user_role` VALUES (1,1),(1,2),(2,2),(2,1000),(3,2),(3,1001);
/*!40000 ALTER TABLE `cy_sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experi_device`
--

DROP TABLE IF EXISTS `experi_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experi_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) DEFAULT NULL,
  `device_state` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='实验设备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experi_device`
--

LOCK TABLES `experi_device` WRITE;
/*!40000 ALTER TABLE `experi_device` DISABLE KEYS */;
INSERT INTO `experi_device` VALUES (1,'显微镜','不可用','精密仪器'),(3,'水晶头','不可用','消耗品'),(4,'望远镜','可用','无'),(5,'改锥','可用','工具'),(6,'双绞线','可用','消耗品');
/*!40000 ALTER TABLE `experi_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experi_place`
--

DROP TABLE IF EXISTS `experi_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experi_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `place_info` varchar(255) DEFAULT NULL,
  `place_name` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='试验场地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experi_place`
--

LOCK TABLES `experi_place` WRITE;
/*!40000 ALTER TABLE `experi_place` DISABLE KEYS */;
INSERT INTO `experi_place` VALUES (1,'玩','操场',NULL),(2,'在草坪上想怎么玩怎么玩\r\n','草坪',NULL),(3,'二楼实验室','实验室1',NULL),(4,'三楼实验室','实验室2',NULL),(5,'在教学楼2号楼的2楼的软件开发实验室','二楼软件开发实验室',NULL);
/*!40000 ALTER TABLE `experi_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experi_plan`
--

DROP TABLE IF EXISTS `experi_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experi_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) DEFAULT NULL,
  `plan_person_count` int(11) DEFAULT NULL,
  `principal_teacher` varchar(90) DEFAULT NULL,
  `experi_date` varchar(4000) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `approve_user_id` bigint(20) DEFAULT NULL,
  `approve_info` varchar(4000) DEFAULT NULL,
  `approve_status` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `group_person_count` int(11) DEFAULT NULL,
  `weeks_period_count` int(11) DEFAULT NULL,
  `weeks_count` int(11) DEFAULT NULL,
  `remark` varchar(4000) DEFAULT NULL,
  `school_year` varchar(300) DEFAULT NULL,
  `semester` varchar(300) DEFAULT NULL,
  `place` bigint(20) DEFAULT NULL,
  `soft` varchar(3000) DEFAULT NULL,
  `device` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='试验计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experi_plan`
--

LOCK TABLES `experi_plan` WRITE;
/*!40000 ALTER TABLE `experi_plan` DISABLE KEYS */;
INSERT INTO `experi_plan` VALUES (2,1,34,'管理员','22',NULL,'2017-12-02',1,'',0,NULL,1,2,2,'2','2018/2019','2',3,'',3),(3,1,1000,'管理员','阿斯蒂芬1',1,'2017-12-02',3,'通过',0,'2017-12-02',2,3,4,'','2018/2019','1',5,'',4),(4,1,122,'管理员','1-8，2-16',1,'2017-12-10',3,'1',1,'2017-12-05',3,4,6,'啊啊啊','2018/2019','2',2,'',1);
/*!40000 ALTER TABLE `experi_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experi_plan_classes`
--

DROP TABLE IF EXISTS `experi_plan_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experi_plan_classes` (
  `classes_id` bigint(20) DEFAULT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='班级实验计划关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experi_plan_classes`
--

LOCK TABLES `experi_plan_classes` WRITE;
/*!40000 ALTER TABLE `experi_plan_classes` DISABLE KEYS */;
INSERT INTO `experi_plan_classes` VALUES (21,3,83),(22,3,84),(21,2,86),(21,4,87),(22,4,88);
/*!40000 ALTER TABLE `experi_plan_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experi_project`
--

DROP TABLE IF EXISTS `experi_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experi_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_time` varchar(255) DEFAULT NULL,
  `consume` int(11) DEFAULT NULL,
  `counsellor` varchar(255) DEFAULT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  `course_period_count` int(11) DEFAULT NULL,
  `group_count` int(11) DEFAULT NULL,
  `group_person_count` int(11) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='实验项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experi_project`
--

LOCK TABLES `experi_project` WRITE;
/*!40000 ALTER TABLE `experi_project` DISABLE KEYS */;
INSERT INTO `experi_project` VALUES (10,'2222',2,'2',2,111,212,12,'111111'),(11,'11',11,'管理员',3,1,1,11,'ceshi'),(12,'22',22,'22',3,22,22,22,'22'),(13,'22',22,'王老师',4,22,11,2,'双绞线制作'),(14,'33',33,'张老师',4,33,17,2,'飞翔'),(15,'啊',1,'1',4,1,17,2,'啊');
/*!40000 ALTER TABLE `experi_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_classes`
--

DROP TABLE IF EXISTS `info_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classes_name` varchar(255) DEFAULT NULL,
  `enrollment` int(11) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='班级信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_classes`
--

LOCK TABLES `info_classes` WRITE;
/*!40000 ALTER TABLE `info_classes` DISABLE KEYS */;
INSERT INTO `info_classes` VALUES (21,'三年二班1',34,1,5),(22,'三年二班2',56,1,5);
/*!40000 ALTER TABLE `info_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_course`
--

DROP TABLE IF EXISTS `info_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `course_number` varchar(255) DEFAULT NULL,
  `course_period_count` int(11) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_course`
--

LOCK TABLES `info_course` WRITE;
/*!40000 ALTER TABLE `info_course` DISABLE KEYS */;
INSERT INTO `info_course` VALUES (1,'软件工程','r0080',100,'理论');
/*!40000 ALTER TABLE `info_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_grade`
--

DROP TABLE IF EXISTS `info_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weight` int(11) DEFAULT NULL,
  `enrol_years` varchar(255) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='年级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_grade`
--

LOCK TABLES `info_grade` WRITE;
/*!40000 ALTER TABLE `info_grade` DISABLE KEYS */;
INSERT INTO `info_grade` VALUES (1,1,'2018.0','2018届');
/*!40000 ALTER TABLE `info_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_major`
--

DROP TABLE IF EXISTS `info_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_major` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) DEFAULT NULL,
  `major_number` varchar(255) DEFAULT NULL,
  `major_type` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='专业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_major`
--

LOCK TABLES `info_major` WRITE;
/*!40000 ALTER TABLE `info_major` DISABLE KEYS */;
INSERT INTO `info_major` VALUES (3,'电子信息技术','002','重点专业',2),(5,'计算机科学与技术','z0010','重点专业',0),(63,'环境治理','z0020','其他专业',1);
/*!40000 ALTER TABLE `info_major` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10 23:02:38
