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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (2,'test_student','学生',NULL,NULL,'TestStudent','crud','','com.ruoyi.system','system','student','学生','ruoyi','0','/',NULL,'admin','2024-06-19 22:38:49','',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (10,2,'student_id','ID','int','Long','studentId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-19 22:38:49','',NULL),(11,2,'student_name','姓名','varchar(50)','String','studentName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-19 22:38:49','',NULL),(12,2,'student_age','年龄','char(1)','String','studentAge','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-06-19 22:38:49','',NULL),(13,2,'student_sex','性别','char(1)','String','studentSex','0','0','0','1','1','1','1','EQ','select','',4,'admin','2024-06-19 22:38:49','',NULL),(14,2,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',5,'admin','2024-06-19 22:38:49','',NULL),(15,2,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2024-06-19 22:38:49','',NULL),(16,2,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',7,'admin','2024-06-19 22:38:49','',NULL),(17,2,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',8,'admin','2024-06-19 22:38:49','',NULL),(18,2,'remark','备注','varchar(255)','String','remark','0','0','0','1','1','1',NULL,'EQ','input','',9,'admin','2024-06-19 22:38:49','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-06-18 16:20:37','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-06-18 16:20:37','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-06-18 16:20:37','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2024-06-18 16:20:37','wsj','2024-06-24 14:22:25','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-06-18 16:20:37','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-06-18 16:20:37','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
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
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-18 16:20:37','',NULL);
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
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-18 16:20:37','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-18 16:20:37','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-18 16:20:37','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-18 16:20:37','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-18 16:20:37','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-18 16:20:37','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-06-18 16:20:37','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-06-18 16:20:37','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-18 16:20:37','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-18 16:20:37','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-18 16:20:37','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-18 16:20:37','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-18 16:20:37','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-18 16:20:37','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-18 16:20:37','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-18 16:20:37','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-18 16:20:37','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-18 16:20:37','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-18 16:20:37','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-18 16:20:37','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-18 16:20:37','',NULL,'停用状态');
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
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-18 16:20:37','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-18 16:20:37','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-18 16:20:37','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-18 16:20:37','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-18 16:20:37','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-06-18 16:20:37','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-06-18 16:20:37','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-06-18 16:20:37','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-06-18 16:20:37','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-06-18 16:20:37','',NULL,'登录状态列表');
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
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-06-18 16:20:38','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','1','1','1','admin','2024-06-18 16:20:38','admin','2024-06-18 16:43:10',''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-06-18 16:20:38','',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 16:37:59'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-18 16:38:13'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 16:39:25'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-18 17:07:18'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 17:07:24'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-18 17:30:42'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 17:30:47'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 23:23:13'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-18 23:23:57'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 23:24:01'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-18 23:24:46'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 23:24:50'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 23:32:40'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 00:04:06'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 09:07:56'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 10:09:54'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 11:54:05'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 13:47:44'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 14:48:33'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 14:48:49'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 14:50:08'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 14:50:41'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 15:24:31'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:26:26'),(124,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 15:35:40'),(125,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:36:54'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:44:39'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:45:06'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:53:14'),(129,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 16:13:09'),(130,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 16:34:54'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 16:34:58'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 16:42:43'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 16:42:51'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 16:43:22'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 16:43:25'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 16:45:00'),(137,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 16:45:07'),(138,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 17:06:13'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 17:06:43'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 17:16:36'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 17:17:08'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 17:17:16'),(143,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 17:17:28'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 22:27:35'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 22:51:29'),(146,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 22:53:02'),(147,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 22:53:11'),(148,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 23:46:16'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-19 23:47:21'),(150,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-19 23:47:29'),(151,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 23:47:35'),(152,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 09:57:50'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:16:32'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 10:16:42'),(155,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:16:54'),(156,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 10:17:33'),(157,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:17:41'),(158,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 10:18:25'),(159,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:18:39'),(160,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 10:19:13'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:19:17'),(162,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 10:20:07'),(163,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 10:20:14'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 11:22:46'),(165,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 11:24:02'),(166,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 11:24:56'),(167,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 11:46:56'),(168,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 11:47:07'),(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:15:28'),(170,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:16:32'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-20 17:22:21'),(172,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:22:28'),(173,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 17:23:09'),(174,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:23:17'),(175,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 17:44:39'),(176,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:45:30'),(177,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 17:57:38'),(178,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-06-20 20:20:50'),(179,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 20:57:43'),(180,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:15:31'),(181,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:31:43'),(182,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:31:49'),(183,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 21:32:06'),(184,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:32:16'),(185,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 21:49:40'),(186,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:51:32'),(187,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-20 21:51:37'),(188,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:51:41'),(189,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 21:52:46'),(190,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:52:54'),(191,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 21:57:36'),(192,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 21:59:46'),(193,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:00:04'),(194,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:15:28'),(195,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 22:26:10'),(196,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:27:15'),(197,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:27:50'),(198,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:28:02'),(199,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:32:34'),(200,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 22:42:30'),(201,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-20 22:42:41'),(202,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-20 22:42:51'),(203,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:48:15'),(204,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 22:54:14'),(205,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 22:54:27'),(206,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-20 23:19:02'),(207,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 23:19:08'),(208,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-20 23:42:30'),(209,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 10:27:14'),(210,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 13:35:26'),(211,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 13:35:32'),(212,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 14:55:48'),(213,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 14:55:53'),(214,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 15:19:36'),(215,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 15:46:45'),(216,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 15:46:54'),(217,'guanxing','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 16:40:40'),(218,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 16:40:45'),(219,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 16:40:53'),(220,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 16:41:03'),(221,'guanyu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 17:20:32'),(222,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 17:20:41'),(223,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-21 17:23:57'),(224,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-21 17:24:00'),(225,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 09:51:30'),(226,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 10:47:44'),(227,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 10:48:41'),(228,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-06-24 10:51:03'),(229,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 10:57:18'),(230,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 10:57:34'),(231,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-24 10:57:39'),(232,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 10:57:42'),(233,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 10:58:01'),(234,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 10:58:54'),(235,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 10:59:51'),(236,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 10:59:59'),(237,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:00:34'),(238,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:00:43'),(239,'guanyu','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2024-06-24 11:09:47'),(240,'wsj2','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-06-24 11:09:57'),(241,'wsj2','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2024-06-24 11:10:48'),(242,'wsj3','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-06-24 11:10:56'),(243,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:13:15'),(244,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:13:23'),(245,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:17:07'),(246,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:17:14'),(247,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:17:22'),(248,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:17:30'),(249,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:17:38'),(250,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:17:47'),(251,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:18:51'),(252,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:18:57'),(253,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:19:07'),(254,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:19:15'),(255,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:19:50'),(256,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:19:55'),(257,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:20:19'),(258,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:20:32'),(259,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:20:54'),(260,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:21:02'),(261,'wsj3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:25:39'),(262,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:26:25'),(263,'wsj2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 11:30:24'),(264,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:30:31'),(265,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:39:32'),(266,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:45:26'),(267,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:49:02'),(268,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:55:12'),(269,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:56:27'),(270,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 11:59:07'),(271,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 13:36:59'),(272,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 13:38:59'),(273,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 13:44:01'),(274,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 14:21:07'),(275,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:21:14'),(276,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 14:21:28'),(277,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-24 14:21:36'),(278,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-06-24 14:21:57'),(279,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:22:05'),(280,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-24 14:22:35'),(281,'wsj','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:22:48'),(282,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:28:20'),(283,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:31:39'),(284,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 14:42:18'),(285,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-24 15:21:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=2027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-06-18 16:20:37','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-06-18 16:20:37','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-06-18 16:20:37','',NULL,'系统工具目录'),(4,'若依官网',0,999,'http://ruoyi.vip',NULL,'',0,0,'M','1','1','','guide','admin','2024-06-18 16:20:37','admin','2024-06-19 14:04:51','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-06-18 16:20:37','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-18 16:20:37','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-18 16:20:37','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-18 16:20:37','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-06-18 16:20:37','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-18 16:20:37','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-18 16:20:37','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-18 16:20:37','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-06-18 16:20:37','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-18 16:20:37','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-18 16:20:37','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-18 16:20:37','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-18 16:20:37','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-18 16:20:37','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-18 16:20:37','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-18 16:20:37','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-18 16:20:37','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-06-18 16:20:37','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-18 16:20:37','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-18 16:20:37','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-18 16:20:37','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-18 16:20:37','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-18 16:20:37','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-18 16:20:37','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-18 16:20:37','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-18 16:20:37','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-18 16:20:37','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-18 16:20:37','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-18 16:20:37','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-18 16:20:37','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-18 16:20:37','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-18 16:20:37','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-18 16:20:37','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-18 16:20:37','',NULL,''),(2000,'流程菜单',0,4,'activiti',NULL,NULL,1,0,'M','0','0','activiti:modeler:list','cascader','admin','2024-06-18 17:09:39','admin','2024-06-19 00:17:57',''),(2001,'流程定义',2000,1,'definition','activiti/definition/index',NULL,1,0,'C','0','0','activiti:modeler','#','admin','2024-06-18 17:12:59','admin','2024-06-18 23:27:53',''),(2006,'我的OA',0,5,'OA',NULL,NULL,1,0,'M','0','0','','guide','admin','2024-06-19 14:05:41','admin','2024-06-19 14:11:40',''),(2007,'请假',2006,1,'leave','workflow/leave/index',NULL,1,0,'C','0','0','workflow:leave:list','#','admin','2024-06-19 14:06:54','',NULL,''),(2008,'请假查询',2007,1,'',NULL,NULL,1,0,'F','0','0','workflow:leave:query','#','admin','2024-06-19 14:07:23','',NULL,''),(2009,'请假新增',2007,2,'',NULL,NULL,1,0,'F','0','0','workflow:leave:add','#','admin','2024-06-19 14:07:42','',NULL,''),(2010,'请假修改',2007,3,'',NULL,NULL,1,0,'F','0','0','workflow:leave:edit','#','admin','2024-06-19 14:10:00','',NULL,''),(2011,'请假删除',2007,4,'',NULL,NULL,1,0,'F','0','0','workflow:leave:remove','#','admin','2024-06-19 14:10:20','',NULL,''),(2012,'请假导出',2007,5,'',NULL,NULL,1,0,'F','0','0','workflow:leave:export','#','admin','2024-06-19 14:10:50','',NULL,''),(2016,'待办任务',0,6,'task',NULL,NULL,1,0,'M','0','0','','excel','admin','2020-11-04 10:53:24','admin','2020-11-10 22:26:46',''),(2017,'代办任务',2016,1,'task','activiti/task',NULL,1,0,'C','0','0','','#','admin','2020-11-04 10:54:28','admin','2024-06-19 15:53:42',''),(2019,'历史流程',0,7,'open',NULL,NULL,1,0,'M','0','0',NULL,'eye-open','admin','2020-11-10 22:17:36','',NULL,''),(2020,'请假历史',2019,1,'leaveAll','workflow/leave/leaveAll',NULL,1,0,'C','0','0','workflow:leave:list1','#','admin','2020-10-28 22:30:57','admin','2024-06-19 16:10:01','请假菜单'),(2021,'学生',3,1,'student','system/student/index',NULL,1,0,'M','0','0','system:student:list','#','admin','2024-06-19 22:39:40','admin','2024-06-19 22:50:16','学生菜单'),(2022,'学生查询',2021,1,'#','',NULL,1,0,'F','0','0','system:student:query','#','admin','2024-06-19 22:39:40','',NULL,''),(2023,'学生新增',2021,2,'#','',NULL,1,0,'F','0','0','system:student:add','#','admin','2024-06-19 22:39:40','',NULL,''),(2024,'学生修改',2021,3,'#','',NULL,1,0,'F','0','0','system:student:edit','#','admin','2024-06-19 22:39:40','',NULL,''),(2025,'学生删除',2021,4,'#','',NULL,1,0,'F','0','0','system:student:remove','#','admin','2024-06-19 22:39:40','',NULL,''),(2026,'学生导出',2021,5,'#','',NULL,1,0,'F','0','0','system:student:export','#','admin','2024-06-19 22:39:40','',NULL,'');
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
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-18 16:20:38','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-18 16:20:38','',NULL,'管理员');
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
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.edit()','PUT',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 16:20:38\",\"cronExpression\":\"0/15 * * * * ?\",\"invokeTarget\":\"ryTask.ryParams(\'ry\')\",\"jobGroup\":\"DEFAULT\",\"jobId\":2,\"jobName\":\"系统默认（有参）\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-18 16:43:15\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 16:43:10',27),(101,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程菜单\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"activiti\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 17:09:39',20),(102,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 17:09:39\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程菜单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"activiti\",\"perms\":\"activiti:modeler:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 17:11:02',8),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/definition/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程定义\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"definition\",\"perms\":\"activiti:modeler\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 17:12:59',9),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 17:09:39\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程菜单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"activiti\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:23:45',15),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/definition/index\",\"createTime\":\"2024-06-18 17:12:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"流程定义\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"definition\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:24:32',17),(106,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 17:09:39\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程菜单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"activiti\",\"perms\":\"activiti:modeler:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:27:29',17),(107,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/definition/index\",\"createTime\":\"2024-06-18 17:12:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"流程定义\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"definition\",\"perms\":\"activiti:modeler\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:27:53',10),(108,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"test\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"13\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:31:21',16),(109,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"11\",\"menuType\":\"C\",\"orderNum\":111,\"params\":{},\"parentId\":2002,\"path\":\"111\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:31:36',10),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2024-06-18 23:31:36\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"11\",\"menuType\":\"C\",\"orderNum\":111,\"params\":{},\"parentId\":2002,\"path\":\"111\",\"perms\":\"tool:build:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:46:23',45),(111,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-06-18 23:48:43',12),(112,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:48:49',90),(113,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:48:51',16),(114,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统管理11\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:50:02',26),(115,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tool/build/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2004,\"path\":\"build\",\"perms\":\"tool:build:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-18 23:50:34',9),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 23:50:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"系统管理11\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 00:17:11',10),(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 17:09:39\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程菜单\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"activiti\",\"perms\":\"activiti:modeler:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 00:17:57',7),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2024-06-18 23:50:34\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"表单构建\",\"menuType\":\"M\",\"orderNum\":99,\"params\":{},\"parentId\":2004,\"path\":\"build\",\"perms\":\"tool:build:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 00:18:01',9),(119,'流程定义管理',6,'com.ruoyi.activiti.controller.ProcessDefinitionController.uploadStreamAndDeployment()','POST',1,'admin','研发部门','/processDefinition/uploadStreamAndDeployment','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 11:58:23',420),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 16:20:37\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:04:20',24),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-06-19 14:04:26',4),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2005','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:04:29',24),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:04:31',11),(124,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-18 16:20:37\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":999,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:04:51',8),(125,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的OA\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"OA\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:05:41',11),(126,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workflow/leave/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"leave\",\"perms\":\"workflow:leave:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:06:54',7),(127,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"workflow:leave:query\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:07:23',5),(128,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"workflow:leave:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:07:42',7),(129,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"workflow:leave:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:10:00',7),(130,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"perms\":\"workflow:leave:remove\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:10:20',6),(131,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"perms\":\"workflow:leave:export\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:10:50',7),(132,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-19 14:05:41\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"我的OA\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"OA\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:11:40',5),(133,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/task\",\"createTime\":\"2020-11-04 10:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"代办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"task\",\"perms\":\"activiti:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:31:04',11),(134,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/task/list\",\"createTime\":\"2020-11-04 10:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"代办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"task\",\"perms\":\"activiti:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:54:02',20),(135,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/activiti/task/list\",\"createTime\":\"2020-11-04 10:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"代办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"task\",\"perms\":\"activiti:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:55:48',9),(136,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/task\",\"createTime\":\"2020-11-04 10:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"代办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"task\",\"perms\":\"activiti:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 14:56:29',12),(137,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"activiti/task\",\"createTime\":\"2020-11-04 10:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"代办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"task\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 15:53:42',18),(138,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workflow/leave/leaveAll1\",\"createTime\":\"2020-10-28 22:30:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"请假历史\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"leaveAll\",\"perms\":\"workflow:leave:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:09:16',9),(139,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workflow/leave/leaveAll\",\"createTime\":\"2020-10-28 22:30:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"请假历史\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"leaveAll\",\"perms\":\"workflow:leave:list1\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:10:01',12),(140,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"王少杰\",\"params\":{},\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"wsj\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:12:53',111),(141,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:14:07',26),(142,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'wsj','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:16:37',14),(143,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:43:57',24),(144,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:44:46',29848),(145,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:44:54',3775),(146,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:45:37\",\"id\":\"9bf38a29-c5af-4d55-af9b-bd6856142184\",\"leaveEndTime\":\"2024-06-20\",\"leaveStartTime\":\"2024-06-19\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-19 16:45:37',23),(147,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:45:43\",\"id\":\"3e797977-9f45-40dc-b830-b8df33512b6a\",\"leaveEndTime\":\"2024-06-20\",\"leaveStartTime\":\"2024-06-19\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-19 16:45:43',4),(148,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 16:46:59',9154),(149,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:47:12\",\"id\":\"e9ad9a3f-08b0-46de-936a-dd75d0a544ba\",\"leaveEndTime\":\"2024-06-04\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-19 16:47:12',5),(150,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:47:49\",\"id\":\"b2c5fceb-c957-43bd-a2e1-3bd553edfe4c\",\"leaveEndTime\":\"2024-06-04\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-19 16:57:08',4),(151,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:57:10\",\"id\":\"46717957-cf72-4a6d-9965-f5af49c3b7d0\",\"leaveEndTime\":\"2024-06-04\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-19 16:57:10',2),(152,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 16:57:10\",\"id\":\"979bb477-203c-4cb9-a974-b7b68b8bcd9b\",\"leaveEndTime\":\"2024-06-04\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-19 16:57:11',609),(153,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 17:17:57\",\"id\":\"4ff12c00-81df-4ed3-b150-717f881cbc74\",\"leaveEndTime\":\"2024-06-13\",\"leaveStartTime\":\"2024-06-19\",\"params\":{},\"reason\":\"1\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-19 17:17:57',2),(154,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 17:19:45\",\"id\":\"f526b236-624c-4e5f-8951-90d14d3b7ada\",\"leaveEndTime\":\"2024-06-13\",\"leaveStartTime\":\"2024-06-19\",\"params\":{},\"reason\":\"1\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-19 17:20:30',65282),(155,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"test_student\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:35:22',61),(156,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/test_student','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:35:45',34),(157,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"student\",\"className\":\"TestStudent\",\"columns\":[{\"capJavaField\":\"StudentId\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-19 22:35:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-19 22:35:45\",\"usableColumn\":false},{\"capJavaField\":\"StudentName\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"student_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-19 22:35:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-19 22:35:45\",\"usableColumn\":false},{\"capJavaField\":\"StudentAge\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"student_age\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-19 22:35:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentAge\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-19 22:35:45\",\"usableColumn\":false},{\"capJavaField\":\"StudentSex\",\"columnComment\":\"性别\",\"columnId\":4,\"columnName\":\"student_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-19 22:35:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":f','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:36:42',32),(158,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/test_student','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:37:09',24),(159,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_student\"}',NULL,0,NULL,'2024-06-19 22:37:33',75),(160,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:38:41',17),(161,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"test_student\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:38:49',31),(162,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_student\"}',NULL,0,NULL,'2024-06-19 22:38:54',62),(163,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/student/index\",\"createTime\":\"2024-06-19 22:39:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"学生\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"student\",\"perms\":\"system:student:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:50:16',28),(164,'学生',1,'com.ruoyi.leave.controller.TestStudentController.add()','POST',1,'admin','研发部门','/system/student','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 22:50:36\",\"params\":{},\"studentAge\":\"12\",\"studentName\":\"王少杰\"}',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'student_age\' at row 1\r\n### The error may exist in file [D:\\workSapce\\gitee\\RuoYi-Vue\\ruoyi-workFlow\\target\\classes\\mapper\\leave\\system\\TestStudentMapper.xml]\r\n### The error may involve com.ruoyi.leave.mapper.TestStudentMapper.insertTestStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into test_student          ( student_name,             student_age,                                       create_time )           values ( ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'student_age\' at row 1\n; Data truncation: Data too long for column \'student_age\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'student_age\' at row 1','2024-06-19 22:50:37',51),(165,'学生',1,'com.ruoyi.leave.controller.TestStudentController.add()','POST',1,'admin','研发部门','/system/student','127.0.0.1','内网IP','{\"createTime\":\"2024-06-19 22:50:49\",\"params\":{},\"studentAge\":\"1\",\"studentId\":1,\"studentName\":\"王少杰\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:50:49',6),(166,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 22:55:35',16),(167,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin','研发部门','/system/role/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:00:02',10),(168,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin','研发部门','/system/role/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:00:04',10),(169,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:00:09',12),(170,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin','研发部门','/system/role/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:00:26',10),(171,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin','研发部门','/system/role/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:00:31',7),(172,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:02:57',17),(173,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:18:52',59),(174,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'wsj','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,2021,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,2022,2023,2024,2025,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"wsj\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:26:36',25),(175,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:27:03',17),(176,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:27:41',16),(177,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,2021,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,2022,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-19 23:43:30',64),(178,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 10:17:07\",\"id\":\"18cca4e5-e591-447a-92f9-d9ad3a7ce272\",\"leaveEndTime\":\"2024-06-21\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-20 10:17:07',19),(179,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"00fd15b2-ce55-4d64-974f-22d52c9b1ad5_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-20 10:17:58',468),(180,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-18 16:20:37\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2006,2007,2008,2009,2010,2011,2012,2016,2017,2019,2020,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 10:19:53',29),(181,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:23:57\",\"id\":\"8e37c018-5f66-491f-a6fb-7c299b6f15e8\",\"leaveEndTime\":\"2024-06-12\",\"leaveStartTime\":\"2024-06-12\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的年假申请\",\"type\":\"年假\"}',NULL,1,'不允许访问','2024-06-20 17:23:57',16),(182,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:24:38\",\"id\":\"e930fe1f-a3f7-46bd-881a-aa12b57bdf5f\",\"leaveEndTime\":\"2024-06-20\",\"leaveStartTime\":\"2024-06-04\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-20 17:24:38',2),(183,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:26:29\",\"id\":\"23db8639-ce8c-4998-9f3f-a99311bf636d\",\"leaveEndTime\":\"2024-06-20\",\"leaveStartTime\":\"2024-06-04\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-20 17:26:29',10),(184,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:30:51\",\"id\":\"8c1b452b-d174-4e9f-95a0-0e5fc39b8610\",\"leaveEndTime\":\"2024-06-12\",\"leaveStartTime\":\"2024-05-29\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的事假申请\",\"type\":\"事假\"}',NULL,1,'不允许访问','2024-06-20 17:30:51',4),(185,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:31:26\",\"id\":\"887ee140-19c7-4cc9-bca5-682a501bc8f2\",\"leaveEndTime\":\"2024-06-12\",\"leaveStartTime\":\"2024-05-29\",\"params\":{},\"reason\":\"123\",\"title\":\"undefined的事假申请\",\"type\":\"事假\"}',NULL,1,'不允许访问','2024-06-20 17:36:00',5),(186,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createTime\":\"2024-06-20 17:36:15\",\"id\":\"26fec5d7-f202-4bac-ab4a-4d1b0250ee25\",\"leaveEndTime\":\"2024-06-22\",\"leaveStartTime\":\"2024-06-12\",\"params\":{},\"reason\":\"12\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}',NULL,1,'不允许访问','2024-06-20 17:40:59',281988),(187,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-20 21:32:28\",\"id\":\"3ab25e93-f6ff-4a9f-bcdc-6ca4432bf4e7\",\"instanceId\":\"8994b53e-2f09-11ef-a68d-da80833f9b31\",\"leaveEndTime\":\"2024-06-07\",\"leaveStartTime\":\"2024-06-13\",\"params\":{},\"reason\":\"12\",\"state\":\"0\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 21:32:28',109),(188,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-20 21:32:32\",\"id\":\"56e60501-4c7b-4e08-a2f5-2d20f7441e1c\",\"instanceId\":\"8c1545a9-2f09-11ef-a68d-da80833f9b31\",\"leaveEndTime\":\"2024-06-07\",\"leaveStartTime\":\"2024-06-13\",\"params\":{},\"reason\":\"12\",\"state\":\"0\",\"title\":\"undefined的病假申请\",\"type\":\"病假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 21:32:32',24),(189,'流程定义管理',6,'com.ruoyi.activiti.controller.ProcessDefinitionController.uploadStreamAndDeployment()','POST',1,'wsj','研发部门','/processDefinition/uploadStreamAndDeployment','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 23:19:38',223),(190,'流程定义管理',6,'com.ruoyi.activiti.controller.ProcessDefinitionController.uploadStreamAndDeployment()','POST',1,'wsj','研发部门','/processDefinition/uploadStreamAndDeployment','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 23:22:51',38),(191,'流程定义管理',6,'com.ruoyi.activiti.controller.ProcessDefinitionController.uploadStreamAndDeployment()','POST',1,'wsj','研发部门','/processDefinition/uploadStreamAndDeployment','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-20 23:37:46',203),(192,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-21 10:37:45\",\"id\":\"da068dc9-207c-407e-9a38-e34d7e271d0c\",\"instanceId\":\"3d8a92c0-2f77-11ef-803b-da80833f9b31\",\"leaveEndTime\":\"2024-06-22\",\"leaveStartTime\":\"2024-06-21\",\"params\":{},\"reason\":\"123\",\"state\":\"0\",\"title\":\"王少杰的年假申请\",\"type\":\"年假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:37:45',170),(193,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-21 10:40:11\",\"id\":\"6dd79f82-efb5-485f-b6bf-0388f7539097\",\"instanceId\":\"94a43deb-2f77-11ef-803b-da80833f9b31\",\"leaveEndTime\":\"2024-06-19\",\"leaveStartTime\":\"2024-06-22\",\"params\":{},\"reason\":\"1234\",\"state\":\"0\",\"title\":\"王少杰的年假申请\",\"type\":\"年假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:40:11',22),(194,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"f6f81ca9-ce19-413b-9e23-83bf18086a69_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:40:26',647),(195,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"8c34f804-eaeb-4a4d-8318-c6ab812f1568_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:50:10',41),(196,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"15595a5a-7368-4cfd-a90d-13e657a4a3fb_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:50:52',41),(197,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"532c7f7d-6dbc-46bc-802c-9f7ab5592733_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:54:17',316),(198,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"7c119cbf-0c59-43e0-95f1-cbce5faec070_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:54:28',273),(199,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"65e587a7-28f0-4bbe-bc3e-49972583e4f6_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 10:54:33',330),(200,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"abfaf173-f6a2-4578-8abf-ccbed2b55f94_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:00:13',38),(201,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"15bd03b4-e369-494d-b6d1-f03a37c7b26e_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:09:59',162),(202,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"5a02e5d3-8c55-401f-b3c5-e2e2d974705b_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:11:52',293),(203,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"5aaf15c3-06b6-4f8b-99f6-fd0478c78958_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:20:53',29),(204,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"59e686ab-d4cc-4b67-a244-2d22bb02145c_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:21:08',31),(205,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:27:52',28),(206,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:31:45',10411),(207,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}','{\"msg\":\"fa89c017-bb31-4048-8bb8-fab5af01fa19_leave.xlsx\",\"code\":200}',0,NULL,'2024-06-21 11:37:52',391),(208,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:43:22',10676),(209,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:43:30',4926),(210,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:44:13',24521),(211,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:48:43',193268),(212,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:49:47',58132),(213,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 11:53:19',5801),(214,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 12:01:26',7605),(215,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 12:01:39',168),(216,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:36:03',48),(217,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:37:37',163),(218,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:42:11',157),(219,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:43:01',3008),(220,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:43:54',155),(221,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:46:17',3634),(222,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:46:26',29),(223,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:48:55',72978),(224,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:49:40',3355),(225,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:50:51',3028),(226,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:59:46',6258),(227,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:59:51',51),(228,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 13:59:54',31),(229,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:01:00',36),(230,'岗位管理',5,'com.ruoyi.web.controller.system.SysPostController.export()','POST',1,'wsj','研发部门','/system/post/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:01:09',33),(231,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:04:42',27),(232,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:04:46',29),(233,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:11:57',33),(234,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:12:14',21),(235,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:12:43',24),(236,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:13:19',26),(237,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:15:15',28),(238,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:15:39',18557),(239,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:17:16',3617),(240,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:22:05',7948),(241,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:25:14',33111),(242,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:25:36',39),(243,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:26:04',6427),(244,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:26:27',15169),(245,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:28:19',81345),(246,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:28:35',3091),(247,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:29:11',22),(248,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:32:15',31),(249,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:32:46',29),(250,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','GET',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:39:39',24),(251,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:40:34',32),(252,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:46:29',141),(253,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:46:33',145),(254,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:48:25',24),(255,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:49:26',20),(256,'学生',5,'com.ruoyi.system.controller.TestStudentController.export()','POST',1,'wsj','研发部门','/system/student/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:51:00',23),(257,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 14:56:02',605),(258,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:07:47',622),(259,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:14:41',43),(260,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:16:27',44),(261,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:17:20',29),(262,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:24:18',26),(263,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:24:35',29),(264,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:27:00',31),(265,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:30:29',2260),(266,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:30:29',154074),(267,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:30:35',26),(268,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:31:22',31),(269,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:32:00',21),(270,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:33:43',22),(271,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:35:45',23),(272,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"a\":\"123\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:36:35',26),(273,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"a\":\"123\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:36:39',27),(274,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:39:18',22),(275,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:41:10',25),(276,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"id\":\"admin\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:42:03',26),(277,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"id\":\"admin\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:42:54',9145),(278,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"id\":\"admin\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-21 15:43:06',21),(279,'流程定义管理',2,'com.ruoyi.activiti.controller.ProcessDefinitionController.suspendOrActiveApply()','POST',1,'admin','研发部门','/processDefinition/suspendOrActiveApply','127.0.0.1','内网IP','{\"id\":\"leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31\",\"params\":{},\"suspendState\":1,\"version\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 17:25:27',60),(280,'流程定义管理',2,'com.ruoyi.activiti.controller.ProcessDefinitionController.suspendOrActiveApply()','POST',1,'admin','研发部门','/processDefinition/suspendOrActiveApply','127.0.0.1','内网IP','{\"id\":\"leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31\",\"params\":{},\"suspendState\":2,\"version\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 17:25:34',8),(281,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"王少杰2\",\"params\":{},\"postIds\":[3],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"wsj2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 10:55:50',92),(282,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"王少杰3\",\"params\":{},\"postIds\":[2],\"roleIds\":[2],\"status\":\"0\",\"userId\":102,\"userName\":\"wsj3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 10:56:38',78),(283,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-24 11:00:23\",\"id\":\"208d3401-7e06-44b5-b2f9-6b5f511d33f7\",\"instanceId\":\"e6568765-31d5-11ef-8bc1-da80833f9b31\",\"leaveEndTime\":\"2024-06-20\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"state\":\"0\",\"title\":\"王少杰的年假申请\",\"type\":\"年假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 11:00:23',152),(284,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'wsj2','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:55:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2024-06-24 11:13:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王少杰2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[3,2],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"wsj2\",\"userId\":101,\"userName\":\"wsj2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 11:16:12',25),(285,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'wsj2','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:55:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2024-06-24 11:13:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王少杰2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[3],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"wsj2\",\"userId\":101,\"userName\":\"wsj2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 11:16:43',21),(286,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-24 11:18:40\",\"id\":\"f6ca2bd1-6c46-4c97-87ef-9c8026327afa\",\"instanceId\":\"744f848d-31d8-11ef-8bc1-da80833f9b31\",\"leaveEndTime\":\"2024-06-13\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"ce\",\"state\":\"0\",\"title\":\"王少杰的病假申请\",\"type\":\"病假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 11:18:40',29),(287,'请假',1,'com.ruoyi.leave.controller.WorkflowLeaveController.add()','POST',1,'wsj','研发部门','/workflow/leave','127.0.0.1','内网IP','{\"createBy\":\"wsj\",\"createName\":\"王少杰\",\"createTime\":\"2024-06-24 11:20:47\",\"id\":\"4b4d07d4-6681-42d0-9716-45b2b14a3937\",\"instanceId\":\"bfb805d5-31d8-11ef-8bc1-da80833f9b31\",\"leaveEndTime\":\"2024-06-05\",\"leaveStartTime\":\"2024-06-05\",\"params\":{},\"reason\":\"123\",\"state\":\"0\",\"title\":\"王少杰的年假申请\",\"type\":\"年假\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 11:20:47',30),(288,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:30:50',712),(289,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:31:45',44),(290,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'wsj','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:32:57',27608),(291,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:45:33',582),(292,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:45:45',47),(293,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:45:57',38),(294,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:46:34',32),(295,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:47:59',28),(296,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:49:06',27),(297,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:55:16',433),(298,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:56:02',49),(299,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 11:56:32',32),(300,'请假',5,'com.ruoyi.leave.controller.WorkflowLeaveController.export()','POST',1,'admin','研发部门','/workflow/leave/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 13:43:49',222782),(301,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 13:46:13',68),(302,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 13:49:33',143703),(303,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 13:51:00',83700),(304,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 14:04:04',453709),(305,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 14:14:01',8101),(306,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-06-24 14:19:39',71548),(307,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'wsj','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 16:20:37\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"wsj\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 14:22:25',12),(308,'流程定义管理',2,'com.ruoyi.activiti.controller.ProcessDefinitionController.suspendOrActiveApply()','POST',1,'wsj','研发部门','/processDefinition/suspendOrActiveApply','127.0.0.1','内网IP','{\"id\":\"leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31\",\"params\":{},\"suspendState\":1,\"version\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 14:24:14',13),(309,'流程定义管理',2,'com.ruoyi.activiti.controller.ProcessDefinitionController.suspendOrActiveApply()','POST',1,'wsj','研发部门','/processDefinition/suspendOrActiveApply','127.0.0.1','内网IP','{\"id\":\"leave:1:0b0bf4cf-2f1b-11ef-803b-da80833f9b31\",\"params\":{},\"suspendState\":2,\"version\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-24 14:24:17',7);
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
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-18 16:20:37','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-06-18 16:20:37','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-06-18 16:20:37','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-06-18 16:20:37','',NULL,'');
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
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-18 16:20:37','',NULL,'超级管理员'),(2,'普通角色','common',2,'1',1,0,'0','0','admin','2024-06-18 16:20:37','admin','2024-06-20 10:19:53','普通角色');
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
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2000),(2,2001),(2,2006),(2,2007),(2,2008),(2,2009),(2,2010),(2,2011),(2,2012),(2,2016),(2,2017),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023),(2,2024),(2,2025),(2,2026);
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-24 15:21:54','admin','2024-06-18 16:20:37','','2024-06-24 15:21:54','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-18 16:20:37','admin','2024-06-18 16:20:37','',NULL,'测试员'),(100,103,'wsj','王少杰','00','','','0','','$2a$10$9tuYtf7hP5CUBzjgdl9ljO4hOWtln6Tr.KKgtqbgpIFWqYZXNizcS','0','0','127.0.0.1','2024-06-24 14:22:48','admin','2024-06-19 16:12:53','','2024-06-24 14:22:48',NULL),(101,103,'wsj2','王少杰2','00','','','0','','$2a$10$4qMWpYkJ0Z8hfMp.f9ZIjuBsRrY3QeErPvzT3/0AQcu..M3oMIeBe','0','0','127.0.0.1','2024-06-24 11:26:25','admin','2024-06-24 10:55:50','wsj2','2024-06-24 11:26:25',NULL),(102,103,'wsj3','王少杰3','00','','','0','','$2a$10$07cJ1KF2PVS4bHNu.y2OBOiDgoM3QCKxJo7CoEJm57atGu0B4U1bK','0','0','127.0.0.1','2024-06-24 11:21:02','admin','2024-06-24 10:56:38','','2024-06-24 11:21:02',NULL);
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
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,4),(101,3),(102,2);
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
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2),(101,2),(102,2);
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

-- Dump completed on 2024-06-24 15:33:04
