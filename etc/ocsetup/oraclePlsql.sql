
CREATE TABLE CMS_SYSTEMPROPERTIES
(	SYSTEMPROPERTY_ID int not null,
SYSTEMPROPERTY_NAME VARCHAR2(40) not null,
SYSTEMPROPERTY_VALUE blob,
PRIMARY KEY (SYSTEMPROPERTY_ID),
UNIQUE (SYSTEMPROPERTY_NAME) );

CREATE TABLE CMS_USERS
( USER_ID int not null,
USER_NAME VARCHAR2(32) not null,
USER_PASSWORD VARCHAR2(32) not null,
USER_RECOVERY_PASSWORD VARCHAR2(32) not null,
USER_DESCRIPTION VARCHAR2(255) not null,
USER_FIRSTNAME VARCHAR2(50) not null ,
USER_LASTNAME VARCHAR2(50) not null ,
USER_EMAIL VARCHAR2(50) not null ,
USER_LASTLOGIN DATE not null,
USER_LASTUSED DATE not null,
USER_FLAGS int not null,
USER_INFO blob,
USER_DEFAULT_GROUP_ID int not null,
USER_ADDRESS VARCHAR2(50) not null ,
USER_SECTION VARCHAR2(50) not null ,
USER_TYPE int not null,
primary key(USER_ID),
unique(USER_NAME) );

CREATE TABLE CMS_PROJECTS
( PROJECT_ID int not null,
USER_ID int not null,
GROUP_ID int not null,
MANAGERGROUP_ID int not null,
TASK_ID int not null,
PROJECT_NAME VARCHAR2(16) not null,
PROJECT_DESCRIPTION VARCHAR2(255) not null,
PROJECT_FLAGS int not null,
PROJECT_CREATEDATE date not null,
PROJECT_TYPE int not null,
primary key (PROJECT_ID),
unique(PROJECT_NAME,PROJECT_CREATEDATE) );

CREATE TABLE CMS_BACKUP_PROJECTS
(VERSION_ID int not null,
 PROJECT_ID int not null,
 PROJECT_NAME VARCHAR2(16) not null,
 PROJECT_PUBLISHDATE date,
 PROJECT_PUBLISHED_BY int not null,
 PROJECT_PUBLISHED_BY_NAME VARCHAR2(135),
 USER_ID int not null,
 USER_NAME VARCHAR2(135),
 GROUP_ID int not null,
 GROUP_NAME VARCHAR2(16),
 MANAGERGROUP_ID int not null,
 MANAGERGROUP_NAME VARCHAR2(16),
 PROJECT_DESCRIPTION VARCHAR2(255) not null,
 PROJECT_CREATEDATE date not null,
 PROJECT_TYPE int not null,
 TASK_ID int not null,
 primary key (VERSION_ID));
 
