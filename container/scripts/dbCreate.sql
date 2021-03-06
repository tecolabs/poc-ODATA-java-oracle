alter session set "_ORACLE_SCRIPT"=true;
create user eicas identified by eicaseicas;
GRANT ALL privileges TO eicas;


--------------------------------------------------------
-- Archivo creado  - viernes-febrero-14-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "EICAS"."BOOK"
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"TITLE" VARCHAR2(100 BYTE), 
	"COSTO" FLOAT(126), 
	"DESCRIPCION" VARCHAR2(200 BYTE)
   );
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "EICAS"."USUARIO" 
   (	"USERID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USERNAME" VARCHAR2(100 BYTE), 
	"MALE" NUMBER(*,0) DEFAULT NULL, 
	"BIRTHDATE" TIMESTAMP (6), 
	"LOCLON" FLOAT(126), 
	"LOCLAT" FLOAT(126), 
	"PASSWORD" VARCHAR2(50 BYTE)
   );
--------------------------------------------------------
--  DDL for Table USUARIO_BOOK
--------------------------------------------------------

  CREATE TABLE "EICAS"."USUARIO_BOOK" 
   (	"USER_USERID" NUMBER(*,0), 
	"LIBROSRECOMENDADOS_ID" NUMBER(*,0)
   );

Insert into EICAS.BOOK (ID,TITLE,COSTO,DESCRIPCION) values ('1','Dr Jekyll',150.8,' Excelente!!!');
Insert into EICAS.BOOK (ID,TITLE,COSTO,DESCRIPCION) values ('4','Peter Class',145.25,'POO');
Insert into EICAS.BOOK (ID,TITLE,COSTO,DESCRIPCION) values ('2','Harry Potter',145.25,'Super mistico');
Insert into EICAS.BOOK (ID,TITLE,COSTO,DESCRIPCION) values ('3','Moby Dick', 145.25,'Ballenistico');

Insert into EICAS.USUARIO (USERID,USERNAME,MALE,BIRTHDATE,LOCLON,LOCLAT,PASSWORD) values ('1','MadProgrammer','1',CURRENT_TIMESTAMP, 5.15899, 6.252654,'dasfasfdas_Asdasd:ger23');
Insert into EICAS.USUARIO (USERID,USERNAME,MALE,BIRTHDATE,LOCLON,LOCLAT,PASSWORD) values ('6','Franquitt','1', CURRENT_TIMESTAMP, 25.45678, 64.61987,'fsdagraesewagfsdaf_fgbrwthtityxgbv:fpk3892c');

Insert into EICAS.USUARIO_BOOK (USER_USERID,LIBROSRECOMENDADOS_ID) values ('1','3');
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EICAS"."BOOK_PK" ON "EICAS"."BOOK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EICAS"."USUARIO_PK" ON "EICAS"."USUARIO" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------
  ALTER TABLE "EICAS"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------


  ALTER TABLE "EICAS"."USUARIO" ADD CONSTRAINT "USUARIO_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO_BOOK
--------------------------------------------------------

CREATE VIEW "EICAS"."USUARIOS_FRAN_VIEW" AS
  SELECT USERID,
USERNAME,
MALE,
BIRTHDATE,
LOCLON,
LOCLAT,
PASSWORD
  FROM "EICAS"."USUARIO"
  WHERE LOCLON BETWEEN 25 AND 30;
