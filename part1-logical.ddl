-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-04-25 19:51:26 CDT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c




CREATE TABLE SP16_Dept
  (
    deptNo   INTEGER NOT NULL ,
    deptName VARCHAR2 (255) NOT NULL
  ) ;
ALTER TABLE SP16_Dept ADD CONSTRAINT SP16_Dept_PK PRIMARY KEY ( deptNo ) ;


CREATE TABLE SP16_Person
  (
    personID     INTEGER NOT NULL ,
    firstName    VARCHAR2 (255) NOT NULL ,
    lastName     VARCHAR2 (255) NOT NULL ,
    homeAddress  VARCHAR2 (255) ,
    zipCode      VARCHAR2 (255) ,
    homePhone    VARCHAR2 (255) ,
    type         VARCHAR2 (255) ,
    empID        INTEGER ,
    sal          INTEGER NOT NULL ,
    salException INTEGER ,
    isFired      NUMBER ,
    bonus        INTEGER ,
    usCitizen    NUMBER NOT NULL ,
    deptNo       INTEGER ,
    projNo       INTEGER ,
    personID1    INTEGER
  ) ;
CREATE UNIQUE INDEX SP16_Person__IDX ON SP16_Person
  (
    projNo ASC
  )
  ;
ALTER TABLE SP16_Person ADD CONSTRAINT SP16_Person_PK PRIMARY KEY ( personID ) ;


CREATE TABLE SP16_Proj
  (
    projNo     INTEGER NOT NULL ,
    projTitle  VARCHAR2 (255) NOT NULL ,
    type       VARCHAR2 (255) ,
    ProjActive NUMBER ,
    endDate    VARCHAR2 (255) ,
    estHours   INTEGER ,
    personID   INTEGER ,
    deptNo     INTEGER ,
    projNo1    INTEGER
  ) ;
CREATE UNIQUE INDEX SP16_Proj__IDX ON SP16_Proj
  (
    personID ASC
  )
  ;
ALTER TABLE SP16_Proj ADD CONSTRAINT SP16_Proj_PK PRIMARY KEY ( projNo ) ;


CREATE TABLE SP16_p2p
  (
    type      VARCHAR2 (255) ,
    personID1 INTEGER ,
    personID  INTEGER
  ) ;


CREATE TABLE project_members
  (
    SP16_Proj_projNo     INTEGER NOT NULL ,
    SP16_Person_personID INTEGER NOT NULL
  ) ;
ALTER TABLE project_members ADD CONSTRAINT project_members_PK PRIMARY KEY ( SP16_Proj_projNo, SP16_Person_personID ) ;


ALTER TABLE project_members ADD CONSTRAINT FK_ASS_76 FOREIGN KEY ( SP16_Proj_projNo ) REFERENCES SP16_Proj ( projNo ) ;

ALTER TABLE project_members ADD CONSTRAINT FK_ASS_77 FOREIGN KEY ( SP16_Person_personID ) REFERENCES SP16_Person ( personID ) ;

ALTER TABLE SP16_Person ADD CONSTRAINT SP16_Person_SP16_Dept_FK FOREIGN KEY ( deptNo ) REFERENCES SP16_Dept ( deptNo ) ;

ALTER TABLE SP16_Person ADD CONSTRAINT SP16_Person_SP16_Person_FK FOREIGN KEY ( personID1 ) REFERENCES SP16_Person ( personID ) ;

ALTER TABLE SP16_Person ADD CONSTRAINT SP16_Person_SP16_Proj_FK FOREIGN KEY ( projNo ) REFERENCES SP16_Proj ( projNo ) ;

ALTER TABLE SP16_Proj ADD CONSTRAINT SP16_Proj_SP16_Dept_FK FOREIGN KEY ( deptNo ) REFERENCES SP16_Dept ( deptNo ) ;

ALTER TABLE SP16_Proj ADD CONSTRAINT SP16_Proj_SP16_Person_FK FOREIGN KEY ( personID ) REFERENCES SP16_Person ( personID ) ;

ALTER TABLE SP16_Proj ADD CONSTRAINT SP16_Proj_SP16_Proj_FK FOREIGN KEY ( projNo1 ) REFERENCES SP16_Proj ( projNo ) ;

ALTER TABLE SP16_p2p ADD CONSTRAINT SP16_p2p_SP16_Person_FK FOREIGN KEY ( personID1 ) REFERENCES SP16_Person ( personID ) ;

ALTER TABLE SP16_p2p ADD CONSTRAINT SP16_p2p_SP16_Person_FKv1 FOREIGN KEY ( personID ) REFERENCES SP16_Person ( personID ) ;

-- Error - Foreign Key project_members has no columns

-- Error - Foreign Key project_membersv1 has no columns


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             2
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
