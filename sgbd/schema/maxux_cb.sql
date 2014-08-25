--------------------------------------------------------
--  Fichier créé - jeudi-décembre-12-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for DB Link LINK_CC1
--------------------------------------------------------

  CREATE DATABASE LINK "LINK_CC1"
   CONNECT TO "MAXUX_CC1" IDENTIFIED BY VALUES '0504584A29CF553E18DDF18A9725D7EC54235CB29174500B94'
   USING 'orcl';
--------------------------------------------------------
--  DDL for Type ARTISTS_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MAXUX_CB"."ARTISTS_T" AS VARRAY(512) OF VARCHAR2(256);

/
--------------------------------------------------------
--  DDL for Type COMPANIES_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MAXUX_CB"."COMPANIES_T" AS VARRAY(512) OF VARCHAR2(256);

/
--------------------------------------------------------
--  DDL for Type GENRES_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MAXUX_CB"."GENRES_T" AS VARRAY(512) OF VARCHAR2(256);

/
--------------------------------------------------------
--  DDL for Type LANGS_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MAXUX_CB"."LANGS_T" AS VARRAY(512) OF VARCHAR2(256);

/
--------------------------------------------------------
--  DDL for Type LANG_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MAXUX_CB"."LANG_T" AS VARRAY(512) OF VARCHAR2(256);

