alter session set "_ORACLE_SCRIPT"=true;
create user eicas identified by eicaseicas;
grant all privileges to eicas;

CREATE TABLE "EICAS"."BOOK" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"COSTO" FLOAT(126) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(200 BYTE) NOT NULL ENABLE
   );