CREATE TABLE CMS_PROJECTRESOURCES
(PROJECT_ID NUMBER NOT NULL,
RESOURCE_NAME VARCHAR2(248) NOT NULL,
PRIMARY KEY (PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_PROJECTRESOURCES
(VERSION_ID int NOT NULL,
 PROJECT_ID int NOT NULL,
 RESOURCE_NAME VARCHAR2(248) NOT NULL,
 PRIMARY KEY (VERSION_ID, PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_PROPERTYDEF
( PROPERTYDEF_ID int not null,
PROPERTYDEF_NAME VARCHAR2(64) not null,
RESOURCE_TYPE int not null,
primary key(PROPERTYDEF_ID),
unique(PROPERTYDEF_NAME, RESOURCE_TYPE) );

CREATE TABLE CMS_ONLINE_PROPERTYDEF
( PROPERTYDEF_ID int not null,
PROPERTYDEF_NAME VARCHAR2(64) not null,
RESOURCE_TYPE int not null,
primary key(PROPERTYDEF_ID),
unique(PROPERTYDEF_NAME, RESOURCE_TYPE) );

CREATE TABLE CMS_BACKUP_PROPERTYDEF
( PROPERTYDEF_ID int not null,
PROPERTYDEF_NAME VARCHAR2(64) not null,
RESOURCE_TYPE int not null,
primary key(PROPERTYDEF_ID),
unique(PROPERTYDEF_NAME, RESOURCE_TYPE) );

CREATE TABLE CMS_PROPERTIES
( PROPERTY_ID int not null,
PROPERTYDEF_ID int not null,
RESOURCE_ID int not null,
PROPERTY_VALUE VARCHAR2(255) not null,
primary key(PROPERTY_ID),
unique(PROPERTYDEF_ID, RESOURCE_ID) );

CREATE TABLE CMS_ONLINE_PROPERTIES
( PROPERTY_ID int not null,
PROPERTYDEF_ID int not null,
RESOURCE_ID int not null,
PROPERTY_VALUE VARCHAR2(255) not null,
primary key(PROPERTY_ID),
unique(PROPERTYDEF_ID, RESOURCE_ID) );

CREATE TABLE CMS_BACKUP_PROPERTIES
( PROPERTY_ID int not null,
PROPERTYDEF_ID int not null,
RESOURCE_ID int not null,
PROPERTY_VALUE VARCHAR2(255) not null,
primary key(PROPERTY_ID),
unique(PROPERTYDEF_ID, RESOURCE_ID) );

CREATE TABLE CMS_RESOURCES
(RESOURCE_ID int not null,
 PARENT_ID int not null,
 RESOURCE_NAME VARCHAR2(248) not null,
 RESOURCE_TYPE int not null,
 RESOURCE_FLAGS int not null,
 USER_ID int not null,
 GROUP_ID int not null,
 PROJECT_ID int not null,
 FILE_ID int not null,
 ACCESS_FLAGS int not null,
 STATE int not null,
 LOCKED_BY int not null,
 LAUNCHER_TYPE int not null,
 LAUNCHER_CLASSNAME VARCHAR2(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE int not null,
 RESOURCE_LASTMODIFIED_BY int not null,
 primary key(RESOURCE_ID),
 unique(RESOURCE_NAME));

CREATE TABLE CMS_ONLINE_RESOURCES
(RESOURCE_ID int not null,
 PARENT_ID int not null,
 RESOURCE_NAME VARCHAR2(248) not null,
 RESOURCE_TYPE int not null,
 RESOURCE_FLAGS int not null,
 USER_ID int not null,
 GROUP_ID int not null,
 PROJECT_ID int not null,
 FILE_ID int not null,
 ACCESS_FLAGS int not null,
 STATE int not null,
 LOCKED_BY int not null,
 LAUNCHER_TYPE int not null,
 LAUNCHER_CLASSNAME VARCHAR2(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE int not null,
 RESOURCE_LASTMODIFIED_BY int not null,
 primary key(RESOURCE_ID),
 unique(RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_RESOURCES
(RESOURCE_ID int not null,
 PARENT_ID int not null,
 RESOURCE_NAME VARCHAR2(248) not null,
 RESOURCE_TYPE int not null,
 RESOURCE_FLAGS int not null,
 USER_ID int not null,
 USER_NAME VARCHAR2(135),
 GROUP_NAME VARCHAR2(16),
 GROUP_ID int not null,
 PROJECT_ID int not null,
 FILE_ID int not null,
 ACCESS_FLAGS int not null,
 STATE int not null,
 LAUNCHER_TYPE int not null,
 LAUNCHER_CLASSNAME VARCHAR2(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE int not null,
 RESOURCE_LASTMODIFIED_BY int not null,
 RESOURCE_LASTMODIFIED_BY_NAME VARCHAR2(135),
 VERSION_ID int not null,
 primary key(RESOURCE_ID),
 unique(VERSION_ID,RESOURCE_NAME,DATE_LASTMODIFIED) );

CREATE TABLE CMS_FILES
(FILE_ID int not null,
 FILE_CONTENT blob not null,
 primary key (FILE_ID));

CREATE TABLE CMS_ONLINE_FILES
(FILE_ID int not null,
 FILE_CONTENT blob not null,
 primary key (FILE_ID));

CREATE TABLE CMS_BACKUP_FILES
(FILE_ID int not null,
 FILE_CONTENT blob not null,
 primary key (FILE_ID));

CREATE TABLE CMS_GROUPS
(GROUP_ID int not null,
PARENT_GROUP_ID int not null,
GROUP_NAME VARCHAR2(16) not null,
GROUP_DESCRIPTION VARCHAR2(255) not null,
GROUP_FLAGS int not null,
primary key(GROUP_ID),
unique(GROUP_NAME));

CREATE TABLE CMS_SYSTEMID
(TABLE_KEY VARCHAR2(255) not null,
ID int not null,
primary key (TABLE_KEY));

CREATE TABLE CMS_GROUPUSERS
(GROUP_ID int not null,
USER_ID int not null,
GROUPUSER_FLAGS int not null );

CREATE TABLE CMS_Task
( autofinish int, 
endtime date, 
escalationtyperef int, 
id int NOT NULL, 
initiatoruserref int, 
milestoneref int, 
name varchar(254), 
originaluserref int, 
agentuserref int, 
parent int, 
percentage varchar(50), 
permission varchar(50), 
priorityref int DEFAULT '2', 
roleref int, 
root int, 
starttime date, 
state int, 
tasktyperef int, 
timeout date, 
wakeuptime date, 
htmllink varchar(254), 
estimatetime int DEFAULT '86400', 
PRIMARY KEY (id));

CREATE TABLE CMS_TaskType 
(autofinish int, 
escalationtyperef int, 
htmllink varchar(254), 
id int NOT NULL, 
name varchar(50), 
permission varchar(50), 
priorityref int, 
roleref int, 
PRIMARY KEY (id) );

CREATE TABLE CMS_TaskLog 
(coment long, 
externalusername varchar(254), 
id int NOT NULL, 
starttime date, 
taskref int, 
userref int, 
type int DEFAULT '0', 
PRIMARY KEY (id));

CREATE TABLE CMS_TaskPar 
(id int NOT NULL, 
parname varchar(50), 
parvalue varchar(50), 
ref int, 
PRIMARY KEY (id));

create table CMS_SESSIONS
(SESSION_ID varchar(255) not null,
SESSION_LASTUSED DATE not null,
SESSION_DATA blob not null,
primary key(SESSION_ID));

CREATE INDEX SESSIONS_LASTUSED ON
	CMS_SESSIONS(SESSION_LASTUSED);

CREATE INDEX GROUP_PARENTID ON
  CMS_GROUPS(PARENT_GROUP_ID);

CREATE INDEX GROUPUSER_GROUPID ON
  CMS_GROUPUSERS(GROUP_ID);

CREATE INDEX GROUPUSER_USERID ON
  CMS_GROUPUSERS(USER_ID);

CREATE INDEX PROJECTS_GROUPID ON
  CMS_PROJECTS(GROUP_ID);

CREATE INDEX PROJECTS_MANAGERID ON
  CMS_PROJECTS(MANAGERGROUP_ID);

CREATE INDEX PROJECTS_USERID ON
  CMS_PROJECTS(USER_ID);

CREATE INDEX PROJECT_NAME ON
  CMS_PROJECTS(PROJECT_NAME);

CREATE INDEX PROJECT_TASKID ON
  CMS_PROJECTS(TASK_ID);

CREATE INDEX PROJECTS_FLAGS ON
  CMS_PROJECTS (PROJECT_FLAGS);

CREATE INDEX RESOURCES_TYPE ON
  CMS_RESOURCES (RESOURCE_TYPE);

CREATE INDEX RESOURCES_STATE ON
  CMS_RESOURCES (STATE);

CREATE INDEX RESOURCES_PROJECT_TYPE ON
  CMS_RESOURCES (PROJECT_ID, RESOURCE_TYPE);

CREATE INDEX RESOURCES_RESOURCEID_PROJECT ON
  CMS_RESOURCES (RESOURCE_ID, PROJECT_ID);

CREATE INDEX RESOURCE_FILEID ON
  CMS_RESOURCES(FILE_ID);

CREATE INDEX RESOURCE_GROUP ON
  CMS_RESOURCES(GROUP_ID);

CREATE INDEX RESOURCE_LOCKED_BY ON
  CMS_RESOURCES(LOCKED_BY);

CREATE INDEX RESOURCE_PARENTID ON
  CMS_RESOURCES(PARENT_ID);

CREATE INDEX RESOURCE_PROJECTID ON
  CMS_RESOURCES(PROJECT_ID);

CREATE INDEX RESOURCE_USERID ON
  CMS_RESOURCES(USER_ID);

CREATE INDEX PARENT_RESOURCE_TYPE ON
  CMS_RESOURCES(PARENT_ID, RESOURCE_TYPE);

CREATE INDEX SYSTEMID ON
  CMS_SYSTEMID(TABLE_KEY, ID);

CREATE INDEX TASK_PARENT ON
  CMS_TASK(PARENT);

CREATE INDEX TASK_TYPETASKREF ON
  CMS_TASK(TASKTYPEREF);

CREATE INDEX TASKLOG_REF ON
  CMS_TASKLOG(TASKREF);

CREATE INDEX TASKLOG_USERREF ON
  CMS_TASKLOG(USERREF);

CREATE INDEX TASKPAR_REF ON
  CMS_TASKPAR(REF);

CREATE INDEX PROJECTRESOURCE_RESOURCE_NAME ON
  CMS_PROJECTRESOURCES(RESOURCE_NAME);

prompt 'package_usertypes';
@./oracleplsql/package_usertypes.sql;

prompt 'package_usererrors';
@./oracleplsql/package_usererrors.sql;

prompt 'package_body_usererrors';
@./oracleplsql/package_body_usererrors.sql;

prompt 'package_opencmsconstants';
@./oracleplsql/package_opencmsconstants;

prompt 'function_getnextid';
@./oracleplsql/function_getnextid.sql;

prompt 'package_opencmsgroup';
@./oracleplsql/package_opencmsgroup;

prompt 'package_opencmsaccess';
@./oracleplsql/package_opencmsaccess;

prompt 'package_opencmsproperty';
@./oracleplsql/package_opencmsproperty;

prompt 'package_opencmsresource';
@./oracleplsql/package_opencmsresource;

prompt 'package_opencmsproject';
@./oracleplsql/package_opencmsproject;

prompt 'package_body_opencmsgroup';
@./oracleplsql/package_body_opencmsgroup;

prompt 'package_body_opencmsaccess';
@./oracleplsql/package_body_opencmsaccess;

prompt 'package_body_opencmsproperty';
@./oracleplsql/package_body_opencmsproperty;

prompt 'package_body_opencmsresource';
@./oracleplsql/package_body_opencmsresource;

prompt 'package_body_opencmsproject';
@./oracleplsql/package_body_opencmsproject;