/
--------------------------------------------------------
--  DDL for Sequence ARTISTS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CB"."ARTISTS_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6581 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COMPANIES_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CB"."COMPANIES_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 301 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GENRES_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CB"."GENRES_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 641 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence IMAGES_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CB"."IMAGES_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 461 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CB"."LOGS_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1001 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ARTISTS
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."ARTISTS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CERTIFICATION
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."CERTIFICATION" 
   (	"CODE" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMPANIES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."COMPANIES" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COPIES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."COPIES" 
   (	"NUM_COPY" NUMBER, 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."COUNTRIES" 
   (	"CODE" VARCHAR2(3 BYTE), 
	"NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GENRES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."GENRES" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IMAGES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."IMAGES" 
   (	"ID" NUMBER, 
	"IMAGE" BLOB, 
	"MOVIE" NUMBER, 
	"STABLE" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("IMAGE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LANGUAGES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."LANGUAGES" 
   (	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOGS
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."LOGS" 
   (	"ID" VARCHAR2(20 BYTE), 
	"DATE_LOG" DATE DEFAULT sysdate, 
	"ERRCODE" NUMBER, 
	"MESSAGE" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MOVIE_DIRECT
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."MOVIE_DIRECT" 
   (	"MOVIE" NUMBER, 
	"DIRECTOR" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MOVIE_GENRES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."MOVIE_GENRES" 
   (	"GENRE" NUMBER, 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MOVIE_PLAY
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."MOVIE_PLAY" 
   (	"MOVIE" NUMBER, 
	"ARTIST" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MOVIES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."MOVIES" 
   (	"ID" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"OVERVIEW" VARCHAR2(4000 BYTE), 
	"RATING" NUMBER, 
	"RELEASED_DATE" DATE, 
	"VOTE_AVERAGE" NUMBER, 
	"VOTE_COUNT" NUMBER, 
	"CERTIFICATION" VARCHAR2(10 BYTE), 
	"PRODUCTION_COUNTRY" VARCHAR2(3 BYTE), 
	"RUNTIME" NUMBER, 
	"NB_COPIES" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTION_COMPANIES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" 
   (	"COMPANY" NUMBER, 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPOKEN_LANG
--------------------------------------------------------

  CREATE TABLE "MAXUX_CB"."SPOKEN_LANG" 
   (	"LANGUAGES" VARCHAR2(20 BYTE), 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into MAXUX_CB.ARTISTS
SET DEFINE OFF;
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6412','Robbie Coltrane');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6413','Jeroen Krabb��');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6414','Vincent Cassel');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6415','Eddie Izzard');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6416','Bruce Willis');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6417','Cherry Jones');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6418','Albert Finney');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6419','Adriano Giannini');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6420','Frank Sinatra');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6421','Dean Martin');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6422','Peter Lawford');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6423','Angie Dickinson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6424','Richard Conte');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6425','Cesar Romero');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6426','Patrice Wymore');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6427','Joey Bishop');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6428','Sammy Davis Jr.');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6429','Lewis Milestone');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6430','Al Pacino');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6431','Ellen Barkin');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6432','Bob Einstein');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6433','C��line Dion');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6434','Gene Hackman');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6435','Jon Voight');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6436','Lisa Bonet');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6437','Gabriel Byrne');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6438','Will Smith');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6439','Regina King');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6440','Grant Heslov');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6441','Stuart Wilson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6442','Laura Cayouette');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6443','Loren Dean');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6444','Barry Pepper');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6445','Ian Hart');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6446','Jake Busey');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6447','Jason Lee');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6448','James LeGros');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6449','Tony Scott');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6395','George Clooney');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6450','Kobe Bryant');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6451','Kanye West');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6452','Danny Trejo');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6453','Robert Rodriguez');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6454','Henry Cavill');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6455','Caroline Goodall');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6456','Jim Piddock');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6457','Rafi Gavron');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6458','Joseph Mawle');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6459','Ver��nica Echegui');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6460','Emma Hamilton');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6461','Michael Budd');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6462','Sigourney Weaver');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6463','Mabrouk El Mechri');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6464','Emily Blunt');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6465','Joseph Gordon-Levitt');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6466','Piper Perabo');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6396','Brad Pitt');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6397','Matt Damon');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6398','Andy Garcia');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6399','Julia Roberts');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6400','Casey Affleck');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6401','Scott Caan');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6402','Carl Reiner');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6403','Don Cheadle');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6404','Bernie Mac');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6405','Elliott Gould');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6406','Eddie Jemison');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6407','Shaobo Qin');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6408','Scott L. Schwartz');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6409','Scott Beringer');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6410','Steven Soderbergh');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6411','Catherine Zeta-Jones');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6467','Jeff Daniels');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6468','Paul Dano');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6469','Tracie Thoms');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6470','Noah Segan');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6471','Pierce Gagnon');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6472','Qing Xu');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6473','Frank Brennan');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6474','Garret Dillahunt');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6475','Nick Gomez');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6476','Marcus Hester');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6477','Jon Eyez');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6478','Rian Johnson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6479','Josh Duhamel');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6480','Rosario Dawson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6481','Vincent D''Onofrio');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6482','50 Cent');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6483','Richard Schiff');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6484','Vinnie Jones');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6485','James Lesure');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6486','Quinton "Rampage" Jackson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6487','Arie Verveen');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6488','Bonnie Somerville');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6489','Nnamdi Asomugha');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6490','Kevin Dunn');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6491','Danny Epper');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6492','David Barrett');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6493','Malin ��kerman');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6494','Nikki Reed');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6495','Deborah Ann Woll');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6496','Forest Whitaker');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6497','Brad Dourif');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6498','Shea Whigham');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6499','Michael Rosenbaum');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6500','Reila Aphrodite');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6501','Edrick Browne');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6502','Aaron Harvey');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6503','Jai Courtney');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6504','Patrick Stewart');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6505','Sebastian Koch');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6506','Cole Hauser');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6507','Amaury Nolasco');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6508','Megalyn Echikunwoke');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6509','Aksel Hennie');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6510','Anne Vyalitsyna');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6511','Attila ��rpa');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6512','Pasha D. Lychnikoff');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6513','Yuliya Snigir');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6514','Zolee Ganxsta');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6515','Norbert N��v��nyi');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6516','Mary Elizabeth Winstead');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6517','John Moore');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6518','Channing Tatum');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6519','Dwayne Johnson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6520','Adrianne Palicki');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6521','Ray Stevenson');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6522','Ray Park');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6523','Joseph Mazzello');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6524','Arnold Vosloo');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6525','Walton Goggins');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6526','Byung-hun Lee');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6527','��lodie Yung');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6528','Jonathan Pryce');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6529','D.J. Cotrona');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6530','RZA');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6531','Jon M. Chu');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6532','Ryan Phillippe');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6533','James Remar');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6534','Randy Couture');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6535','Will Yun Lee');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6536','Shaun Toub');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6537','Susie Abromeit');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6538','Jay Karnes');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6539','Jordan Trovillion');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6540','Ambyr Childers');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6541','Omar J. Dorsey');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6542','Theo Kypri');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6543','Richard Goteri');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6544','Jenna Dewan');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6545','Mike Gunther');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6546','Sylvester Stallone');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6547','Arnold Schwarzenegger');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6548','Jean-Claude Van Damme');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6549','Chuck Norris');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6550','Scott Adkins');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6551','Jason Statham');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6552','Liam Hemsworth');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6553','Dolph Lundgren');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6554','Jet Li');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6555','Terry Crews');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6556','Charisma Carpenter');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6557','Nikolette Noel');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6558','Nan Yu');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6559','Amanda Ooms');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6560','George Zlatarev');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6561','Simon West');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6562','Jamie Foxx');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6563','Simon Crane');
Insert into MAXUX_CB.ARTISTS (ID,NAME) values ('6564','F. Gary Gray');
REM INSERTING into MAXUX_CB.CERTIFICATION
SET DEFINE OFF;
Insert into MAXUX_CB.CERTIFICATION (CODE,DESCRIPTION) values ('G','General Audiences');
Insert into MAXUX_CB.CERTIFICATION (CODE,DESCRIPTION) values ('PG','Parental Guidance Suggested');
Insert into MAXUX_CB.CERTIFICATION (CODE,DESCRIPTION) values ('PG-13','Parents Strongly Cautioned');
Insert into MAXUX_CB.CERTIFICATION (CODE,DESCRIPTION) values ('R','Restricted');
Insert into MAXUX_CB.CERTIFICATION (CODE,DESCRIPTION) values ('NC-17','No One 17 and Under Admitted');
REM INSERTING into MAXUX_CB.COMPANIES
SET DEFINE OFF;
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('270','Village Roadshow Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('271','Scott Free Productions');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('268','Warner Bros. Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('272','Nike');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('273','Film Rites');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('269','Warner Bros Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('274','Galavis Film');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('275','Picture Machine');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('276','Intrepid Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('277','Summit Entertainment');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('278','Endgame Entertainment');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('279','Sony Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('280','FilmDistrict');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('281','DMG Entertainment');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('282','TriStar Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('283','Benaroya Pictures');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('284','Gunny Entertainment');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('285','Millennium Films');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('286','Nu Image Films');
Insert into MAXUX_CB.COMPANIES (ID,NAME) values ('287','Lionsgate');
REM INSERTING into MAXUX_CB.COPIES
SET DEFINE OFF;
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('6','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('7','299');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('8','161');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('8','163');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('9','9798');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('11','57324');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('15','76163');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('17','298');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('19','75736');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('27','70586');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('28','70586');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('38','59967');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('42','77948');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('43','77948');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('44','77948');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('49','47964');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('50','47964');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('51','47964');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('59','37733');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('60','37733');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('61','37733');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('67','139567');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('68','139567');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('69','139567');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('70','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('71','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('72','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('73','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('74','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('75','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('76','72559');
Insert into MAXUX_CB.COPIES (NUM_COPY,MOVIE) values ('77','72559');
REM INSERTING into MAXUX_CB.COUNTRIES
SET DEFINE OFF;
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AL','ALBANIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DZ','ALGERIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AS','AMERICAN SAMOA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AD','ANDORRA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AO','ANGOLA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AI','ANGUILLA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AQ','ANTARCTICA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AG','ANTIGUA AND BARBUDA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AR','ARGENTINA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AM','ARMENIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AW','ARUBA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AU','AUSTRALIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AT','AUSTRIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AZ','AZERBAIJAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BS','BAHAMAS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BH','BAHRAIN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BD','BANGLADESH');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BB','BARBADOS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BY','BELARUS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BE','BELGIUM');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BZ','BELIZE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BJ','BENIN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BM','BERMUDA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BT','BHUTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BO','BOLIVIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BA','BOSNIA AND HERZEGOWINA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BW','BOTSWANA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BV','BOUVET ISLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BR','BRAZIL');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IO','BRITISH INDIAN OCEAN TERRITORY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BN','BRUNEI DARUSSALAM');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BG','BULGARIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BF','BURKINA FASO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('BI','BURUNDI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KH','CAMBODIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CM','CAMEROON');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CA','CANADA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CV','CAPE VERDE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KY','CAYMAN ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CF','CENTRAL AFRICAN REPUBLIC');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TD','CHAD');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CL','CHILE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CN','CHINA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CX','CHRISTMAS ISLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CC','COCOS (KEELING) ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CO','COLOMBIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KM','COMOROS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CD','CONGO, Democratic Republic of (was Zaire)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CG','CONGO, Republic of');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CK','COOK ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CR','COSTA RICA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CI','COTE D''IVOIRE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HR','CROATIA (local name: Hrvatska)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CU','CUBA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CY','CYPRUS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CZ','CZECH REPUBLIC');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DK','DENMARK');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DJ','DJIBOUTI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DM','DOMINICA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DO','DOMINICAN REPUBLIC');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('EC','ECUADOR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('EG','EGYPT');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SV','EL SALVADOR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GQ','EQUATORIAL GUINEA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ER','ERITREA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('EE','ESTONIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ET','ETHIOPIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FK','FALKLAND ISLANDS (MALVINAS)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FO','FAROE ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FJ','FIJI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FI','FINLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FR','FRANCE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GF','FRENCH GUIANA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PF','FRENCH POLYNESIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TF','FRENCH SOUTHERN TERRITORIES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GA','GABON');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GM','GAMBIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GE','GEORGIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('DE','GERMANY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GH','GHANA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GI','GIBRALTAR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GR','GREECE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GL','GREENLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GD','GRENADA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GP','GUADELOUPE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GU','GUAM');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GT','GUATEMALA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GN','GUINEA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GW','GUINEA-BISSAU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GY','GUYANA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HT','HAITI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HM','HEARD AND MC DONALD ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HN','HONDURAS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HK','HONG KONG');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('HU','HUNGARY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IS','ICELAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IN','INDIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ID','INDONESIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IR','IRAN (ISLAMIC REPUBLIC OF)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IQ','IRAQ');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IE','IRELAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IL','ISRAEL');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('IT','ITALY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('JM','JAMAICA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('JP','JAPAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('JO','JORDAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KZ','KAZAKHSTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KE','KENYA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KI','KIRIBATI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KP','KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KR','KOREA, REPUBLIC OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KW','KUWAIT');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KG','KYRGYZSTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LA','LAO PEOPLE''S DEMOCRATIC REPUBLIC');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LV','LATVIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LB','LEBANON');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LS','LESOTHO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LR','LIBERIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LY','LIBYAN ARAB JAMAHIRIYA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LI','LIECHTENSTEIN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LT','LITHUANIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LU','LUXEMBOURG');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MO','MACAU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MG','MADAGASCAR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MW','MALAWI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MY','MALAYSIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MV','MALDIVES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ML','MALI');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MT','MALTA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MH','MARSHALL ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MQ','MARTINIQUE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MR','MAURITANIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MU','MAURITIUS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('YT','MAYOTTE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MX','MEXICO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('FM','MICRONESIA, FEDERATED STATES OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MD','MOLDOVA, REPUBLIC OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MC','MONACO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MN','MONGOLIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MS','MONTSERRAT');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MA','MOROCCO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MZ','MOZAMBIQUE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MM','MYANMAR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NA','NAMIBIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NR','NAURU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NP','NEPAL');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NL','NETHERLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AN','NETHERLANDS ANTILLES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NC','NEW CALEDONIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NZ','NEW ZEALAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NI','NICARAGUA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NE','NIGER');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NG','NIGERIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NU','NIUE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NF','NORFOLK ISLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('MP','NORTHERN MARIANA ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('NO','NORWAY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('OM','OMAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PK','PAKISTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PW','PALAU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PS','PALESTINIAN TERRITORY, Occupied');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PA','PANAMA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PG','PAPUA NEW GUINEA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PY','PARAGUAY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PE','PERU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PH','PHILIPPINES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PN','PITCAIRN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PL','POLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PT','PORTUGAL');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PR','PUERTO RICO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('QA','QATAR');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('RE','REUNION');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('RO','ROMANIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('RU','RUSSIAN FEDERATION');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('RW','RWANDA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SH','SAINT HELENA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('KN','SAINT KITTS AND NEVIS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LC','SAINT LUCIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('PM','SAINT PIERRE AND MIQUELON');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VC','SAINT VINCENT AND THE GRENADINES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('WS','SAMOA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SM','SAN MARINO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ST','SAO TOME AND PRINCIPE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SA','SAUDI ARABIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SN','SENEGAL');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CS','SERBIA AND MONTENEGRO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SC','SEYCHELLES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SL','SIERRA LEONE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SG','SINGAPORE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SK','SLOVAKIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SI','SLOVENIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SB','SOLOMON ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SO','SOMALIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ZA','SOUTH AFRICA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ES','SPAIN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('LK','SRI LANKA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SD','SUDAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SR','SURINAME');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SJ','SVALBARD AND JAN MAYEN ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SZ','SWAZILAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SE','SWEDEN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('CH','SWITZERLAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('SY','SYRIAN ARAB REPUBLIC');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TW','TAIWAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TJ','TAJIKISTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TZ','TANZANIA, UNITED REPUBLIC OF');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TH','THAILAND');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TL','TIMOR-LESTE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TG','TOGO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TK','TOKELAU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TO','TONGA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TT','TRINIDAD AND TOBAGO');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TN','TUNISIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TR','TURKEY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TM','TURKMENISTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TC','TURKS AND CAICOS ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('TV','TUVALU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('UG','UGANDA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('UA','UKRAINE');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AE','UNITED ARAB EMIRATES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('GB','UNITED KINGDOM');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('US','UNITED STATES');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('UM','UNITED STATES MINOR OUTLYING ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('UY','URUGUAY');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('UZ','UZBEKISTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VU','VANUATU');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VA','VATICAN CITY STATE (HOLY SEE)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VE','VENEZUELA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VN','VIET NAM');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VG','VIRGIN ISLANDS (BRITISH)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('VI','VIRGIN ISLANDS (U.S.)');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('WF','WALLIS AND FUTUNA ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('EH','WESTERN SAHARA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('YE','YEMEN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ZM','ZAMBIA');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AX','AALAND ISLANDS');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('AF','AFGHANISTAN');
Insert into MAXUX_CB.COUNTRIES (CODE,NAME) values ('ZW','ZIMBABWE');
REM INSERTING into MAXUX_CB.GENRES
SET DEFINE OFF;
Insert into MAXUX_CB.GENRES (ID,NAME) values ('618','Drama');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('619','Suspense');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('620','Sports Film');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('621','Short');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('622','Science Fiction');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('613','Action');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('614','Comedy');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('615','Crime');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('616','Thriller');
Insert into MAXUX_CB.GENRES (ID,NAME) values ('617','Adventure');
REM INSERTING into MAXUX_CB.IMAGES
SET DEFINE OFF;
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('448','161','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('454','75736','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('456','70586','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('453','77948','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('451','59967','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('449','298','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('457','72559','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('446','163','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('450','9798','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('458','37733','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('452','57324','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('447','299','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('455','47964','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('459','139567','Y');
Insert into MAXUX_CB.IMAGES (ID,MOVIE,STABLE) values ('460','76163','Y');
REM INSERTING into MAXUX_CB.LANGUAGES
SET DEFINE OFF;
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('CN','Unknown');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AA','Afar');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AB','Abkhazian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AF','Afrikaans');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AM','Amharic');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AR','Arabic');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AS','Assamese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AY','Aymara');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('AZ','Azerbaijani');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BA','Bashkir');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BE','Byelorussian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BG','Bulgarian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BH','Bihari');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BI','Bislama');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BN','Bengali');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BO','Tibetan');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('BR','Breton');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('CA','Catalan');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('CO','Corsican');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('CS','Czech');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('CY','Welsh');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('DA','Danish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('DE','German');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('DZ','Bhutani');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('EL','Greek');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('EN','English');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('EO','Esperanto');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ES','Spanish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ET','Estonian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('EU','Basque');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FA','Persian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FI','Finnish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FJ','Fiji');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FO','Faeroese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FR','French');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('FY','Frisian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('GA','Irish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('GD','Gaelic');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('GL','Galician');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('GN','Guarani');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('GU','Gujarati');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('HA','Hausa');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('HI','Hindi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('HR','Croatian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('HU','Hungarian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('HY','Armenian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IA','Interlingua');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IE','Interlingue');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IK','Inupiak');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IN','Indonesian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IS','Icelandic');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IT','Italian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('IW','Hebrew');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('JA','Japanese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('JI','Yiddish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('JW','Javanese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KA','Georgian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KK','Kazakh');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KL','Greenlandic');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KM','Cambodian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KN','Kannada');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KO','Korean');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KS','Kashmiri');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KU','Kurdish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('KY','Kirghiz');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('LA','Latin');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('LN','Lingala');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('LO','Laothian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('LT','Lithuanian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('LV','Latvian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MG','Malagasy');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MI','Maori');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MK','Macedonian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ML','Malayalam');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MN','Mongolian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MO','Moldavian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MR','Marathi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MS','Malay');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MT','Maltese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('MY','Burmese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('NA','Nauru');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('NE','Nepali');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('NL','Dutch');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('NO','Norwegian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('OC','Occitan');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('OM','Oromo');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('OR','Oriya');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('PA','Punjabi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('PL','Polish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('PS','Pashto');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('PT','Portuguese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('QU','Quechua');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('RM','Rhaeto-Romance');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('RN','Kirundi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('RO','Romanian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('RU','Russian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('RW','Kinyarwanda');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SA','Sanskrit');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SD','Sindhi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SG','Sangro');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SH','Serbo-Croatian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SI','Singhalese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SK','Slovak');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SL','Slovenian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SM','Samoan');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SN','Shona');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SO','Somali');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SQ','Albanian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SR','Serbian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SS','Siswati');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ST','Sesotho');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SU','Sudanese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SV','Swedish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('SW','Swahili');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TA','Tamil');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TE','Tegulu');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TG','Tajik');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TH','Thai');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TI','Tigrinya');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TK','Turkmen');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TL','Tagalog');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TN','Setswana');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TO','Tonga');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TR','Turkish');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TS','Tsonga');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TT','Tatar');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('TW','Twi');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('UK','Ukrainian');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('UR','Urdu');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('UZ','Uzbek');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('VI','Vietnamese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('VO','Volapuk');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('WO','Wolof');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('XH','Xhosa');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('YO','Yoruba');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ZH','Chinese');
Insert into MAXUX_CB.LANGUAGES (CODE,NAME) values ('ZU','Zulu');
REM INSERTING into MAXUX_CB.LOGS
SET DEFINE OFF;
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('746',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 163, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('747',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('748',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 299, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('749',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4.5) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('750',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 298, 4.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('751',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('752',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 9798, 4.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('743',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('755',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('756',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('757',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('744',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('745',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('758',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('759',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('760',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('761',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('762',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('763',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('764',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('765',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('766',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('767',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 72559, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('768',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('769',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('770',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('771',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('772',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('773',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('774',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('775',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 299, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('776',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('777',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 298, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('778',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('779',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 9798, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('780',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('781',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('782',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('783',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('784',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('785',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('786',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('787',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 163, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('788',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('789',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('790',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('791',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('792',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('793',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('794',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('795',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 72559, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('796',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('797',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('798',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('799',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('800',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('801',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('802',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('803',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('804',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 298, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('805',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('806',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 9798, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('807',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('808',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('809',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('810',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('811',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('812',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('813',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('814',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 163, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('815',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('816',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('817',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('818',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('819',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('820',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('821',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('822',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('823',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 72559, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('824',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('825',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('826',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('827',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('828',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('829',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('830',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 299, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('831',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('832',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('833',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('834',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('835',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('836',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('837',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('838',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('839',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('840',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 163, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('841',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('842',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('843',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('844',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('845',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('846',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('847',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('848',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('849',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('850',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 72559, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('851',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('852',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 5) = 5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('853',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('854',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('855',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('856',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('857',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 299, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('858',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('859',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('860',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 9798, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('861',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('862',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('863',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('864',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('865',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('866',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('867',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('868',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('869',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('870',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('871',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('872',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('873',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('874',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('875',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('876',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 4.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('877',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('878',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('879',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('880',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('881',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 299, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('882',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('883',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('884',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 9798, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('885',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('886',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 161, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('887',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('888',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 57324, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('889',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('890',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('891',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 5) = 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('892',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('893',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('894',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('895',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('896',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('897',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('898',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('899',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('900',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('901',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('902',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('903',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('904',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('905',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('906',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('907',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('908',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('909',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('910',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('911',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('912',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('913',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('914',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('915',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('916',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('917',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('918',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('919',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('920',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('921',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('922',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('923',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('924',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 298, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('925',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('926',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('927',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('928',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('929',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('930',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('932',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('933',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 75736, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('934',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4.5) = 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('935',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 4.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('936',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('937',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('938',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('939',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('940',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 76163, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('941',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('942',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('943',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('944',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('931',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('945',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('946',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('947',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('948',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('949',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('950',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('951',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('952',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('953',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('954',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('955',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('956',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('957',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('958',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 5.5) = 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('959',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 5.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('960',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('961',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('962',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('963',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('964',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('965',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('966',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 3');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('967',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('968',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('969',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 59967, 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('970',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4) = 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('971',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 4');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('972',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('973',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('974',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('975',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('976',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('977',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('978',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('979',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 3.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('980',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('981',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('982',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('983',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('984',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('985',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('986',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 77948, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('987',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('988',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('989',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('990',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 139567, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('991',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('992',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('993',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 47964, 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('994',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 4.5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('995',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 1.5) = 1');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('996',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 70586, 1.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('997',to_date('11/12/13','DD/MM/RR'),'0','Random (0, .5) = 0');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('998',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 2.5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('999',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 37733, 2.5');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('753',to_date('11/12/13','DD/MM/RR'),'0','Random (0, 3,5) = 2');
Insert into MAXUX_CB.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('754',to_date('11/12/13','DD/MM/RR'),'0','Trigger for 298, 3,5');
REM INSERTING into MAXUX_CB.MOVIE_DIRECT
SET DEFINE OFF;
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('161','6410');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('163','6410');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('298','6410');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('299','6429');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('9798','6449');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('37733','6563');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('37733','6564');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('47964','6517');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('57324','6453');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('59967','6478');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('70586','6545');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('72559','6531');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('75736','6502');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('76163','6561');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('77948','6463');
Insert into MAXUX_CB.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('139567','6492');
REM INSERTING into MAXUX_CB.MOVIE_GENRES
SET DEFINE OFF;
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','161');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','298');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','299');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','9798');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','37733');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','47964');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','57324');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','59967');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','70586');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','72559');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','75736');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','76163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','77948');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('613','139567');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('614','161');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('614','163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('614','298');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('614','299');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('614','75736');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','161');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','298');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','299');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','37733');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','70586');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('615','139567');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','161');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','9798');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','37733');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','47964');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','59967');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','70586');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','72559');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','75736');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','76163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','77948');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('616','139567');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('617','299');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('617','72559');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('617','76163');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('618','9798');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('618','37733');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('618','70586');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('618','75736');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('618','139567');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('619','9798');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('620','57324');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('621','57324');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('622','59967');
Insert into MAXUX_CB.MOVIE_GENRES (GENRE,MOVIE) values ('622','72559');
REM INSERTING into MAXUX_CB.MOVIE_PLAY
SET DEFINE OFF;
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6396');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6411');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6399');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6398');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6400');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6401');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6407');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6404');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6403');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6397');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6402');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6406');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6405');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6412');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6413');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6414');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6415');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6417');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6418');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6419');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6420');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6421');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6422');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6423');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6424');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6425');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6426');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6427');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6428');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6395');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6397');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6430');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6404');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6398');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6400');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6401');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6402');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6403');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6407');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6406');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6405');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6431');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6415');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6414');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6432');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6433');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6396');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6434');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6435');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6436');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6437');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6438');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6439');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6440');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6441');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6442');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6443');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6444');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6445');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6446');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6401');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6447');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6448');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6450');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6451');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6452');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6453');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6454');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6455');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6456');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6457');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6458');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6459');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6460');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6461');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6462');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6464');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6395');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6396');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6397');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6398');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6399');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6400');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6401');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6402');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6403');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6404');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6405');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6406');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6407');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6408');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6409');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6395');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6465');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6466');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6467');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6468');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6469');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6470');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6471');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6472');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6473');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6474');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6475');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6476');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6477');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6479');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6480');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6481');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6482');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6483');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6484');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6485');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6486');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6487');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6488');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6489');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6490');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6491');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6493');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6494');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6495');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6496');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6497');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6498');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6499');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6500');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6501');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6503');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6504');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6505');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6506');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6507');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6508');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6509');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6510');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6511');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6512');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6513');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6514');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6515');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6516');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6518');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6519');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6520');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6521');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6522');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6523');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6524');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6525');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6526');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6527');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6528');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6529');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6530');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6532');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6533');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6482');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6534');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6535');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6536');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6537');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6538');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6539');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6540');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6541');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6542');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6543');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6544');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6546');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6547');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6548');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6549');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6550');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6551');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6552');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6553');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6554');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6534');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6555');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6556');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6557');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6558');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6559');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6560');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('37733','6416');
Insert into MAXUX_CB.MOVIE_PLAY (MOVIE,ARTIST) values ('37733','6562');
REM INSERTING into MAXUX_CB.MOVIES
SET DEFINE OFF;
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('299','Ocean''s Eleven','Ocean''s Eleven is the ''Rat-Pack'' comedy about robber Danny Ocean and his gang''s attempt to rob the five biggest casinos in Las Vegas.',null,to_date('10/08/60','DD/MM/RR'),'6,8','4','PG-13','US','127','78');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('298','Ocean''s Thirteen','Danny Ocean''s team of criminals are back and are composing a plan more personal than ever. When ruthless casino owner Willy Bank double-crosses Reuben Tishkoff, causing a heart attack, Danny Ocean vows that him and his team will do anything to bring Willy Bank and everything he''s got down. Even if it includes hiring help from one of their own enemies, Terry Benedict.',null,to_date('08/06/07','DD/MM/RR'),'7,9','31','PG-13','US','122','89');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('9798','Enemy of the State','Hotshot Washington lawyer Robert Dean becomes a victim of high-tech identity theft when a hacker slips an incriminating video into his pocket. Soon, a rogue National Security agent sets out to recover the tape -- and destroy Dean.',null,to_date('16/11/98','DD/MM/RR'),'8,3','20','R','US','132','80');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('161','Ocean''s Eleven','Less than 24 hours into his parole, charismatic thief Danny Ocean is already rolling out his next plan: In one night, Danny''s hand-picked crew of specialists will attempt to steal more than $150 million from three Las Vegas casinos. But to score the cash, Danny risks his chances of reconciling with ex-wife, Tess.',null,to_date('07/12/01','DD/MM/RR'),'8,5','47','PG-13','US','116','79');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('57324','The Black Mamba','Nike-sponsored short film directed by Robert Rodriguez.',null,to_date('31/01/11','DD/MM/RR'),'9','1','PG','US','6','79');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('77948','The Cold Light of Day','A young American (Cavill) uncovers a conspiracy during his attempt to save his family, who were kidnapped while on vacation in Spain.',null,to_date('07/09/12','DD/MM/RR'),'7,8','4','PG-13','US','93','77');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('163','Ocean''s Twelve','Danny Ocean reunites with his old flame and the rest of his merry band of thieves in a caper concerning three huge heists in Rome, Paris and Amsterdam. But Europol agent Isabel Lahiri is hot on their heels.',null,to_date('10/12/04','DD/MM/RR'),'7,7','34','PG-13','AU','125','79');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('59967','Looper','In the futuristic action thriller Looper, time travel will be invented - but it will be illegal and only available on the black market.  When the mob wants to get rid of someone, they will send their target 30 years into the past, where a "looper" - a hired gun, like Joe (Joseph Gordon-Levitt) - is waiting to mop up.  Joe is getting rich and life is good... until the day the mob decides to "close the loop," sending back Joe''s future self (Bruce Willis) for assassination.',null,to_date('28/09/12','DD/MM/RR'),'8,3','10','R','US','118','78');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('139567','Fire with Fire','A fireman takes an unexpected course of action when a man whom he''s been ordered to testify against, after being held up at a local convenience store, threatens him.',null,to_date('06/11/12','DD/MM/RR'),'0','0','R','US','97','77');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('75736','Catch .44','The lives of three female assassins take a sudden turn when their charming boss lures them into one last job. They soon find themselves thrust into a bizarre situation involving a psychotic hit man, a grizzled trucker and a delusional line cook.',null,to_date('09/12/11','DD/MM/RR'),'6,9','8','R','US','93','76');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('47964','A Good Day to Die Hard','John McClane finds himself in Moscow and gets caught up in a terrorist plot with his estranged son.',null,to_date('14/02/13','DD/MM/RR'),'0','0',null,'US','0','76');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('72559','G.I. Joe: Retaliation','The G.I. Joe team faces off against Zartan, his accomplices, and the world leaders he has under his influence.',null,to_date('29/03/13','DD/MM/RR'),'0','0','PG-13','US','120','77');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('70586','Setup','A group of friends plan out a detailed heist that turns deadly when one betrays the other by taking off with the goods. Taking matters into his own hands, Sonny seeks out his revenge teaming up with the most dangerous mob boss in town to get back what is rightfully his. When he finally comes face to face with his longtime friend he will be forced to make a life changing choice.',null,to_date('04/11/11','DD/MM/RR'),'6,1','13','R','US','85','77');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('76163','The Expendables 2','Mr. Church reunites the Expendables for what should be an easy paycheck, but when one of their men is murdered on the job, their quest for revenge puts them deep in enemy territory and up against an unexpected threat.',null,to_date('17/08/12','DD/MM/RR'),'8,3','17','R','US','103','76');
Insert into MAXUX_CB.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('37733','Kane & Lynch','A pair of Death Row inmates, a mercenary named Kane and a schizophrenic named Lynch, escape during a prison transport and team up to retrieve a stolen fortune. Based on a video game.',null,to_date('31/12/13','DD/MM/RR'),'0','0',null,'US','0','76');
REM INSERTING into MAXUX_CB.PRODUCTION_COMPANIES
SET DEFINE OFF;
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','161');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','163');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','298');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('269','299');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('270','298');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('271','9798');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('272','57324');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('273','77948');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('274','77948');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('275','77948');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('276','77948');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('277','77948');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('278','59967');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('279','59967');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('280','59967');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('281','59967');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('282','59967');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('283','75736');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('284','70586');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('285','76163');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('286','76163');
Insert into MAXUX_CB.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('287','37733');
REM INSERTING into MAXUX_CB.SPOKEN_LANG
SET DEFINE OFF;
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('CN','161');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('CS','9798');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','161');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','163');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','298');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','299');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','9798');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','37733');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','47964');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','57324');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','59967');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','70586');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','72559');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','75736');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','76163');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','77948');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','139567');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','163');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','70586');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','77948');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('IT','161');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('IT','163');
Insert into MAXUX_CB.SPOKEN_LANG (LANGUAGES,MOVIE) values ('NL','163');
--------------------------------------------------------
--  DDL for Index ARTISTS_NAME
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."ARTISTS_NAME" ON "MAXUX_CB"."ARTISTS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ARTISTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."ARTISTS_PK" ON "MAXUX_CB"."ARTISTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CERTIFICATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."CERTIFICATION_PK" ON "MAXUX_CB"."CERTIFICATION" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMPANIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."COMPANIES_PK" ON "MAXUX_CB"."COMPANIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COPIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."COPIES_PK" ON "MAXUX_CB"."COPIES" ("NUM_COPY", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."COUNTRIES_PK" ON "MAXUX_CB"."COUNTRIES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRIES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."COUNTRIES_UK1" ON "MAXUX_CB"."COUNTRIES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENRES_GENRE
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."GENRES_GENRE" ON "MAXUX_CB"."GENRES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENRES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."GENRES_PK" ON "MAXUX_CB"."GENRES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IMAGES_INDEX1
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."IMAGES_INDEX1" ON "MAXUX_CB"."IMAGES" ("MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IMAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."IMAGES_PK" ON "MAXUX_CB"."IMAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LANGUAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."LANGUAGES_PK" ON "MAXUX_CB"."LANGUAGES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LANGUAGES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."LANGUAGES_UK1" ON "MAXUX_CB"."LANGUAGES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."LOGS_PK" ON "MAXUX_CB"."LOGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_DIRECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."MOVIE_DIRECT_PK" ON "MAXUX_CB"."MOVIE_DIRECT" ("MOVIE", "DIRECTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_GENRES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."MOVIE_GENRES_PK" ON "MAXUX_CB"."MOVIE_GENRES" ("GENRE", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_PLAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."MOVIE_PLAY_PK" ON "MAXUX_CB"."MOVIE_PLAY" ("MOVIE", "ARTIST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_COUNTRY
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."MOVIES_COUNTRY" ON "MAXUX_CB"."MOVIES" ("PRODUCTION_COUNTRY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_NB_COPIES
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."MOVIES_NB_COPIES" ON "MAXUX_CB"."MOVIES" ("NB_COPIES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."MOVIES_PK" ON "MAXUX_CB"."MOVIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_TITLE
--------------------------------------------------------

  CREATE INDEX "MAXUX_CB"."MOVIES_TITLE" ON "MAXUX_CB"."MOVIES" ("TITLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTION_COMPANIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."PRODUCTION_COMPANIES_PK" ON "MAXUX_CB"."PRODUCTION_COMPANIES" ("COMPANY", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPOKEN_LANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CB"."SPOKEN_LANG_PK" ON "MAXUX_CB"."SPOKEN_LANG" ("LANGUAGES", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARTISTS
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."ARTISTS" ADD CONSTRAINT "ARTISTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."ARTISTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CERTIFICATION
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."CERTIFICATION" ADD CONSTRAINT "CERTIFICATION_CODE" CHECK (CODE IN ('G', 'PG', 'PG-13', 'R', 'NC-17')) ENABLE;
  ALTER TABLE "MAXUX_CB"."CERTIFICATION" ADD CONSTRAINT "CERTIFICATION_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."CERTIFICATION" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."COMPANIES" ADD CONSTRAINT "COMPANIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."COMPANIES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COPIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."COPIES" ADD CONSTRAINT "COPIES_PK" PRIMARY KEY ("NUM_COPY", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."COPIES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."COPIES" MODIFY ("NUM_COPY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_UK1" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."COUNTRIES" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."GENRES" ADD CONSTRAINT "GENRES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."GENRES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IMAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."IMAGES" ADD CONSTRAINT "IMAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."IMAGES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LANGUAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."LANGUAGES" ADD CONSTRAINT "LANGUAGES_UK1" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."LANGUAGES" ADD CONSTRAINT "LANGUAGES_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."LANGUAGES" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGS
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."LOGS" ADD CONSTRAINT "LOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."LOGS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_DIRECT
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_PK" PRIMARY KEY ("MOVIE", "DIRECTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_DIRECT" MODIFY ("DIRECTOR" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIE_DIRECT" MODIFY ("MOVIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_PK" PRIMARY KEY ("GENRE", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_GENRES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIE_GENRES" MODIFY ("GENRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_PLAY
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_PK" PRIMARY KEY ("MOVIE", "ARTIST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_PLAY" MODIFY ("ARTIST" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIE_PLAY" MODIFY ("MOVIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIES" ADD CONSTRAINT "MOVIES_VOTE_AVG_CHECK" CHECK (VOTE_AVERAGE <= 10 AND VOTE_AVERAGE >= 0) ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIES" MODIFY ("NB_COPIES" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIES" ADD CONSTRAINT "MOVIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIES" MODIFY ("VOTE_COUNT" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIES" MODIFY ("VOTE_AVERAGE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIES" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."MOVIES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTION_COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_PK" PRIMARY KEY ("COMPANY", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" MODIFY ("COMPANY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPOKEN_LANG
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_PK" PRIMARY KEY ("LANGUAGES", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CB"."SPOKEN_LANG" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CB"."SPOKEN_LANG" MODIFY ("LANGUAGES" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COPIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."COPIES" ADD CONSTRAINT "COPIES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IMAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."IMAGES" ADD CONSTRAINT "IMAGES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_DIRECT
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_ARTISTS_FK1" FOREIGN KEY ("DIRECTOR")
	  REFERENCES "MAXUX_CB"."ARTISTS" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_GENRES_FK1" FOREIGN KEY ("GENRE")
	  REFERENCES "MAXUX_CB"."GENRES" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_PLAY
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_ARTISTS_FK1" FOREIGN KEY ("ARTIST")
	  REFERENCES "MAXUX_CB"."ARTISTS" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."MOVIES" ADD CONSTRAINT "MOVIES_CERTIFICATION_FK1" FOREIGN KEY ("CERTIFICATION")
	  REFERENCES "MAXUX_CB"."CERTIFICATION" ("CODE") ENABLE;
  ALTER TABLE "MAXUX_CB"."MOVIES" ADD CONSTRAINT "MOVIES_COUNTRIES_FK1" FOREIGN KEY ("PRODUCTION_COUNTRY")
	  REFERENCES "MAXUX_CB"."COUNTRIES" ("CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTION_COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_COMP_FK1" FOREIGN KEY ("COMPANY")
	  REFERENCES "MAXUX_CB"."COMPANIES" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CB"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_MOVI_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPOKEN_LANG
--------------------------------------------------------

  ALTER TABLE "MAXUX_CB"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_LANGUAGES_FK1" FOREIGN KEY ("LANGUAGES")
	  REFERENCES "MAXUX_CB"."LANGUAGES" ("CODE") ENABLE;
  ALTER TABLE "MAXUX_CB"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CB"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger ARTISTS_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."ARTISTS_AUTO_ID" BEFORE INSERT ON ARTISTS
FOR EACH ROW
BEGIN
  SELECT ARTISTS_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CB"."ARTISTS_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMPANIES_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."COMPANIES_AUTO_ID" BEFORE INSERT ON COMPANIES
FOR EACH ROW
BEGIN
  SELECT COMPANIES_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CB"."COMPANIES_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GENRES_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."GENRES_AUTO_ID" BEFORE INSERT ON GENRES
FOR EACH ROW
BEGIN
  SELECT GENRES_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CB"."GENRES_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger IMAGES_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."IMAGES_AUTO_ID" BEFORE INSERT ON IMAGES
FOR EACH ROW
BEGIN
  SELECT IMAGES_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CB"."IMAGES_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGS_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."LOGS_AUTO_ID" BEFORE INSERT ON LOGS
FOR EACH ROW
BEGIN
  SELECT LOGS_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CB"."LOGS_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MOVIE_COPIES_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."MOVIE_COPIES_UPDATED" 
AFTER UPDATE OF NB_COPIES ON MOVIES 
FOR EACH ROW
DECLARE
  copies NUMBER;
  fcopies NUMBER;
  v_id NUMBER;
  cid NUMBER;
  l_seed VARCHAR2(100);
  l_row movies%rowtype;
BEGIN
  -- Randomize
  l_seed := TO_CHAR(SYSTIMESTAMP,'YYYYDDMMHH24MISSFFFF');
  DBMS_RANDOM.seed(val => l_seed);
  
  -- Grabbing the count of copies availide
  SELECT COUNT(*) / 2 INTO copies FROM copies WHERE movie = :new.id;
  fcopies := ROUND(DBMS_RANDOM.value(0, copies));
  
  INSERT INTO logs (errcode, message) VALUES (0, 'Random (0, ' || copies || ') = ' || fcopies);
  
  IF fcopies > 0 THEN
    -- Copying the whole shit into a temporary variable
    l_row.id       := :new.id;
    l_row.title    := :new.title;
    l_row.overview := :new.overview;
    l_row.rating   := :new.rating;
    l_row.released_date := :new.released_date;
    l_row.vote_average  := :new.vote_average;
    l_row.vote_count    := :new.vote_count;
    l_row.certification := :new.certification;
    l_row.production_country := :new.production_country;
    l_row.runtime   := :new.runtime;
    l_row.nb_copies := 0;
    
    -- SGBDCB.UpdateCC(l_row, fcopies);
    -- Logging
    INSERT INTO logs (errcode, message) VALUES (0, 'Trigger for ' || l_row.id || ', ' || copies);
    
    -- Checking if the movie already exists on CC
    v_id := SGBDCB.CheckExists('movies@link_cc1', 'id', l_row.id);
    IF v_id = 0 THEN
      -- Copying the whole shit
      INSERT INTO movies@link_cc1 VALUES l_row;
      
      -- Directors
      INSERT INTO artists@link_cc1
        SELECT a.* FROM artists a, movie_direct m
        WHERE m.director = a.id
          AND m.movie = l_row.id
          AND a.id NOT IN (SELECT id FROM artists@link_cc1);
      
      INSERT INTO movie_direct@link_cc1
        SELECT * FROM movie_direct WHERE movie = l_row.id;
      
      -- Actors
      INSERT INTO artists@link_cc1
        SELECT a.* FROM artists a, movie_play m
        WHERE m.artist = a.id
          AND m.movie = l_row.id
          AND a.id NOT IN (SELECT id FROM artists@link_cc1);
      
      INSERT INTO movie_play@link_cc1
        SELECT * FROM movie_play WHERE movie = l_row.id;
      
      -- Genres
      INSERT INTO genres@link_cc1
        SELECT g.* FROM genres g, movie_genres m
        WHERE m.genre = g.id
          AND m.movie = l_row.id
          AND g.id NOT IN (SELECT id FROM genres@link_cc1);
    
       INSERT INTO movie_genres@link_cc1
        SELECT * FROM movie_genres WHERE movie = l_row.id;
        
      -- Companies
      INSERT INTO companies@link_cc1
        SELECT c.* FROM companies c, production_companies p
        WHERE p.company = c.id
          AND p.movie = l_row.id
          AND c.id NOT IN (SELECT id FROM companies@link_cc1);
      
      INSERT INTO production_companies@link_cc1
        SELECT * FROM production_companies WHERE movie = l_row.id;
      
      -- Langs
      INSERT INTO languages@link_cc1
        SELECT * FROM languages
        WHERE code NOT IN (SELECT code FROM languages@link_cc1);
        
      INSERT INTO spoken_lang@link_cc1
        SELECT * FROM spoken_lang WHERE movie = l_row.id;
    END IF; -- If found on CC
    
    -- And finally moving copies
    FOR i IN 1..fcopies LOOP
      SELECT MIN(num_copy) INTO cid FROM copies WHERE movie = l_row.id;
      
      INSERT INTO copies@link_cc1
        SELECT * FROM copies WHERE num_copy = cid AND movie = l_row.id;
        
      DELETE FROM copies WHERE num_copy = cid AND movie = l_row.id;
    END LOOP;
    
    -- Refreshing nb_copies
    UPDATE movies@link_cc1 SET nb_copies = (
      SELECT COUNT(*) FROM copies@link_cc1 WHERE movie = l_row.id
    ) WHERE id = l_row.id;
    
  END IF; -- If fcopies > 0
END;
/
ALTER TRIGGER "MAXUX_CB"."MOVIE_COPIES_UPDATED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_IMAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CB"."UPDATE_IMAGE" 
AFTER UPDATE ON IMAGES 
FOR EACH ROW
DECLARE
  v_id NUMBER;
  img images%rowtype;
  pragma autonomous_transaction;
BEGIN
  IF :new.stable = 'Y' THEN
    -- If movie exists on the link, syncing
    -- v_id := SGBDCB.CheckExists('movies@link_cc1', 'id', :new.movie);
    -- IF v_id != 0 THEN
      img.id    := :new.id;
      img.movie := :new.movie;
      img.image := :new.image;
      
      INSERT INTO images@link_cc1
        SELECT id, image, movie FROM images WHERE movie = :new.movie;
      COMMIT;
    -- END IF;
  END IF;
END;
/
ALTER TRIGGER "MAXUX_CB"."UPDATE_IMAGE" ENABLE;
--------------------------------------------------------
--  DDL for Package SGBDCB
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MAXUX_CB"."SGBDCB" AS 

  FUNCTION CheckExists(tbl VARCHAR2, field VARCHAR2, name VARCHAR2) RETURN NUMBER;
  FUNCTION CheckExists2(tbl VARCHAR2, field VARCHAR2, name VARCHAR2) RETURN VARCHAR2;
  FUNCTION CheckCertif(certif VARCHAR2) RETURN BOOLEAN;
  
  FUNCTION Image(v_id NUMBER) RETURN BLOB;
  PROCEDURE ImageACK(v_id NUMBER);
  
  PROCEDURE AlimCB(
    movie movies%ROWTYPE,
    actors artists_t,
    directors artists_t,
    genres genres_t,
    companies companies_t,
    languages langs_t
  );
  
  PROCEDURE CronJob;
  PROCEDURE Logger(v_errcode NUMBER, v_message VARCHAR2);

END SGBDCB;

/
--------------------------------------------------------
--  DDL for Package Body SGBDCB
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MAXUX_CB"."SGBDCB" AS

  --
  -- Generic check for an existings field
  --
  FUNCTION CheckExists(tbl VARCHAR2, field VARCHAR2, name VARCHAR2)
  RETURN NUMBER AS
    v_id NUMBER;
  BEGIN
    EXECUTE IMMEDIATE 'SELECT id FROM ' || tbl || 
                      ' WHERE ' || field || ' = ''' ||
                      REPLACE(name, '''', '''''') || ''''
                      INTO v_id;
    RETURN v_id;
  
    EXCEPTION      
      WHEN NO_DATA_FOUND THEN
        RETURN 0;
    
  END CheckExists;
  
  FUNCTION CheckExists2(tbl VARCHAR2, field VARCHAR2, name VARCHAR2)
  RETURN VARCHAR2 AS
    v_id VARCHAR2(10);
  BEGIN
    EXECUTE IMMEDIATE 'SELECT name FROM ' || tbl || 
                      ' WHERE ' || field || ' = ''' ||
                      REPLACE(name, '''', '''''') || ''''
                      INTO v_id;
    RETURN v_id;
  
    EXCEPTION      
      WHEN NO_DATA_FOUND THEN
        RETURN 'XXX';
    
  END CheckExists2;
  
  --
  -- Check if a certification is valid
  --
  FUNCTION CheckCertif(certif VARCHAR2)
  RETURN BOOLEAN AS
    v_code VARCHAR2(32);
    v_id NUMBER;
  BEGIN
    SELECT code INTO v_code FROM certification WHERE code = certif;
    RETURN TRUE;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
        
  END CheckCertif;
  
  --
  -- Prepare a BLOB row on Images table and return the
  -- BLOB pointer
  --
  FUNCTION Image(v_id NUMBER)
  RETURN BLOB AS
    output BLOB;
    v_temp NUMBER;
  BEGIN
    v_temp := CheckExists('images', 'movie', v_id);
    IF v_temp = 0 THEN
      INSERT INTO images (image, movie, stable) VALUES (empty_blob(), v_id, 'N') RETURNING image INTO output;      
    END IF;
    
    RETURN output;
  END Image;
  
  PROCEDURE ImageACK(v_id NUMBER) AS
  BEGIN
    UPDATE images SET stable = 'Y' WHERE movie = v_id;
    COMMIT;
  END ImageACK;

  -- The main part
  PROCEDURE AlimCB(movie movies%ROWTYPE, actors artists_t, directors artists_t, genres genres_t, companies companies_t, languages langs_t) AS
    v_movie movies%ROWTYPE;
    v_id NUMBER;
    v_id2 VARCHAR2(10);
    temp_nb_copies NUMBER;
    
    err_code logs.errcode%type;
    err_msg logs.message%type;
  BEGIN    
    
    -- 
    -- If the movie alread exists, just update the copies count
    --
    
    v_id := CheckExists('movies', 'id', movie.id);
    IF v_id != 0 THEN
      -- Grabbing current copies count
      SELECT nb_copies INTO v_id FROM movies WHERE id = v_id;
      
      -- Inserting new copies (with new ids)
      FOR i IN v_id + 1..movie.nb_copies + v_id LOOP
        INSERT INTO copies (num_copy, movie) VALUES (i, movie.id);
      END LOOP;
      
      -- Updating copies count
      UPDATE movies SET nb_copies = nb_copies + movie.nb_copies;
      COMMIT;
      
      RETURN;
    END IF;
    
    --
    -- If the movie doesn't already exists
    --
    v_movie := movie;
    
    -- Movie nb_copies aways to fire the update-trigger later
    -- when everything is done
    temp_nb_copies    := v_movie.nb_copies;
    v_movie.nb_copies := 0;
    
    -- Check Certification Format
    IF CheckCertif(movie.certification) = FALSE THEN
      v_movie.certification := NULL;
    END IF;
    
    -- Insert the movie itself
    INSERT INTO movies VALUES v_movie;
    
    -- Insert all artists
    FOR i IN 1..actors.count LOOP
      v_id := CheckExists('artists', 'name', actors(i));
      
      IF v_id = 0 THEN
        INSERT INTO artists (name) VALUES (actors(i)); -- RETURNING id INTO v_id;
        v_id := artists_id.currval;
      END IF;
      
      INSERT INTO movie_play (movie, artist) VALUES (movie.id, v_id);
    END LOOP;
    
    -- Insert all directors
    FOR i IN 1..directors.count LOOP
      v_id := CheckExists('artists', 'name', directors(i));
      
      IF v_id = 0 THEN
        INSERT INTO artists (name) VALUES (directors(i));
        v_id := artists_id.currval;
      END IF;
      
      INSERT INTO movie_direct (movie, director) VALUES (movie.id, v_id);
    END LOOP;
    
    -- Insert all genres
    FOR i IN 1..genres.count LOOP
      v_id := CheckExists('genres', 'name', genres(i));
      
      IF v_id = 0 THEN
        INSERT INTO genres (name) VALUES (genres(i));
        v_id := genres_id.currval;
      END IF;
      
      INSERT INTO movie_genres (genre, movie) VALUES (v_id, movie.id);
    END LOOP;
    
    -- Insert all companies
    FOR i IN 1..companies.count LOOP
      v_id := CheckExists('companies', 'name', companies(i));
      
      IF v_id = 0 THEN
        INSERT INTO companies (name) VALUES (companies(i));
        v_id := companies_id.currval;
      END IF;
      
      INSERT INTO production_companies (company, movie) VALUES (v_id, movie.id);
    END LOOP;
    
    -- Insert all languages
    FOR i IN 1..languages.count LOOP
      v_id2 := CheckExists2('languages', 'code', languages(i));
      
      IF v_id2 = 'XXX' THEN
        INSERT INTO languages (code, name) VALUES (languages(i), 'Unknown');
      END IF;
      
      INSERT INTO spoken_lang (languages, movie) VALUES (languages(i), movie.id);
    END LOOP;
    
    -- Inserting copies
    FOR i IN 1..movie.nb_copies LOOP
      INSERT INTO copies (num_copy, movie) VALUES (i, movie.id);
    END LOOP;
    
    -- Updating the nb_copies on movie
    -- This should fire the trigger UpdateCC
    UPDATE movies SET nb_copies = temp_nb_copies WHERE id = movie.id;
    COMMIT;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        err_code := SQLCODE;
        err_msg  := SQLERRM;
        Logger(err_code, err_msg);
        
  END AlimCB;
  
  --
  -- Periodic AlimCC
  --
  PROCEDURE CronJob AS
    v_movies movies%rowtype;
    v_actors artists_t;
    v_directors artists_t;
    v_genres genres_t;
    v_companies companies_t;
    v_languages langs_t;
    v_i NUMBER;
  BEGIN
    FOR x_movie IN (
      SELECT id FROM movies
    ) LOOP
      -- Fill in the movies table, removing nb_copies (there is no new copies)
      SELECT * INTO v_movies FROM movies WHERE id = x_movie.id;
      v_movies.nb_copies := 0;
      
      v_actors := artists_t();
      v_directors := artists_t();
      v_genres := genres_t();
      v_companies := companies_t();
      v_languages := langs_t();
      
      v_i := 1;
      FOR x IN (SELECT a.name FROM artists a, movie_play m WHERE m.artist = a.id AND m.movie = x_movie.id) LOOP
        v_actors.extend;
        v_actors(v_i) := x.name;
      END LOOP;
      
      v_i := 1;
      FOR x IN (SELECT a.name FROM artists a, movie_direct m WHERE m.director = a.id AND m.movie = x_movie.id) LOOP
        v_directors.extend;
        v_directors(v_i) := x.name;
      END LOOP;
      
      v_i := 1;
      FOR x IN (SELECT g.name FROM genres g, movie_genres m WHERE m.genre = g.id AND m.movie = x_movie.id) LOOP
        v_genres.extend;
        v_genres(v_i) := x.name;
      END LOOP;
      
      v_i := 1;
      FOR x IN (SELECT c.name FROM companies c, production_companies m WHERE m.company = c.id AND m.movie = x_movie.id) LOOP
        v_companies.extend;
        v_companies(v_i) := x.name;
      END LOOP;
      
      v_i := 1;
      FOR x IN (SELECT languages FROM spoken_lang WHERE movie = x_movie.id) LOOP
        v_languages.extend;
        v_languages(v_i) := x.languages;
      END LOOP;
      
      AlimCB(v_movies, v_actors, v_directors, v_genres, v_companies, v_languages);
    END LOOP;
  END;
  
  PROCEDURE Logger(v_errcode NUMBER, v_message VARCHAR2) AS
    pragma autonomous_transaction;
  BEGIN
    INSERT INTO logs(date_log, errcode, message) VALUES (CURRENT_DATE, v_errcode, v_message);
    COMMIT;
  END Logger;
END SGBDCB;

/
