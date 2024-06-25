-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('0af2795e-2f1b-11ef-803b-da80833f9b31',1,'leave.bpmn','0af2795d-2f1b-11ef-803b-da80833f9b31',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.kafeitu.me/activiti/leave\">\r\n  <process id=\"leave\" name=\"请假流程-普通表单\" isExecutable=\"true\">\r\n    <documentation>请假流程演示</documentation>\r\n    <startEvent id=\"startevent1\" name=\"Start\" />\r\n    <userTask id=\"deptLeaderVerify\" name=\"部门领导审批\" activiti:formKey=\"deptLeaderVerify\" activiti:candidateUsers=\"${deptLeader}\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"FormProperty_3qipis2--__!!radio--__!!审批意见--__!!i--__!!同意--__--不同意\" type=\"string\" />\r\n        <activiti:formProperty id=\"FormProperty_0lffpcm--__!!textarea--__!!批注--__!!f__!!null\" type=\"string\" />\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"exclusivegateway5\">\r\n      <outgoing>Flow_0q3bbjl</outgoing>\r\n    </exclusiveGateway>\r\n    <userTask id=\"hrVerify\" name=\"人事审批\" activiti:formKey=\"hrVerify\" activiti:candidateGroups=\"hr\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"FormProperty_23u95jb--__!!radio--__!!审批意见--__!!i--__!!同意--__--不同意\" type=\"string\" />\r\n        <activiti:formProperty id=\"FormProperty_3t7tfkv--__!!textarea--__!!批注--__!!f--__!!null\" type=\"string\" />\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"exclusivegateway6\">\r\n      <outgoing>Flow_0p85954</outgoing>\r\n      <outgoing>Flow_0ji7qcv</outgoing>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"endevent1\" name=\"End\">\r\n      <incoming>Flow_0p85954</incoming>\r\n      <incoming>Flow_0ji7qcv</incoming>\r\n      <incoming>Flow_0q3bbjl</incoming>\r\n    </endEvent>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderVerify\" />\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderVerify\" targetRef=\"exclusivegateway5\" />\r\n    <sequenceFlow id=\"flow5\" name=\"同意\" sourceRef=\"exclusivegateway5\" targetRef=\"hrVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${FormProperty_3qipis2==0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrVerify\" targetRef=\"exclusivegateway6\" />\r\n    <sequenceFlow id=\"Flow_0p85954\" sourceRef=\"exclusivegateway6\" targetRef=\"endevent1\">\r\n      <extensionElements>\r\n        <activiti:executionListener class=\"com.ruoyi.leave.instener.LeaveEndStateListener\" event=\"take\">\r\n          <activiti:field name=\"state\">\r\n            <activiti:string>1</activiti:string>\r\n          </activiti:field>\r\n        </activiti:executionListener>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${FormProperty_23u95jb==0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"Flow_0ji7qcv\" sourceRef=\"exclusivegateway6\" targetRef=\"endevent1\">\r\n      <extensionElements>\r\n        <activiti:executionListener class=\"com.ruoyi.leave.instener.LeaveEndStateListener\" event=\"take\">\r\n          <activiti:field name=\"state\">\r\n            <activiti:string>2</activiti:string>\r\n          </activiti:field>\r\n        </activiti:executionListener>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"Flow_0q3bbjl\" sourceRef=\"exclusivegateway5\" targetRef=\"endevent1\">\r\n      <extensionElements>\r\n        <activiti:executionListener class=\"com.ruoyi.leave.instener.LeaveEndStateListener\" event=\"take\">\r\n          <activiti:field name=\"state\">\r\n            <activiti:string>2</activiti:string>\r\n          </activiti:field>\r\n        </activiti:executionListener>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\r\n    <bpmndi:BPMNPlane id=\"BPMNPlane_leave\" bpmnElement=\"leave\">\r\n      <bpmndi:BPMNEdge id=\"Flow_0q3bbjl_di\" bpmnElement=\"Flow_0q3bbjl\">\r\n        <omgdi:waypoint x=\"260\" y=\"83\" />\r\n        <omgdi:waypoint x=\"260\" y=\"140\" />\r\n        <omgdi:waypoint x=\"582\" y=\"140\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_0ji7qcv_di\" bpmnElement=\"Flow_0ji7qcv\">\r\n        <omgdi:waypoint x=\"505\" y=\"83\" />\r\n        <omgdi:waypoint x=\"505\" y=\"140\" />\r\n        <omgdi:waypoint x=\"582\" y=\"140\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_0p85954_di\" bpmnElement=\"Flow_0p85954\">\r\n        <omgdi:waypoint x=\"525\" y=\"63\" />\r\n        <omgdi:waypoint x=\"600\" y=\"63\" />\r\n        <omgdi:waypoint x=\"600\" y=\"122\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow6\" bpmnElement=\"flow6\">\r\n        <omgdi:waypoint x=\"453\" y=\"63\" />\r\n        <omgdi:waypoint x=\"485\" y=\"63\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow5\" bpmnElement=\"flow5\">\r\n        <omgdi:waypoint x=\"280\" y=\"63\" />\r\n        <omgdi:waypoint x=\"348\" y=\"63\" />\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds x=\"300\" y=\"46\" width=\"22\" height=\"11\" />\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow3\" bpmnElement=\"flow3\">\r\n        <omgdi:waypoint x=\"185\" y=\"63\" />\r\n        <omgdi:waypoint x=\"240\" y=\"63\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow2\" bpmnElement=\"flow2\">\r\n        <omgdi:waypoint x=\"35\" y=\"63\" />\r\n        <omgdi:waypoint x=\"80\" y=\"63\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_startevent1\" bpmnElement=\"startevent1\">\r\n        <omgdc:Bounds x=\"0\" y=\"46\" width=\"35\" height=\"35\" />\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds x=\"5\" y=\"81\" width=\"25\" height=\"14\" />\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_deptLeaderVerify\" bpmnElement=\"deptLeaderVerify\">\r\n        <omgdc:Bounds x=\"80\" y=\"36\" width=\"105\" height=\"55\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_exclusivegateway5\" bpmnElement=\"exclusivegateway5\" isMarkerVisible=\"true\">\r\n        <omgdc:Bounds x=\"240\" y=\"43\" width=\"40\" height=\"40\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_hrVerify\" bpmnElement=\"hrVerify\">\r\n        <omgdc:Bounds x=\"348\" y=\"36\" width=\"105\" height=\"55\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_exclusivegateway6\" bpmnElement=\"exclusivegateway6\" isMarkerVisible=\"true\">\r\n        <omgdc:Bounds x=\"485\" y=\"43\" width=\"40\" height=\"40\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"BPMNShape_endevent1\" bpmnElement=\"endevent1\">\r\n        <omgdc:Bounds x=\"582\" y=\"122\" width=\"35\" height=\"35\" />\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds x=\"590\" y=\"157\" width=\"20\" height=\"14\" />\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','1',1),('schema.history','create(7.0.0.0)',1),('schema.version','7.0.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('05d0b4ab-31da-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','exclusivegateway6',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:29:54.197','2024-06-24 11:29:54.198',1,NULL,''),('05d129dc-31da-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','endevent1',NULL,NULL,'End','endEvent',NULL,'2024-06-24 11:29:54.200','2024-06-24 11:29:54.200',0,NULL,''),('3d8cb5a4-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8c4073-2f77-11ef-803b-da80833f9b31','startevent1',NULL,NULL,'Start','startEvent',NULL,'2024-06-21 10:37:45.202','2024-06-21 10:37:45.207',5,NULL,''),('3d8e1535-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8c4073-2f77-11ef-803b-da80833f9b31','deptLeaderVerify','3d914986-2f77-11ef-803b-da80833f9b31',NULL,'部门领导审批','userTask',NULL,'2024-06-21 10:37:45.211',NULL,NULL,NULL,''),('5e2c23f9-31d9-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','exclusivegateway5',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:25:12.939','2024-06-24 11:25:12.939',0,NULL,''),('5e2c4b0a-31d9-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','hrVerify','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL,'人事审批','userTask','wsj2','2024-06-24 11:25:12.940','2024-06-24 11:29:54.197',281257,NULL,''),('744faba1-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','startevent1',NULL,NULL,'Start','startEvent',NULL,'2024-06-24 11:18:40.585','2024-06-24 11:18:40.585',0,NULL,''),('744faba2-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','deptLeaderVerify','744faba3-31d8-11ef-8bc1-da80833f9b31',NULL,'部门领导审批','userTask','wsj3','2024-06-24 11:18:40.585','2024-06-24 11:19:21.884',41299,NULL,''),('8ced65e1-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','exclusivegateway5',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:19:21.884','2024-06-24 11:19:21.885',1,NULL,''),('8ced8cf2-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','hrVerify','8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL,'人事审批','userTask','wsj2','2024-06-24 11:19:21.885','2024-06-24 11:20:03.587',41702,NULL,''),('94a464ff-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','94a43dee-2f77-11ef-803b-da80833f9b31','startevent1',NULL,NULL,'Start','startEvent',NULL,'2024-06-21 10:40:11.319','2024-06-21 10:40:11.319',0,NULL,''),('94a46500-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','94a43dee-2f77-11ef-803b-da80833f9b31','deptLeaderVerify','94a46501-2f77-11ef-803b-da80833f9b31',NULL,'部门领导审批','userTask',NULL,'2024-06-21 10:40:11.319',NULL,NULL,NULL,''),('a5c8c563-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','exclusivegateway6',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:20:03.587','2024-06-24 11:20:03.588',1,NULL,''),('a5c93a94-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','endevent1',NULL,NULL,'End','endEvent',NULL,'2024-06-24 11:20:03.590','2024-06-24 11:20:03.590',0,NULL,''),('bbbe5f4b-31d7-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','exclusivegateway6',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:13:30.932','2024-06-24 11:13:30.932',0,NULL,''),('bbca944c-31d7-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','endevent1',NULL,NULL,'End','endEvent',NULL,'2024-06-24 11:13:31.012','2024-06-24 11:13:31.012',0,NULL,''),('bfb805d9-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','startevent1',NULL,NULL,'Start','startEvent',NULL,'2024-06-24 11:20:47.098','2024-06-24 11:20:47.098',0,NULL,''),('bfb805da-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','deptLeaderVerify','bfb805db-31d8-11ef-8bc1-da80833f9b31',NULL,'部门领导审批','userTask','wsj3','2024-06-24 11:20:47.098','2024-06-24 11:25:12.939',265841,NULL,''),('e658aa49-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','startevent1',NULL,NULL,'Start','startEvent',NULL,'2024-06-24 11:00:23.414','2024-06-24 11:00:23.419',5,NULL,''),('e65c2cba-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','deptLeaderVerify','e65ffd4b-31d5-11ef-8bc1-da80833f9b31',NULL,'部门领导审批','userTask','wsj3','2024-06-24 11:00:23.437','2024-06-24 11:00:54.748',31311,NULL,''),('f905dab9-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','exclusivegateway5',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-24 11:00:54.748','2024-06-24 11:00:54.762',14,NULL,''),('f90824aa-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','hrVerify','f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL,'人事审批','userTask','wsj2','2024-06-24 11:00:54.763','2024-06-24 11:13:30.932',756169,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
INSERT INTO `act_hi_detail` VALUES ('05cfca45-31da-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:29:54.191',NULL,NULL,NULL,'0',NULL),('05d08d96-31da-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',1,'2024-06-24 11:29:54.196',NULL,NULL,NULL,'0',NULL),('05d08d98-31da-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:29:54.196',NULL,NULL,NULL,'0',NULL),('05d08d99-31da-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',1,'2024-06-24 11:29:54.196',NULL,NULL,NULL,NULL,NULL),('05d08d9a-31da-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:29:54.196',NULL,NULL,NULL,'wsj3',NULL),('3d8ba432-2f77-11ef-803b-da80833f9b31','VariableUpdate','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL,NULL,'deptLeader','string',0,'2024-06-21 10:37:45.195',NULL,NULL,NULL,'',NULL),('3d93e198-2f77-11ef-803b-da80833f9b31','VariableUpdate','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8c4073-2f77-11ef-803b-da80833f9b31','3d914986-2f77-11ef-803b-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-21 10:37:45.249',NULL,NULL,NULL,'',NULL),('5e2b60a1-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:25:12.934',NULL,NULL,NULL,'0',NULL),('5e2b60a3-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:25:12.934',NULL,NULL,NULL,NULL,NULL),('5e2bfce5-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:25:12.938',NULL,NULL,NULL,'0',NULL),('5e2bfce7-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:25:12.938',NULL,NULL,NULL,NULL,NULL),('5e2bfce8-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:25:12.938',NULL,NULL,NULL,'wsj3',NULL),('5e2c4b0d-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:25:12.940',NULL,NULL,NULL,'0',NULL),('5e2c4b0f-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:25:12.940',NULL,NULL,NULL,NULL,NULL),('5e2c4b11-31d9-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:25:12.940',NULL,NULL,NULL,'wsj3',NULL),('744f848f-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',0,'2024-06-24 11:18:40.584',NULL,NULL,NULL,'wsj3',NULL),('744faba5-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:18:40.585',NULL,NULL,NULL,'wsj3',NULL),('8cecc999-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:19:21.880',NULL,NULL,NULL,'0',NULL),('8cecc99b-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:19:21.880',NULL,NULL,NULL,NULL,NULL),('8ced3ecd-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:19:21.883',NULL,NULL,NULL,'0',NULL),('8ced3ecf-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:19:21.883',NULL,NULL,NULL,NULL,NULL),('8ced3ed0-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:19:21.883',NULL,NULL,NULL,'wsj3',NULL),('8cedb405-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:19:21.886',NULL,NULL,NULL,'0',NULL),('8cedb407-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:19:21.886',NULL,NULL,NULL,NULL,NULL),('8cedb409-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:19:21.886',NULL,NULL,NULL,'wsj3',NULL),('94a43ded-2f77-11ef-803b-da80833f9b31','VariableUpdate','94a43deb-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31',NULL,NULL,'deptLeader','string',0,'2024-06-21 10:40:11.318',NULL,NULL,NULL,'',NULL),('94a46503-2f77-11ef-803b-da80833f9b31','VariableUpdate','94a43deb-2f77-11ef-803b-da80833f9b31','94a43dee-2f77-11ef-803b-da80833f9b31','94a46501-2f77-11ef-803b-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-21 10:40:11.319',NULL,NULL,NULL,'',NULL),('a5c7b3ed-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:20:03.580',NULL,NULL,NULL,'0',NULL),('a5c8773e-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',1,'2024-06-24 11:20:03.585',NULL,NULL,NULL,'0',NULL),('a5c89e50-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:20:03.586',NULL,NULL,NULL,'0',NULL),('a5c89e51-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',1,'2024-06-24 11:20:03.586',NULL,NULL,NULL,NULL,NULL),('a5c89e52-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:20:03.586',NULL,NULL,NULL,'wsj3',NULL),('bbbd4dd5-31d7-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:13:30.925',NULL,NULL,NULL,'0',NULL),('bbbdea16-31d7-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',1,'2024-06-24 11:13:30.929',NULL,NULL,NULL,'0',NULL),('bbbdea18-31d7-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_23u95jb','string',0,'2024-06-24 11:13:30.929',NULL,NULL,NULL,'0',NULL),('bbbdea19-31d7-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',1,'2024-06-24 11:13:30.929',NULL,NULL,NULL,NULL,NULL),('bbbe383a-31d7-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:13:30.931',NULL,NULL,NULL,'wsj3',NULL),('bfb805d7-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',0,'2024-06-24 11:20:47.098',NULL,NULL,NULL,'wsj3',NULL),('bfb82ced-31d8-11ef-8bc1-da80833f9b31','VariableUpdate','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:20:47.099',NULL,NULL,NULL,'wsj3',NULL),('e6574ab7-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',0,'2024-06-24 11:00:23.405',NULL,NULL,NULL,'wsj3',NULL),('e6610ebd-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:00:23.469',NULL,NULL,NULL,'wsj3',NULL),('f9047b21-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:00:54.739',NULL,NULL,NULL,'0',NULL),('f9047b23-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:00:54.739',NULL,NULL,NULL,NULL,NULL),('f9058c95-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:00:54.746',NULL,NULL,NULL,'0',NULL),('f9058c97-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:00:54.746',NULL,NULL,NULL,NULL,NULL),('f9058c98-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,NULL,'deptLeader','string',1,'2024-06-24 11:00:54.746',NULL,NULL,NULL,'wsj3',NULL),('f90824ad-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',0,'2024-06-24 11:00:54.763',NULL,NULL,NULL,'0',NULL),('f90824af-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',0,'2024-06-24 11:00:54.763',NULL,NULL,NULL,NULL,NULL),('f90824b1-31d5-11ef-8bc1-da80833f9b31','VariableUpdate','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',0,'2024-06-24 11:00:54.763',NULL,NULL,NULL,'wsj3',NULL);
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('05cae843-31da-11ef-8bc1-da80833f9b31',NULL,'participant','wsj2',NULL,'bfb805d5-31d8-11ef-8bc1-da80833f9b31'),('3d94cbf9-2f77-11ef-803b-da80833f9b31',NULL,'candidate','','3d914986-2f77-11ef-803b-da80833f9b31',NULL),('3d94f30a-2f77-11ef-803b-da80833f9b31',NULL,'participant','',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31'),('5e2c7222-31d9-11ef-8bc1-da80833f9b31','hr','candidate',NULL,'5e2c4b0b-31d9-11ef-8bc1-da80833f9b31',NULL),('744fd2b6-31d8-11ef-8bc1-da80833f9b31',NULL,'candidate','wsj3','744faba3-31d8-11ef-8bc1-da80833f9b31',NULL),('744fd2b7-31d8-11ef-8bc1-da80833f9b31',NULL,'participant','wsj3',NULL,'744f848d-31d8-11ef-8bc1-da80833f9b31'),('8cedb40a-31d8-11ef-8bc1-da80833f9b31','hr','candidate',NULL,'8ced8cf3-31d8-11ef-8bc1-da80833f9b31',NULL),('94a48c14-2f77-11ef-803b-da80833f9b31',NULL,'candidate','','94a46501-2f77-11ef-803b-da80833f9b31',NULL),('94a48c15-2f77-11ef-803b-da80833f9b31',NULL,'participant','',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31'),('a5c3953b-31d8-11ef-8bc1-da80833f9b31',NULL,'participant','wsj2',NULL,'744f848d-31d8-11ef-8bc1-da80833f9b31'),('bbb92f23-31d7-11ef-8bc1-da80833f9b31',NULL,'participant','wsj2',NULL,'e6568765-31d5-11ef-8bc1-da80833f9b31'),('bfb853fe-31d8-11ef-8bc1-da80833f9b31',NULL,'candidate','wsj3','bfb805db-31d8-11ef-8bc1-da80833f9b31',NULL),('bfb853ff-31d8-11ef-8bc1-da80833f9b31',NULL,'participant','wsj3',NULL,'bfb805d5-31d8-11ef-8bc1-da80833f9b31'),('e661d20e-31d5-11ef-8bc1-da80833f9b31',NULL,'candidate','wsj3','e65ffd4b-31d5-11ef-8bc1-da80833f9b31',NULL),('e662202f-31d5-11ef-8bc1-da80833f9b31',NULL,'participant','wsj3',NULL,'e6568765-31d5-11ef-8bc1-da80833f9b31'),('f9084ac2-31d5-11ef-8bc1-da80833f9b31','hr','candidate',NULL,'f90824ab-31d5-11ef-8bc1-da80833f9b31',NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','da068dc9-207c-407e-9a38-e34d7e271d0c','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','2024-06-21 10:37:45.188',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'','王少杰的年假申请'),('744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','f6ca2bd1-6c46-4c97-87ef-9c8026327afa','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','2024-06-24 11:18:40.584','2024-06-24 11:20:03.596',83012,NULL,'startevent1','endevent1',NULL,NULL,'','王少杰的病假申请'),('94a43deb-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','6dd79f82-efb5-485f-b6bf-0388f7539097','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','2024-06-21 10:40:11.318',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'','王少杰的年假申请'),('bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','4b4d07d4-6681-42d0-9716-45b2b14a3937','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','2024-06-24 11:20:47.098','2024-06-24 11:29:54.207',547109,NULL,'startevent1','endevent1',NULL,NULL,'','王少杰的年假申请'),('e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','208d3401-7e06-44b5-b2f9-6b5f511d33f7','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','2024-06-24 11:00:23.400','2024-06-24 11:13:31.064',787664,NULL,'startevent1','endevent1',NULL,NULL,'','王少杰的年假申请');
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('3d914986-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','deptLeaderVerify','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8c4073-2f77-11ef-803b-da80833f9b31','部门领导审批',NULL,NULL,NULL,NULL,'2024-06-21 10:37:45.233',NULL,NULL,NULL,NULL,50,NULL,'deptLeaderVerify',NULL,''),('5e2c4b0b-31d9-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','hrVerify','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','人事审批',NULL,NULL,NULL,'wsj2','2024-06-24 11:25:12.940','2024-06-24 11:29:54.157','2024-06-24 11:29:54.193',281253,NULL,50,NULL,'hrVerify',NULL,''),('744faba3-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','deptLeaderVerify','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','部门领导审批',NULL,NULL,NULL,'wsj3','2024-06-24 11:18:40.585','2024-06-24 11:19:21.847','2024-06-24 11:19:21.882',41297,NULL,50,NULL,'deptLeaderVerify',NULL,''),('8ced8cf3-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','hrVerify','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','人事审批',NULL,NULL,NULL,'wsj2','2024-06-24 11:19:21.885','2024-06-24 11:20:03.551','2024-06-24 11:20:03.582',41697,NULL,50,NULL,'hrVerify',NULL,''),('94a46501-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','deptLeaderVerify','94a43deb-2f77-11ef-803b-da80833f9b31','94a43dee-2f77-11ef-803b-da80833f9b31','部门领导审批',NULL,NULL,NULL,NULL,'2024-06-21 10:40:11.319',NULL,NULL,NULL,NULL,50,NULL,'deptLeaderVerify',NULL,''),('bfb805db-31d8-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','deptLeaderVerify','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','部门领导审批',NULL,NULL,NULL,'wsj3','2024-06-24 11:20:47.098','2024-06-24 11:25:12.903','2024-06-24 11:25:12.936',265838,NULL,50,NULL,'deptLeaderVerify',NULL,''),('e65ffd4b-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','deptLeaderVerify','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','部门领导审批',NULL,NULL,NULL,'wsj3','2024-06-24 11:00:23.462','2024-06-24 11:00:54.699','2024-06-24 11:00:54.744',31282,NULL,50,NULL,'deptLeaderVerify',NULL,''),('f90824ab-31d5-11ef-8bc1-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','hrVerify','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','人事审批',NULL,NULL,NULL,'wsj2','2024-06-24 11:00:54.763','2024-06-24 11:13:30.891','2024-06-24 11:13:30.927',756164,NULL,50,NULL,'hrVerify',NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('05cfca44-31da-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31','FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:29:54.191','2024-06-24 11:29:54.191'),('05d08d97-31da-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:29:54.196','2024-06-24 11:29:54.196'),('3d8b7d21-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL,'deptLeader','string',0,NULL,NULL,NULL,'',NULL,'2024-06-21 10:37:45.194','2024-06-21 10:37:45.194'),('3d93e197-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8c4073-2f77-11ef-803b-da80833f9b31','3d914986-2f77-11ef-803b-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'',NULL,'2024-06-21 10:37:45.249','2024-06-21 10:37:45.249'),('5e2b60a0-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:25:12.934','2024-06-24 11:25:12.934'),('5e2b60a2-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:25:12.934','2024-06-24 11:25:12.934'),('5e2bfce4-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',1,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:25:12.938','2024-06-24 11:29:54.196'),('5e2bfce6-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',1,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:25:12.938','2024-06-24 11:29:54.196'),('5e2c4b0c-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:25:12.940','2024-06-24 11:25:12.940'),('5e2c4b0e-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:25:12.940','2024-06-24 11:25:12.940'),('5e2c4b10-31d9-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','5e2c4b0b-31d9-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:25:12.940','2024-06-24 11:25:12.940'),('744f848e-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',2,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:18:40.584','2024-06-24 11:20:03.587'),('744faba4-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:18:40.585','2024-06-24 11:18:40.585'),('8cecc998-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:19:21.880','2024-06-24 11:19:21.880'),('8cecc99a-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','744faba3-31d8-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:19:21.880','2024-06-24 11:19:21.880'),('8ced3ecc-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',1,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:19:21.883','2024-06-24 11:20:03.586'),('8ced3ece-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',1,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:19:21.883','2024-06-24 11:20:03.586'),('8cedb404-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:19:21.886','2024-06-24 11:19:21.886'),('8cedb406-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:19:21.886','2024-06-24 11:19:21.886'),('8cedb408-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:19:21.886','2024-06-24 11:19:21.886'),('94a43dec-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31',NULL,'deptLeader','string',0,NULL,NULL,NULL,'',NULL,'2024-06-21 10:40:11.318','2024-06-21 10:40:11.318'),('94a46502-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','94a43dee-2f77-11ef-803b-da80833f9b31','94a46501-2f77-11ef-803b-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'',NULL,'2024-06-21 10:40:11.319','2024-06-21 10:40:11.319'),('a5c7b3ec-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f8490-31d8-11ef-8bc1-da80833f9b31','8ced8cf3-31d8-11ef-8bc1-da80833f9b31','FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:20:03.580','2024-06-24 11:20:03.580'),('a5c89e4f-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31','744f848d-31d8-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:20:03.586','2024-06-24 11:20:03.586'),('bbbd4dd4-31d7-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31','FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:13:30.925','2024-06-24 11:13:30.925'),('bbbdea17-31d7-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_23u95jb','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:13:30.929','2024-06-24 11:13:30.929'),('bfb805d6-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',2,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:20:47.098','2024-06-24 11:29:54.197'),('bfb82cec-31d8-11ef-8bc1-da80833f9b31','bfb805d5-31d8-11ef-8bc1-da80833f9b31','bfb805d8-31d8-11ef-8bc1-da80833f9b31','bfb805db-31d8-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:20:47.099','2024-06-24 11:20:47.099'),('e65723a6-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,'deptLeader','string',2,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:00:23.405','2024-06-24 11:13:30.931'),('e6610ebc-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:00:23.469','2024-06-24 11:00:23.469'),('f9047b20-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:00:54.739','2024-06-24 11:00:54.739'),('f9047b22-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','e65ffd4b-31d5-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:00:54.739','2024-06-24 11:00:54.739'),('f9058c94-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_3qipis2','string',1,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:00:54.746','2024-06-24 11:13:30.929'),('f9058c96-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31',NULL,'FormProperty_0lffpcm','null',1,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:00:54.746','2024-06-24 11:13:30.931'),('f90824ac-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31','FormProperty_3qipis2','string',0,NULL,NULL,NULL,'0',NULL,'2024-06-24 11:00:54.763','2024-06-24 11:00:54.763'),('f90824ae-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31','FormProperty_0lffpcm','null',0,NULL,NULL,NULL,NULL,NULL,'2024-06-24 11:00:54.763','2024-06-24 11:00:54.763'),('f90824b0-31d5-11ef-8bc1-da80833f9b31','e6568765-31d5-11ef-8bc1-da80833f9b31','e657bfe8-31d5-11ef-8bc1-da80833f9b31','f90824ab-31d5-11ef-8bc1-da80833f9b31','deptLeader','string',0,NULL,NULL,NULL,'wsj3',NULL,'2024-06-24 11:00:54.763','2024-06-24 11:00:54.763');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_RELEASE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('0af2795d-2f1b-11ef-803b-da80833f9b31',NULL,NULL,NULL,'','2024-06-20 15:37:46.606',NULL,NULL,'1');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31',5,'http://www.kafeitu.me/activiti/leave','请假流程-普通表单','leave',1,'0af2795d-2f1b-11ef-803b-da80833f9b31','leave.bpmn',NULL,'请假流程演示',0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('3d8a92c0-2f77-11ef-803b-da80833f9b31',1,'3d8a92c0-2f77-11ef-803b-da80833f9b31','da068dc9-207c-407e-9a38-e34d7e271d0c',NULL,'leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL,1,0,1,0,0,1,NULL,'','王少杰的年假申请','2024-06-21 10:37:45.188',NULL,NULL,0,0,0,0,0,0,0,0,0),('3d8c4073-2f77-11ef-803b-da80833f9b31',1,'3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31','deptLeaderVerify',1,0,0,0,0,1,NULL,'',NULL,'2024-06-21 10:37:45.199',NULL,NULL,0,0,0,0,0,0,0,0,0),('94a43deb-2f77-11ef-803b-da80833f9b31',1,'94a43deb-2f77-11ef-803b-da80833f9b31','6dd79f82-efb5-485f-b6bf-0388f7539097',NULL,'leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31',NULL,1,0,1,0,0,1,NULL,'','王少杰的年假申请','2024-06-21 10:40:11.318',NULL,NULL,0,0,0,0,0,0,0,0,0),('94a43dee-2f77-11ef-803b-da80833f9b31',1,'94a43deb-2f77-11ef-803b-da80833f9b31',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31','deptLeaderVerify',1,0,0,0,0,1,NULL,'',NULL,'2024-06-21 10:40:11.318',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('3d94cbf9-2f77-11ef-803b-da80833f9b31',1,NULL,'candidate','','3d914986-2f77-11ef-803b-da80833f9b31',NULL,NULL),('3d94f30a-2f77-11ef-803b-da80833f9b31',1,NULL,'participant','',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL),('94a48c14-2f77-11ef-803b-da80833f9b31',1,NULL,'candidate','','94a46501-2f77-11ef-803b-da80833f9b31',NULL,NULL),('94a48c15-2f77-11ef-803b-da80833f9b31',1,NULL,'participant','',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_integration`
--

DROP TABLE IF EXISTS `act_ru_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_integration` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FLOW_NODE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATED_DATE_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_INT_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_INT_PROC_INST` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_INT_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INT_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INT_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INT_PROC_INST` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_integration`
--

LOCK TABLES `act_ru_integration` WRITE;
/*!40000 ALTER TABLE `act_ru_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('3d914986-2f77-11ef-803b-da80833f9b31',1,'3d8c4073-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','部门领导审批',NULL,NULL,'deptLeaderVerify',NULL,NULL,NULL,50,'2024-06-21 02:37:45.211',NULL,NULL,1,'','deptLeaderVerify',NULL),('94a46501-2f77-11ef-803b-da80833f9b31',1,'94a43dee-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31','部门领导审批',NULL,NULL,'deptLeaderVerify',NULL,NULL,NULL,50,'2024-06-21 02:40:11.319',NULL,NULL,1,'','deptLeaderVerify',NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('3d8b7d21-2f77-11ef-803b-da80833f9b31',1,'string','deptLeader','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31',NULL,NULL,NULL,NULL,'',NULL),('3d93e197-2f77-11ef-803b-da80833f9b31',1,'string','deptLeader','3d8c4073-2f77-11ef-803b-da80833f9b31','3d8a92c0-2f77-11ef-803b-da80833f9b31','3d914986-2f77-11ef-803b-da80833f9b31',NULL,NULL,NULL,'',NULL),('94a43dec-2f77-11ef-803b-da80833f9b31',1,'string','deptLeader','94a43deb-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31',NULL,NULL,NULL,NULL,'',NULL),('94a46502-2f77-11ef-803b-da80833f9b31',1,'string','deptLeader','94a43dee-2f77-11ef-803b-da80833f9b31','94a43deb-2f77-11ef-803b-da80833f9b31','94a46501-2f77-11ef-803b-da80833f9b31',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_workflow_formdata`
--

DROP TABLE IF EXISTS `act_workflow_formdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_workflow_formdata` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `business_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '事务key',
  `form_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单Key',
  `control_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单id',
  `control_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单名',
  `control_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表单值',
  `task_node_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务节点名称',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者姓名',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='动态表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_workflow_formdata`
--

LOCK TABLES `act_workflow_formdata` WRITE;
/*!40000 ALTER TABLE `act_workflow_formdata` DISABLE KEYS */;
INSERT INTO `act_workflow_formdata` VALUES (28,'208d3401-7e06-44b5-b2f9-6b5f511d33f7','deptLeaderVerify','FormProperty_3qipis2','审批意见','同意','部门领导审批','王少杰3','wsj3','2024-06-24 11:00:55'),(29,'208d3401-7e06-44b5-b2f9-6b5f511d33f7','deptLeaderVerify','FormProperty_0lffpcm','批注',NULL,'部门领导审批','王少杰3','wsj3','2024-06-24 11:00:55'),(30,'208d3401-7e06-44b5-b2f9-6b5f511d33f7','hrVerify','FormProperty_23u95jb','审批意见','同意','人事审批','王少杰2','wsj2','2024-06-24 11:13:31'),(31,'208d3401-7e06-44b5-b2f9-6b5f511d33f7','hrVerify','FormProperty_3t7tfkv','批注',NULL,'人事审批','王少杰2','wsj2','2024-06-24 11:13:31'),(32,'f6ca2bd1-6c46-4c97-87ef-9c8026327afa','deptLeaderVerify','FormProperty_3qipis2','审批意见','同意','部门领导审批','王少杰3','wsj3','2024-06-24 11:19:22'),(33,'f6ca2bd1-6c46-4c97-87ef-9c8026327afa','deptLeaderVerify','FormProperty_0lffpcm','批注',NULL,'部门领导审批','王少杰3','wsj3','2024-06-24 11:19:22'),(34,'f6ca2bd1-6c46-4c97-87ef-9c8026327afa','hrVerify','FormProperty_23u95jb','审批意见','同意','人事审批','王少杰2','wsj2','2024-06-24 11:20:04'),(35,'f6ca2bd1-6c46-4c97-87ef-9c8026327afa','hrVerify','FormProperty_3t7tfkv','批注',NULL,'人事审批','王少杰2','wsj2','2024-06-24 11:20:04'),(36,'4b4d07d4-6681-42d0-9716-45b2b14a3937','deptLeaderVerify','FormProperty_3qipis2','审批意见','同意','部门领导审批','王少杰3','wsj3','2024-06-24 11:25:13'),(37,'4b4d07d4-6681-42d0-9716-45b2b14a3937','deptLeaderVerify','FormProperty_0lffpcm','批注',NULL,'部门领导审批','王少杰3','wsj3','2024-06-24 11:25:13'),(38,'4b4d07d4-6681-42d0-9716-45b2b14a3937','hrVerify','FormProperty_23u95jb','审批意见','同意','人事审批','王少杰2','wsj2','2024-06-24 11:29:54'),(39,'4b4d07d4-6681-42d0-9716-45b2b14a3937','hrVerify','FormProperty_3t7tfkv','批注','123','人事审批','王少杰2','wsj2','2024-06-24 11:29:54');
/*!40000 ALTER TABLE `act_workflow_formdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-06-24 15:50:12','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-06-24 15:50:12','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-06-24 15:50:12','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-06-24 15:50:12','admin','2024-06-24 23:08:37','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-06-24 15:50:12','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-06-24 15:50:12','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(100,'账号自助-验证码类型','sys.account.captchaSelect','ajcaptcha','Y','admin','2024-06-24 17:45:54','admin','2024-06-25 09:29:25','开启验证码类型（default默认，ajcaptcha滑块）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-24 15:50:11','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-24 15:50:12','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-24 15:50:12','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-24 15:50:12','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-24 15:50:12','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-24 15:50:12','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-24 15:50:12','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-06-24 15:50:12','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-06-24 15:50:12','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-24 15:50:12','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-24 15:50:12','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-24 15:50:12','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-24 15:50:12','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-24 15:50:12','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-24 15:50:12','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-24 15:50:12','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-24 15:50:12','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-24 15:50:12','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-24 15:50:12','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-24 15:50:12','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-24 15:50:12','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-24 15:50:12','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-24 15:50:12','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-24 15:50:12','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-24 15:50:12','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-24 15:50:12','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-24 15:50:12','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-06-24 15:50:12','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-06-24 15:50:12','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-06-24 15:50:12','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-06-24 15:50:12','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-06-24 15:50:12','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-06-24 15:50:12','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-06-24 15:50:12','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-06-24 15:50:12','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 17:16:17'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 17:16:28'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 17:16:39'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 21:25:41'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 21:28:35'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 21:28:54'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 21:31:05'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 21:46:58'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 21:48:18'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 21:49:23'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 21:51:36'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 21:51:38'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 21:54:08'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:08:18'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:14:38'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:15:41'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:18:16'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:19:20'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:34:42'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 22:34:50'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 22:49:44'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:52:46'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:52:53'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 22:52:57'),(124,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:53:28'),(125,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:53:31'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:53:37'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 22:54:15'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 23:01:38'),(129,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 23:08:17'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 23:08:23'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 23:08:43'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 23:08:48'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 09:29:02'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 09:29:30'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:29:34'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 09:29:40'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 09:30:02'),(138,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:30:14'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:30:19'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:30:33'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:33:08'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:34:35'),(143,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-25 09:35:34'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 09:38:23'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 09:38:56'),(146,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 09:39:04'),(147,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 09:39:09'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 09:39:50'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 09:53:42'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-25 10:15:25'),(151,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-25 10:34:15');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-06-24 15:50:11','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-06-24 15:50:11','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-06-24 15:50:11','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-06-24 15:50:11','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-06-24 15:50:11','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-24 15:50:11','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-24 15:50:11','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-24 15:50:11','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-06-24 15:50:11','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-24 15:50:11','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-24 15:50:11','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-24 15:50:11','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-06-24 15:50:11','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-24 15:50:11','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-24 15:50:11','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-24 15:50:11','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-24 15:50:11','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-24 15:50:11','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-24 15:50:11','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-24 15:50:11','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-24 15:50:11','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-06-24 15:50:11','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-24 15:50:11','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-24 15:50:11','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-24 15:50:11','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-24 15:50:11','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-24 15:50:11','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-24 15:50:11','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-24 15:50:11','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-24 15:50:11','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-24 15:50:11','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-24 15:50:11','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-24 15:50:11','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-24 15:50:11','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-24 15:50:11','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-24 15:50:11','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-24 15:50:11','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-24 15:50:11','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-24 15:50:12','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-24 15:50:12','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.add()','POST',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"math\",\"params\":{},\"remark\":\"math计算\\nslider 滑块\"}','{\"msg\":\"新增参数\'账号自助-验证码类型\'失败，参数键名已存在\",\"code\":500}',0,NULL,'2024-06-24 17:45:43',12),(101,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.add()','POST',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configKey\":\"sys.account.captchaType\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"math\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"math计算\\nslider 滑块\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 17:45:54',16),(102,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaType\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"math\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（math计算，slider滑块）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 17:46:46',13),(103,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaType\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"slider\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（math计算，slider滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 17:46:46\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 21:31:58',18),(104,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaType\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"ajcaptcha\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（default，ajcaptcha滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 21:31:58\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 22:36:45',19),(105,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaType\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"ajcaptcha\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（default默认，ajcaptcha滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 22:36:45\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 22:37:01',10),(106,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaSelect\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"ajcaptcha\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（default默认，ajcaptcha滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 22:37:01\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 22:38:31',16),(107,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 15:50:12\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 22:53:19',21),(108,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaSelect\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"default\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（default默认，ajcaptcha滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 22:38:31\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 23:08:06',15),(109,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 15:50:12\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 22:53:19\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 23:08:37',9),(110,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":100,\"configKey\":\"sys.account.captchaSelect\",\"configName\":\"账号自助-验证码类型\",\"configType\":\"Y\",\"configValue\":\"ajcaptcha\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 17:45:54\",\"params\":{},\"remark\":\"开启验证码类型（default默认，ajcaptcha滑块）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-24 23:08:06\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-25 09:29:25',19);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-24 15:50:11','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-06-24 15:50:11','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-06-24 15:50:11','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-06-24 15:50:11','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-24 15:50:11','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-06-24 15:50:11','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-25 10:15:25','admin','2024-06-24 15:50:11','','2024-06-25 10:15:25','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-24 15:50:11','admin','2024-06-24 15:50:11','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_student`
--

DROP TABLE IF EXISTS `test_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_student` (
  `student_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `student_name` varchar(50) NOT NULL COMMENT '姓名',
  `student_age` char(1) NOT NULL COMMENT '年龄',
  `student_sex` char(1) DEFAULT NULL COMMENT '性别',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_student`
--

LOCK TABLES `test_student` WRITE;
/*!40000 ALTER TABLE `test_student` DISABLE KEYS */;
INSERT INTO `test_student` VALUES (1,'王少杰','1',NULL,'','2024-06-19 22:50:50','',NULL,NULL);
/*!40000 ALTER TABLE `test_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_leave`
--

DROP TABLE IF EXISTS `workflow_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_leave` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `type` char(36) DEFAULT NULL COMMENT '请假类型',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `leave_start_time` date DEFAULT NULL COMMENT '开始时间',
  `leave_end_time` date DEFAULT NULL COMMENT '结束时间',
  `attachment_link` varchar(2048) DEFAULT NULL COMMENT '附件',
  `instance_id` varchar(36) DEFAULT NULL COMMENT '流程实例ID',
  `state` char(1) DEFAULT NULL COMMENT '状态',
  `create_name` varchar(36) DEFAULT NULL COMMENT '创建者名称',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='请假';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_leave`
--

LOCK TABLES `workflow_leave` WRITE;
/*!40000 ALTER TABLE `workflow_leave` DISABLE KEYS */;
INSERT INTO `workflow_leave` VALUES ('208d3401-7e06-44b5-b2f9-6b5f511d33f7','年假','王少杰的年假申请','123','2024-06-05','2024-06-20',NULL,'e6568765-31d5-11ef-8bc1-da80833f9b31','1','王少杰','wsj','2024-06-24 11:00:24','2024-06-24 11:13:31'),('4b4d07d4-6681-42d0-9716-45b2b14a3937','年假','王少杰的年假申请','123','2024-06-05','2024-06-05',NULL,'bfb805d5-31d8-11ef-8bc1-da80833f9b31','1','王少杰','wsj','2024-06-24 11:20:47','2024-06-24 11:29:54'),('6dd79f82-efb5-485f-b6bf-0388f7539097','年假','王少杰的年假申请','1234','2024-06-22','2024-06-19',NULL,'94a43deb-2f77-11ef-803b-da80833f9b31','0','王少杰','wsj','2024-06-21 10:40:11',NULL),('da068dc9-207c-407e-9a38-e34d7e271d0c','年假','王少杰的年假申请','123','2024-06-21','2024-06-22',NULL,'3d8a92c0-2f77-11ef-803b-da80833f9b31','0','王少杰','wsj','2024-06-21 10:37:45',NULL),('f6ca2bd1-6c46-4c97-87ef-9c8026327afa','病假','王少杰的病假申请','ce','2024-06-05','2024-06-13',NULL,'744f848d-31d8-11ef-8bc1-da80833f9b31','1','王少杰','wsj','2024-06-24 11:18:41','2024-06-24 11:20:04');
/*!40000 ALTER TABLE `workflow_leave` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 10:38:10
