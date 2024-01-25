# 建表脚本
-- 创建库
create database if not exists oj;

-- 切换库
use oj;


--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `title`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '标题',
    `content`    text COLLATE utf8mb4_unicode_ci COMMENT '内容',
    `tags`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
    `thumbNum`   int(11)    NOT NULL                      DEFAULT '0' COMMENT '点赞数',
    `favourNum`  int(11)    NOT NULL                      DEFAULT '0' COMMENT '收藏数',
    `userId`     bigint(20) NOT NULL COMMENT '创建用户 id',
    `createTime` datetime   NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` datetime   NOT NULL                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete`   tinyint(4) NOT NULL                      DEFAULT '0' COMMENT '是否删除',
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_favour`
--

DROP TABLE IF EXISTS `post_favour`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_favour`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `postId`     bigint(20) NOT NULL COMMENT '帖子 id',
    `userId`     bigint(20) NOT NULL COMMENT '创建用户 id',
    `createTime` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_postId` (`postId`),
    KEY `idx_userId` (`userId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='帖子收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_favour`
--

LOCK TABLES `post_favour` WRITE;
/*!40000 ALTER TABLE `post_favour`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `post_favour`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_thumb`
--

DROP TABLE IF EXISTS `post_thumb`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_thumb`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `postId`     bigint(20) NOT NULL COMMENT '帖子 id',
    `userId`     bigint(20) NOT NULL COMMENT '创建用户 id',
    `createTime` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_postId` (`postId`),
    KEY `idx_userId` (`userId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='帖子点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_thumb`
--

LOCK TABLES `post_thumb` WRITE;
/*!40000 ALTER TABLE `post_thumb`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `post_thumb`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question`
(
    `id`          bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT 'id',
    `title`       varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
    `content`     text COLLATE utf8mb4_unicode_ci         NOT NULL COMMENT '内容',
    `tags`        varchar(1024) COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '标签列表(json 数组)',
    `answer`      text COLLATE utf8mb4_unicode_ci COMMENT '题目答案',
    `submitNum`   int(11)                                 NOT NULL DEFAULT '0' COMMENT '题目提交数',
    `acceptedNum` int(11)                                 NOT NULL DEFAULT '0' COMMENT '题目通过数',
    `judgeCase`   text COLLATE utf8mb4_unicode_ci COMMENT '判题用例(json 数组)',
    `judgeConfig` varchar(256) COLLATE utf8mb4_unicode_ci          DEFAULT 'user' COMMENT '判题配置(json 对象)',
    `thumbNum`    int(11)                                 NOT NULL DEFAULT '0' COMMENT '点赞数',
    `favourNum`   int(11)                                 NOT NULL DEFAULT '0' COMMENT '收藏数',
    `userId`      bigint(20)                              NOT NULL COMMENT '创建用户 id',
    `createTime`  datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`  datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete`    tinyint(4)                              NOT NULL DEFAULT '0' COMMENT '是否删除',
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1750488701018411011
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question`
    DISABLE KEYS */;
INSERT INTO `question`
VALUES (1750488701018411010, '两数之和', 'A+B', '[]', 'A+B', 0, 0,
        '[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"2 3\",\"output\":\"5\"}]',
        '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1745771419532828674,
        '2024-01-25 20:00:03', '2024-01-25 20:41:36', 0);
/*!40000 ALTER TABLE `question`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_submit`
--

DROP TABLE IF EXISTS `question_submit`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_submit`
(
    `id`         bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT 'id',
    `language`   varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编程语言',
    `code`       text COLLATE utf8mb4_unicode_ci         NOT NULL COMMENT '用户代码',
    `judgeInfo`  text COLLATE utf8mb4_unicode_ci COMMENT '判题信息(json 对象)',
    `status`     int(11)                                 NOT NULL DEFAULT '0' COMMENT '判题状态 0 待判题 1 判题中 2 成功 3 失败',
    `questionId` bigint(20)                              NOT NULL COMMENT '题目 id',
    `userId`     bigint(20)                              NOT NULL COMMENT '创建用户 id',
    `createTime` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete`   tinyint(4)                              NOT NULL DEFAULT '0' COMMENT '是否删除',
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`),
    KEY `idx_questionId` (`questionId`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1750504279812681731
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_submit`
--

LOCK TABLES `question_submit` WRITE;
/*!40000 ALTER TABLE `question_submit`
    DISABLE KEYS */;
INSERT INTO `question_submit`
VALUES (1750489625602396161, 'java',
        'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}',
        '{}', 1, 1750488701018411010, 1745771419532828674, '2024-01-25 20:03:43', '2024-01-25 20:03:44', 0),
       (1750491020594352129, 'java',
        'public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{}', 1, 1750488701018411010, 1745771419532828674, '2024-01-25 20:09:16', '2024-01-25 20:09:16', 0),
       (1750492149881344001, 'java',
        'public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{}', 1, 1750488701018411010, 1745771419532828674, '2024-01-25 20:13:45', '2024-01-25 20:13:45', 0),
       (1750495955004260353, 'java',
        'public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{}', 1, 1750488701018411010, 1745771419532828674, '2024-01-25 20:28:52', '2024-01-25 20:34:17', 0),
       (1750499662462791682, 'java',
        '    public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{}', 1, 1750488701018411010, 1745771419532828674, '2024-01-25 20:43:36', '2024-01-25 20:43:57', 0),
       (1750499983834558465, 'java',
        '    public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{\"message\":\"Accepted\",\"memory\":0,\"time\":79}', 2, 1750488701018411010, 1745771419532828674,
        '2024-01-25 20:44:53', '2024-01-25 21:02:11', 0),
       (1750504279812681730, 'java',
        '    public class Main {\r\n        public static void main(String[] args) {\r\n            int a = Integer.parseInt(args[0]);\r\n            int b = Integer.parseInt(args[1]);\r\n            System.out.println(a + b);\r\n        }\r\n    }',
        '{\"message\":\"Accepted\",\"memory\":0,\"time\":73}', 2, 1750488701018411010, 1745771419532828674,
        '2024-01-25 21:01:57', '2024-01-25 21:02:12', 0);
/*!40000 ALTER TABLE `question_submit`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user`
(
    `id`           bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT 'id',
    `userAccount`  varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
    `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `unionId`      varchar(256) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '微信开放平台id',
    `mpOpenId`     varchar(256) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '公众号openId',
    `userName`     varchar(256) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '用户昵称',
    `userAvatar`   varchar(1024) COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '用户头像',
    `userProfile`  varchar(512) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '用户简介',
    `userRole`     varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
    `createTime`   datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`   datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete`     tinyint(4)                              NOT NULL DEFAULT '0' COMMENT '是否删除',
    PRIMARY KEY (`id`),
    KEY `idx_unionId` (`unionId`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1750486895160745986
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1745771419532828674, 'admin', 'cf7f088469e927321d02d37fd5632b9c', NULL, NULL, 'admin', NULL, NULL, 'admin',
        '2024-01-12 19:35:15', '2024-01-25 19:53:16', 0),
       (1750486895160745985, 'user', 'cf7f088469e927321d02d37fd5632b9c', NULL, NULL, NULL, NULL, NULL, 'user',
        '2024-01-25 19:52:52', '2024-01-25 19:52:52', 0);
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-01-25 22:09:41
