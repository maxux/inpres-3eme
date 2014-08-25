--------------------------------------------------------
--  Fichier créé - jeudi-décembre-12-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for DB Link LINK_CB
--------------------------------------------------------

  CREATE DATABASE LINK "LINK_CB"
   CONNECT TO "MAXUX_CB" IDENTIFIED BY VALUES '053AF58A2D9533DEFE59FD1F0163607F94A31B6C8771BE317B'
   USING 'orcl';
--------------------------------------------------------
--  DDL for Sequence LOGS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MAXUX_CC1"."LOGS_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ARTISTS
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."ARTISTS" 
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

  CREATE TABLE "MAXUX_CC1"."CERTIFICATION" 
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

  CREATE TABLE "MAXUX_CC1"."COMPANIES" 
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

  CREATE TABLE "MAXUX_CC1"."COPIES" 
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

  CREATE TABLE "MAXUX_CC1"."COUNTRIES" 
   (	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GENRES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."GENRES" 
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

  CREATE TABLE "MAXUX_CC1"."IMAGES" 
   (	"ID" NUMBER, 
	"IMAGE" BLOB, 
	"MOVIE" NUMBER
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

  CREATE TABLE "MAXUX_CC1"."LANGUAGES" 
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

  CREATE TABLE "MAXUX_CC1"."LOGS" 
   (	"ID" VARCHAR2(20 BYTE), 
	"DATE_LOG" TIMESTAMP (2), 
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

  CREATE TABLE "MAXUX_CC1"."MOVIE_DIRECT" 
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

  CREATE TABLE "MAXUX_CC1"."MOVIE_GENRES" 
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

  CREATE TABLE "MAXUX_CC1"."MOVIE_PLAY" 
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

  CREATE TABLE "MAXUX_CC1"."MOVIES" 
   (	"ID" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"OVERVIEW" VARCHAR2(4000 BYTE), 
	"RATING" NUMBER, 
	"RELEASED_DATE" DATE, 
	"VOTE_AVERAGE" NUMBER, 
	"VOTE_COUNT" NUMBER, 
	"CERTIFICATION" VARCHAR2(10 BYTE), 
	"PRODUCTION_COUNTRY" VARCHAR2(4 BYTE), 
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

  CREATE TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" 
   (	"COMPANY" NUMBER, 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECTION
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."PROJECTION" 
   (	"MOVIE" NUMBER, 
	"COPY" NUMBER, 
	"TIME_SLOT" NUMBER, 
	"DAY" DATE, 
	"ROOM" VARCHAR2(20 BYTE), 
	"REMAINING_SEATS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECTION_ARCHIVES
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."PROJECTION_ARCHIVES" 
   (	"MOVIE" NUMBER, 
	"TOTAL_DAYS" NUMBER, 
	"TOTAL_SEATS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."ROOM" 
   (	"ID" VARCHAR2(20 BYTE), 
	"SEATS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPOKEN_LANG
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."SPOKEN_LANG" 
   (	"LANGUAGES" VARCHAR2(20 BYTE), 
	"MOVIE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIME_SLOT
--------------------------------------------------------

  CREATE TABLE "MAXUX_CC1"."TIME_SLOT" 
   (	"ID" NUMBER, 
	"SLOT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View INBANK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."INBANK" ("ID", "TITLE", "OVERVIEW", "CERTIFICATION", "POPULARITY", "PERENITY", "IMAGE") AS 
  SELECT m.id, m.title, m.overview, m.certification, po.popularity, pe.perenity, i.image
FROM movies m, popularity po, perenity pe, images i
WHERE po.movie = m.id
  AND pe.movie = m.id
  AND i.movie = m.id
  AND m.id IN (SELECT movie FROM projection WHERE TRUNC(day) >= TRUNC(CURRENT_DATE))
ORDER BY po.popularity DESC, pe.perenity DESC, m.title ASC;
--------------------------------------------------------
--  DDL for View PERENITY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."PERENITY" ("MOVIE", "PERENITY") AS 
  SELECT movie, (COUNT(*) / 7) perenity
FROM projection
GROUP BY movie;
--------------------------------------------------------
--  DDL for View PERENITY_CURRENT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."PERENITY_CURRENT" ("MOVIE", "PERENITY") AS 
  SELECT movie, (COUNT(*) / 7) perenity
FROM projection
GROUP BY movie;
--------------------------------------------------------
--  DDL for View POPULARITY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."POPULARITY" ("MOVIE", "POPULARITY") AS 
  SELECT p.movie, -SUM(p.remaining_seats - r.seats) popularity
FROM projection p, room r
WHERE p.room = r.id
GROUP BY p.movie;
--------------------------------------------------------
--  DDL for View POPULARITY_CURRENT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."POPULARITY_CURRENT" ("MOVIE", "POPULARITY") AS 
  SELECT p.movie, -SUM(p.remaining_seats - r.seats) popularity
FROM projection p, room r
WHERE p.room = r.id
GROUP BY p.movie;
--------------------------------------------------------
--  DDL for View PROJECTION_TEMP
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MAXUX_CC1"."PROJECTION_TEMP" ("ROOM", "TIME_SLOT") AS 
  SELECT r.id room, t.id time_slot FROM room r, time_slot t;
REM INSERTING into MAXUX_CC1.ARTISTS
SET DEFINE OFF;
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6429','Lewis Milestone');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6420','Frank Sinatra');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6421','Dean Martin');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6422','Peter Lawford');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6423','Angie Dickinson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6424','Richard Conte');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6425','Cesar Romero');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6426','Patrice Wymore');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6427','Joey Bishop');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6428','Sammy Davis Jr.');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6430','Al Pacino');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6431','Ellen Barkin');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6432','Bob Einstein');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6433','C��line Dion');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6449','Tony Scott');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6434','Gene Hackman');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6435','Jon Voight');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6436','Lisa Bonet');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6437','Gabriel Byrne');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6438','Will Smith');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6439','Regina King');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6440','Grant Heslov');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6441','Stuart Wilson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6442','Laura Cayouette');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6443','Loren Dean');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6444','Barry Pepper');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6445','Ian Hart');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6446','Jake Busey');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6447','Jason Lee');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6448','James LeGros');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6410','Steven Soderbergh');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6395','George Clooney');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6396','Brad Pitt');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6397','Matt Damon');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6398','Andy Garcia');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6399','Julia Roberts');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6400','Casey Affleck');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6401','Scott Caan');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6402','Carl Reiner');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6403','Don Cheadle');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6404','Bernie Mac');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6405','Elliott Gould');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6406','Eddie Jemison');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6407','Shaobo Qin');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6408','Scott L. Schwartz');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6409','Scott Beringer');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6412','Robbie Coltrane');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6413','Jeroen Krabb��');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6414','Vincent Cassel');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6415','Eddie Izzard');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6416','Bruce Willis');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6417','Cherry Jones');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6418','Albert Finney');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6419','Adriano Giannini');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6411','Catherine Zeta-Jones');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6454','Henry Cavill');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6455','Caroline Goodall');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6456','Jim Piddock');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6457','Rafi Gavron');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6458','Joseph Mawle');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6459','Ver��nica Echegui');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6460','Emma Hamilton');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6461','Michael Budd');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6462','Sigourney Weaver');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6478','Rian Johnson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6464','Emily Blunt');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6465','Joseph Gordon-Levitt');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6453','Robert Rodriguez');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6450','Kobe Bryant');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6451','Kanye West');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6452','Danny Trejo');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6463','Mabrouk El Mechri');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6466','Piper Perabo');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6467','Jeff Daniels');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6468','Paul Dano');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6469','Tracie Thoms');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6470','Noah Segan');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6471','Pierce Gagnon');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6472','Qing Xu');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6473','Frank Brennan');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6474','Garret Dillahunt');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6475','Nick Gomez');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6476','Marcus Hester');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6477','Jon Eyez');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6492','David Barrett');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6479','Josh Duhamel');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6480','Rosario Dawson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6481','Vincent D''Onofrio');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6482','50 Cent');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6483','Richard Schiff');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6484','Vinnie Jones');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6485','James Lesure');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6486','Quinton "Rampage" Jackson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6487','Arie Verveen');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6488','Bonnie Somerville');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6489','Nnamdi Asomugha');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6490','Kevin Dunn');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6491','Danny Epper');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6517','John Moore');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6503','Jai Courtney');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6504','Patrick Stewart');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6505','Sebastian Koch');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6506','Cole Hauser');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6507','Amaury Nolasco');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6508','Megalyn Echikunwoke');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6509','Aksel Hennie');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6510','Anne Vyalitsyna');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6511','Attila ��rpa');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6512','Pasha D. Lychnikoff');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6513','Yuliya Snigir');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6514','Zolee Ganxsta');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6515','Norbert N��v��nyi');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6516','Mary Elizabeth Winstead');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6531','Jon M. Chu');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6518','Channing Tatum');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6519','Dwayne Johnson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6520','Adrianne Palicki');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6521','Ray Stevenson');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6522','Ray Park');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6523','Joseph Mazzello');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6524','Arnold Vosloo');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6525','Walton Goggins');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6526','Byung-hun Lee');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6527','��lodie Yung');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6528','Jonathan Pryce');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6529','D.J. Cotrona');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6530','RZA');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6545','Mike Gunther');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6532','Ryan Phillippe');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6533','James Remar');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6534','Randy Couture');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6535','Will Yun Lee');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6536','Shaun Toub');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6537','Susie Abromeit');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6538','Jay Karnes');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6539','Jordan Trovillion');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6540','Ambyr Childers');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6541','Omar J. Dorsey');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6542','Theo Kypri');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6543','Richard Goteri');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6544','Jenna Dewan');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6561','Simon West');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6546','Sylvester Stallone');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6547','Arnold Schwarzenegger');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6548','Jean-Claude Van Damme');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6549','Chuck Norris');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6550','Scott Adkins');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6551','Jason Statham');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6552','Liam Hemsworth');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6553','Dolph Lundgren');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6554','Jet Li');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6555','Terry Crews');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6556','Charisma Carpenter');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6557','Nikolette Noel');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6558','Nan Yu');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6559','Amanda Ooms');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6560','George Zlatarev');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6563','Simon Crane');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6564','F. Gary Gray');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6562','Jamie Foxx');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6502','Aaron Harvey');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6493','Malin ��kerman');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6494','Nikki Reed');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6495','Deborah Ann Woll');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6496','Forest Whitaker');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6497','Brad Dourif');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6498','Shea Whigham');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6499','Michael Rosenbaum');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6500','Reila Aphrodite');
Insert into MAXUX_CC1.ARTISTS (ID,NAME) values ('6501','Edrick Browne');
REM INSERTING into MAXUX_CC1.CERTIFICATION
SET DEFINE OFF;
Insert into MAXUX_CC1.CERTIFICATION (CODE,DESCRIPTION) values ('G','General Audiences');
Insert into MAXUX_CC1.CERTIFICATION (CODE,DESCRIPTION) values ('PG','Parental Guidance Suggested');
Insert into MAXUX_CC1.CERTIFICATION (CODE,DESCRIPTION) values ('PG-13','Parents Strongly Cautioned');
Insert into MAXUX_CC1.CERTIFICATION (CODE,DESCRIPTION) values ('R','Restricted');
Insert into MAXUX_CC1.CERTIFICATION (CODE,DESCRIPTION) values ('NC-17','No One 17 and Under Admitted');
REM INSERTING into MAXUX_CC1.COMPANIES
SET DEFINE OFF;
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('270','Village Roadshow Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('271','Scott Free Productions');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('268','Warner Bros. Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('269','Warner Bros Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('278','Endgame Entertainment');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('279','Sony Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('280','FilmDistrict');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('272','Nike');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('273','Film Rites');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('274','Galavis Film');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('275','Picture Machine');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('276','Intrepid Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('277','Summit Entertainment');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('281','DMG Entertainment');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('282','TriStar Pictures');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('284','Gunny Entertainment');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('285','Millennium Films');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('286','Nu Image Films');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('287','Lionsgate');
Insert into MAXUX_CC1.COMPANIES (ID,NAME) values ('283','Benaroya Pictures');
REM INSERTING into MAXUX_CC1.COPIES
SET DEFINE OFF;
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','72559');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('1','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','72559');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('2','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','72559');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('3','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','72559');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('4','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','72559');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('5','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','299');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('6','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','161');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('7','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('8','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('8','9798');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('8','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('9','298');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('9','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('9','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('10','57324');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('10','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('11','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('12','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('13','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('14','76163');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('16','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('17','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('18','75736');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('21','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('22','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('23','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('24','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('25','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('26','70586');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('30','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('31','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('32','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('33','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('34','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('35','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('36','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('37','59967');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('38','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('39','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('40','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('41','77948');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('44','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('45','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('46','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('47','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('48','47964');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('52','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('53','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('54','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('55','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('56','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('57','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('58','37733');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('63','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('64','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('65','139567');
Insert into MAXUX_CC1.COPIES (NUM_COPY,MOVIE) values ('66','139567');
REM INSERTING into MAXUX_CC1.COUNTRIES
SET DEFINE OFF;
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AL','ALBANIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DZ','ALGERIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AS','AMERICAN SAMOA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AD','ANDORRA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AO','ANGOLA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AI','ANGUILLA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AQ','ANTARCTICA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AG','ANTIGUA AND BARBUDA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AR','ARGENTINA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AM','ARMENIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AW','ARUBA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AU','AUSTRALIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AT','AUSTRIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AZ','AZERBAIJAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BS','BAHAMAS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BH','BAHRAIN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BD','BANGLADESH');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BB','BARBADOS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BY','BELARUS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BE','BELGIUM');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BZ','BELIZE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BJ','BENIN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BM','BERMUDA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BT','BHUTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BO','BOLIVIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BA','BOSNIA AND HERZEGOWINA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BW','BOTSWANA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BV','BOUVET ISLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BR','BRAZIL');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IO','BRITISH INDIAN OCEAN TERRITORY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BN','BRUNEI DARUSSALAM');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BG','BULGARIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BF','BURKINA FASO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('BI','BURUNDI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KH','CAMBODIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CM','CAMEROON');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CA','CANADA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CV','CAPE VERDE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KY','CAYMAN ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CF','CENTRAL AFRICAN REPUBLIC');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TD','CHAD');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CL','CHILE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CN','CHINA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CX','CHRISTMAS ISLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CC','COCOS (KEELING) ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CO','COLOMBIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KM','COMOROS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CD','CONGO, Democratic Republic of (was Zaire)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CG','CONGO, Republic of');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CK','COOK ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CR','COSTA RICA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CI','COTE D''IVOIRE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HR','CROATIA (local name: Hrvatska)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CU','CUBA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CY','CYPRUS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CZ','CZECH REPUBLIC');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DK','DENMARK');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DJ','DJIBOUTI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DM','DOMINICA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DO','DOMINICAN REPUBLIC');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('EC','ECUADOR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('EG','EGYPT');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SV','EL SALVADOR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GQ','EQUATORIAL GUINEA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ER','ERITREA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('EE','ESTONIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ET','ETHIOPIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FK','FALKLAND ISLANDS (MALVINAS)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FO','FAROE ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FJ','FIJI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FI','FINLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FR','FRANCE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GF','FRENCH GUIANA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PF','FRENCH POLYNESIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TF','FRENCH SOUTHERN TERRITORIES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GA','GABON');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GM','GAMBIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GE','GEORGIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('DE','GERMANY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GH','GHANA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GI','GIBRALTAR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GR','GREECE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GL','GREENLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GD','GRENADA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GP','GUADELOUPE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GU','GUAM');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GT','GUATEMALA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GN','GUINEA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GW','GUINEA-BISSAU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GY','GUYANA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HT','HAITI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HM','HEARD AND MC DONALD ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HN','HONDURAS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HK','HONG KONG');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('HU','HUNGARY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IS','ICELAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IN','INDIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ID','INDONESIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IR','IRAN (ISLAMIC REPUBLIC OF)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IQ','IRAQ');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IE','IRELAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IL','ISRAEL');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('IT','ITALY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('JM','JAMAICA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('JP','JAPAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('JO','JORDAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KZ','KAZAKHSTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KE','KENYA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KI','KIRIBATI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KP','KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KR','KOREA, REPUBLIC OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KW','KUWAIT');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KG','KYRGYZSTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LA','LAO PEOPLE''S DEMOCRATIC REPUBLIC');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LV','LATVIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LB','LEBANON');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LS','LESOTHO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LR','LIBERIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LY','LIBYAN ARAB JAMAHIRIYA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LI','LIECHTENSTEIN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LT','LITHUANIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LU','LUXEMBOURG');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MO','MACAU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MG','MADAGASCAR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MW','MALAWI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MY','MALAYSIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MV','MALDIVES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ML','MALI');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MT','MALTA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MH','MARSHALL ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MQ','MARTINIQUE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MR','MAURITANIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MU','MAURITIUS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('YT','MAYOTTE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MX','MEXICO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('FM','MICRONESIA, FEDERATED STATES OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MD','MOLDOVA, REPUBLIC OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MC','MONACO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MN','MONGOLIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MS','MONTSERRAT');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MA','MOROCCO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MZ','MOZAMBIQUE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MM','MYANMAR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NA','NAMIBIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NR','NAURU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NP','NEPAL');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NL','NETHERLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AN','NETHERLANDS ANTILLES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NC','NEW CALEDONIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NZ','NEW ZEALAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NI','NICARAGUA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NE','NIGER');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NG','NIGERIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NU','NIUE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NF','NORFOLK ISLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('MP','NORTHERN MARIANA ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('NO','NORWAY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('OM','OMAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PK','PAKISTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PW','PALAU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PS','PALESTINIAN TERRITORY, Occupied');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PA','PANAMA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PG','PAPUA NEW GUINEA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PY','PARAGUAY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PE','PERU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PH','PHILIPPINES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PN','PITCAIRN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PL','POLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PT','PORTUGAL');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PR','PUERTO RICO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('QA','QATAR');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('RE','REUNION');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('RO','ROMANIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('RU','RUSSIAN FEDERATION');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('RW','RWANDA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SH','SAINT HELENA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('KN','SAINT KITTS AND NEVIS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LC','SAINT LUCIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('PM','SAINT PIERRE AND MIQUELON');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VC','SAINT VINCENT AND THE GRENADINES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('WS','SAMOA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SM','SAN MARINO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ST','SAO TOME AND PRINCIPE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SA','SAUDI ARABIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SN','SENEGAL');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CS','SERBIA AND MONTENEGRO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SC','SEYCHELLES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SL','SIERRA LEONE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SG','SINGAPORE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SK','SLOVAKIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SI','SLOVENIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SB','SOLOMON ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SO','SOMALIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ZA','SOUTH AFRICA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ES','SPAIN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('LK','SRI LANKA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SD','SUDAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SR','SURINAME');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SJ','SVALBARD AND JAN MAYEN ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SZ','SWAZILAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SE','SWEDEN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('CH','SWITZERLAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('SY','SYRIAN ARAB REPUBLIC');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TW','TAIWAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TJ','TAJIKISTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TZ','TANZANIA, UNITED REPUBLIC OF');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TH','THAILAND');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TL','TIMOR-LESTE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TG','TOGO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TK','TOKELAU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TO','TONGA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TT','TRINIDAD AND TOBAGO');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TN','TUNISIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TR','TURKEY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TM','TURKMENISTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TC','TURKS AND CAICOS ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('TV','TUVALU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('UG','UGANDA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('UA','UKRAINE');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AE','UNITED ARAB EMIRATES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('GB','UNITED KINGDOM');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('US','UNITED STATES');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('UM','UNITED STATES MINOR OUTLYING ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('UY','URUGUAY');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('UZ','UZBEKISTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VU','VANUATU');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VA','VATICAN CITY STATE (HOLY SEE)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VE','VENEZUELA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VN','VIET NAM');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VG','VIRGIN ISLANDS (BRITISH)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('VI','VIRGIN ISLANDS (U.S.)');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('WF','WALLIS AND FUTUNA ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('EH','WESTERN SAHARA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('YE','YEMEN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ZM','ZAMBIA');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AX','AALAND ISLANDS');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('AF','AFGHANISTAN');
Insert into MAXUX_CC1.COUNTRIES (CODE,NAME) values ('ZW','ZIMBABWE');
REM INSERTING into MAXUX_CC1.GENRES
SET DEFINE OFF;
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('618','Drama');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('619','Suspense');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('613','Action');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('614','Comedy');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('615','Crime');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('616','Thriller');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('617','Adventure');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('620','Sports Film');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('621','Short');
Insert into MAXUX_CC1.GENRES (ID,NAME) values ('622','Science Fiction');
REM INSERTING into MAXUX_CC1.IMAGES
SET DEFINE OFF;
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('446','163');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('451','59967');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('458','37733');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('459','139567');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('460','76163');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('456','70586');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('447','299');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('449','298');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('448','161');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('452','57324');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('454','75736');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('450','9798');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('453','77948');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('455','47964');
Insert into MAXUX_CC1.IMAGES (ID,MOVIE) values ('457','72559');
REM INSERTING into MAXUX_CC1.LANGUAGES
SET DEFINE OFF;
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AA','Afar');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AB','Abkhazian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AF','Afrikaans');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AM','Amharic');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AR','Arabic');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AS','Assamese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AY','Aymara');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('AZ','Azerbaijani');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BA','Bashkir');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BE','Byelorussian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BG','Bulgarian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BH','Bihari');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BI','Bislama');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BN','Bengali');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BO','Tibetan');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('BR','Breton');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('CA','Catalan');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('CO','Corsican');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('CS','Czech');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('CY','Welsh');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('DA','Danish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('DE','German');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('DZ','Bhutani');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('EL','Greek');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('EN','English');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('EO','Esperanto');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ES','Spanish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ET','Estonian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('EU','Basque');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FA','Persian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FI','Finnish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FJ','Fiji');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FO','Faeroese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FR','French');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('FY','Frisian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('GA','Irish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('GD','Gaelic');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('GL','Galician');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('GN','Guarani');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('GU','Gujarati');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('HA','Hausa');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('HI','Hindi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('HR','Croatian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('HU','Hungarian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('HY','Armenian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IA','Interlingua');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IE','Interlingue');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IK','Inupiak');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IN','Indonesian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IS','Icelandic');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IT','Italian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('IW','Hebrew');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('JA','Japanese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('JI','Yiddish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('JW','Javanese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KA','Georgian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KK','Kazakh');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KL','Greenlandic');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KM','Cambodian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KN','Kannada');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KO','Korean');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KS','Kashmiri');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KU','Kurdish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('KY','Kirghiz');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('LA','Latin');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('LN','Lingala');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('LO','Laothian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('LT','Lithuanian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('LV','Latvian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MG','Malagasy');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MI','Maori');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MK','Macedonian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ML','Malayalam');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MN','Mongolian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MO','Moldavian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MR','Marathi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MS','Malay');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MT','Maltese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('MY','Burmese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('NA','Nauru');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('NE','Nepali');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('NL','Dutch');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('NO','Norwegian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('OC','Occitan');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('OM','Oromo');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('OR','Oriya');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('PA','Punjabi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('PL','Polish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('PS','Pashto');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('PT','Portuguese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('QU','Quechua');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('RM','Rhaeto-Romance');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('RN','Kirundi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('RO','Romanian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('RU','Russian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('RW','Kinyarwanda');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SA','Sanskrit');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SD','Sindhi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SG','Sangro');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SH','Serbo-Croatian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SI','Singhalese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SK','Slovak');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SL','Slovenian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SM','Samoan');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SN','Shona');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SO','Somali');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SQ','Albanian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SR','Serbian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SS','Siswati');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ST','Sesotho');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SU','Sudanese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SV','Swedish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('SW','Swahili');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TA','Tamil');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TE','Tegulu');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TG','Tajik');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TH','Thai');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TI','Tigrinya');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TK','Turkmen');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TL','Tagalog');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TN','Setswana');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TO','Tonga');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TR','Turkish');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TS','Tsonga');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TT','Tatar');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('TW','Twi');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('UK','Ukrainian');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('UR','Urdu');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('UZ','Uzbek');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('VI','Vietnamese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('VO','Volapuk');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('WO','Wolof');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('XH','Xhosa');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('YO','Yoruba');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ZH','Chinese');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('ZU','Zulu');
Insert into MAXUX_CC1.LANGUAGES (CODE,NAME) values ('CN','Unknown');
REM INSERTING into MAXUX_CC1.LOGS
SET DEFINE OFF;
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1044',to_timestamp('12/12/13 07:32:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1042',to_timestamp('12/12/13 07:32:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1043',to_timestamp('12/12/13 07:32:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie: handling movie 299');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1014',to_timestamp('12/12/13 07:30:13,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1015',to_timestamp('12/12/13 07:30:13,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1016',to_timestamp('12/12/13 07:30:21,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1017',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Initializing ProgFilms');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1018',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 3, time_slot: 3');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1019',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 298, copy: 1, days: 5');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1020',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 3, time_slot: 4');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1021',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 163, copy: 1, days: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1022',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 1, time_slot: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1023',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 161, copy: 1, days: 9');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1024',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 4');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1025',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 298, copy: 1, days: 8');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1026',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1027',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 299, copy: 1, days: 14');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1028',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1029',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 9798, copy: 2, days: 11');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1030',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 1, time_slot: 4');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1031',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 299, copy: 3, days: 7');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1032',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 3, time_slot: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1033',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 298, copy: 2, days: 11');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1034',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 1, time_slot: 3');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1035',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 298, copy: 3, days: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1036',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 3');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1037',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 299, copy: 2, days: 6');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1038',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 1, time_slot: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1039',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 163, copy: 2, days: 3');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1040',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 3, time_slot: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1041',to_timestamp('12/12/13 07:30:50,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 299, copy: 3, days: 9');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1130',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Initializing ProgFilms');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1131',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1012',to_timestamp('12/12/13 07:30:12,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1013',to_timestamp('12/12/13 07:30:13,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1132',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 70586, copy: 21, days: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1133',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 1, time_slot: 4');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1134',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 76163, copy: 14, days: 11');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1135',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 2, time_slot: 3');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1136',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 161, copy: 4, days: 2');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1137',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Missing: room: 3, time_slot: 1');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1138',to_timestamp('12/12/13 07:34:29,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','Copy selected: movie: 76163, copy: 12, days: 17');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1047',to_timestamp('12/12/13 07:34:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1048',to_timestamp('12/12/13 07:34:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1045',to_timestamp('12/12/13 07:34:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1046',to_timestamp('12/12/13 07:34:01,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1049',to_timestamp('12/12/13 07:34:02,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1050',to_timestamp('12/12/13 07:34:02,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1051',to_timestamp('12/12/13 07:34:02,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1052',to_timestamp('12/12/13 07:34:03,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1053',to_timestamp('12/12/13 07:34:03,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1054',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1055',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1056',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1057',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1058',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1059',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1060',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1061',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1062',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1063',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1064',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1065',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1066',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1067',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1068',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1069',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1070',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1071',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1072',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1073',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1074',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1075',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1076',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1077',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1078',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1079',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1080',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1081',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1082',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1083',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1084',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1085',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1086',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1087',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1088',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1089',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1090',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1091',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1092',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1093',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1094',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1095',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1096',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1097',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1098',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1099',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1100',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1101',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1102',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1103',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1104',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1105',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1106',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1107',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1108',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1109',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1110',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1111',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1112',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1113',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1114',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1115',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1116',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1117',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1118',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1119',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1120',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1121',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1122',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1123',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1124',to_timestamp('12/12/13 07:34:08,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1125',to_timestamp('12/12/13 07:34:09,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1126',to_timestamp('12/12/13 07:34:09,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1127',to_timestamp('12/12/13 07:34:09,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1128',to_timestamp('12/12/13 07:34:09,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
Insert into MAXUX_CC1.LOGS (ID,DATE_LOG,ERRCODE,MESSAGE) values ('1129',to_timestamp('12/12/13 07:34:09,000000000','DD/MM/RR HH24:MI:SS,FF'),'0','RetourCopie fired');
REM INSERTING into MAXUX_CC1.MOVIE_DIRECT
SET DEFINE OFF;
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('161','6410');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('163','6410');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('298','6410');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('299','6429');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('9798','6449');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('37733','6563');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('37733','6564');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('47964','6517');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('57324','6453');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('59967','6478');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('70586','6545');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('72559','6531');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('75736','6502');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('76163','6561');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('77948','6463');
Insert into MAXUX_CC1.MOVIE_DIRECT (MOVIE,DIRECTOR) values ('139567','6492');
REM INSERTING into MAXUX_CC1.MOVIE_GENRES
SET DEFINE OFF;
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','161');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','298');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','299');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','9798');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','37733');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','47964');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','57324');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','59967');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','70586');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','72559');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','75736');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','76163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','77948');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('613','139567');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('614','161');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('614','163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('614','298');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('614','299');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('614','75736');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','161');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','298');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','299');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','37733');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','70586');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('615','139567');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','161');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','9798');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','37733');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','47964');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','59967');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','70586');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','72559');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','75736');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','76163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','77948');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('616','139567');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('617','299');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('617','72559');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('617','76163');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('618','9798');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('618','37733');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('618','70586');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('618','75736');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('618','139567');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('619','9798');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('620','57324');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('621','57324');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('622','59967');
Insert into MAXUX_CC1.MOVIE_GENRES (GENRE,MOVIE) values ('622','72559');
REM INSERTING into MAXUX_CC1.MOVIE_PLAY
SET DEFINE OFF;
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6401');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6434');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6435');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6436');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6437');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6438');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6439');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6440');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6441');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6442');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6443');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6444');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6445');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6446');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6447');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('9798','6448');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('37733','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('37733','6562');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6503');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6504');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6505');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6506');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6507');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6508');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6509');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6510');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6511');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6512');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6513');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6514');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6515');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('47964','6516');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6450');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6451');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6452');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('57324','6453');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6464');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6465');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6466');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6467');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6468');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6469');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6470');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6471');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6472');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6473');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6474');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6475');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6476');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('59967','6477');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6482');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6532');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6533');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6534');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6535');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6536');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6537');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6538');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6539');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6540');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6541');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6542');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6543');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('70586','6544');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6518');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6519');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6520');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6521');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6522');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6523');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6524');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6525');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6526');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6527');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6528');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6529');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('72559','6530');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6493');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6494');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6495');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6496');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6497');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6498');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6499');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6500');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('75736','6501');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6534');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6546');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6547');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6548');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6549');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6550');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6551');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6552');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6553');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6554');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6555');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6556');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6557');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6558');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6559');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('76163','6560');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6454');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6455');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6456');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6457');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6458');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6459');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6460');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6461');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('77948','6462');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6479');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6480');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6481');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6482');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6483');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6484');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6485');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6486');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6487');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6488');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6489');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6490');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('139567','6491');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6395');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6396');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6397');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6398');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6399');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6400');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6401');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6402');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6403');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6404');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6405');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6406');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6407');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6408');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('161','6409');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6395');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6396');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6397');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6398');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6399');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6400');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6401');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6402');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6403');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6404');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6405');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6406');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6407');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6411');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6412');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6413');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6414');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6415');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6416');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6417');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6418');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('163','6419');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6395');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6396');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6397');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6398');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6400');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6401');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6402');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6403');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6404');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6405');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6406');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6407');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6414');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6415');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6430');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6431');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6432');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('298','6433');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6420');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6421');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6422');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6423');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6424');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6425');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6426');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6427');
Insert into MAXUX_CC1.MOVIE_PLAY (MOVIE,ARTIST) values ('299','6428');
REM INSERTING into MAXUX_CC1.MOVIES
SET DEFINE OFF;
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('299','Ocean''s Eleven','Ocean''s Eleven is the ''Rat-Pack'' comedy about robber Danny Ocean and his gang''s attempt to rob the five biggest casinos in Las Vegas.',null,to_date('10/08/60','DD/MM/RR'),'6,8','4','PG-13','US','127','6');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('298','Ocean''s Thirteen','Danny Ocean''s team of criminals are back and are composing a plan more personal than ever. When ruthless casino owner Willy Bank double-crosses Reuben Tishkoff, causing a heart attack, Danny Ocean vows that him and his team will do anything to bring Willy Bank and everything he''s got down. Even if it includes hiring help from one of their own enemies, Terry Benedict.',null,to_date('08/06/07','DD/MM/RR'),'7,9','31','PG-13','US','122','9');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('9798','Enemy of the State','Hotshot Washington lawyer Robert Dean becomes a victim of high-tech identity theft when a hacker slips an incriminating video into his pocket. Soon, a rogue National Security agent sets out to recover the tape -- and destroy Dean.',null,to_date('16/11/98','DD/MM/RR'),'8,3','20','R','US','132','8');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('161','Ocean''s Eleven','Less than 24 hours into his parole, charismatic thief Danny Ocean is already rolling out his next plan: In one night, Danny''s hand-picked crew of specialists will attempt to steal more than $150 million from three Las Vegas casinos. But to score the cash, Danny risks his chances of reconciling with ex-wife, Tess.',null,to_date('07/12/01','DD/MM/RR'),'8,5','47','PG-13','US','116','7');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('163','Ocean''s Twelve','Danny Ocean reunites with his old flame and the rest of his merry band of thieves in a caper concerning three huge heists in Rome, Paris and Amsterdam. But Europol agent Isabel Lahiri is hot on their heels.',null,to_date('10/12/04','DD/MM/RR'),'7,7','34','PG-13','AU','125','7');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('59967','Looper','In the futuristic action thriller Looper, time travel will be invented - but it will be illegal and only available on the black market.  When the mob wants to get rid of someone, they will send their target 30 years into the past, where a "looper" - a hired gun, like Joe (Joseph Gordon-Levitt) - is waiting to mop up.  Joe is getting rich and life is good... until the day the mob decides to "close the loop," sending back Joe''s future self (Bruce Willis) for assassination.',null,to_date('28/09/12','DD/MM/RR'),'8,3','10','R','US','118','15');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('139567','Fire with Fire','A fireman takes an unexpected course of action when a man whom he''s been ordered to testify against, after being held up at a local convenience store, threatens him.',null,to_date('06/11/12','DD/MM/RR'),'0','0','R','US','97','10');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('57324','The Black Mamba','Nike-sponsored short film directed by Robert Rodriguez.',null,to_date('31/01/11','DD/MM/RR'),'9','1','PG','US','6','10');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('77948','The Cold Light of Day','A young American (Cavill) uncovers a conspiracy during his attempt to save his family, who were kidnapped while on vacation in Spain.',null,to_date('07/09/12','DD/MM/RR'),'7,8','4','PG-13','US','93','10');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('47964','A Good Day to Die Hard','John McClane finds himself in Moscow and gets caught up in a terrorist plot with his estranged son.',null,to_date('14/02/13','DD/MM/RR'),'0','0',null,'US','0','10');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('72559','G.I. Joe: Retaliation','The G.I. Joe team faces off against Zartan, his accomplices, and the world leaders he has under his influence.',null,to_date('29/03/13','DD/MM/RR'),'0','0','PG-13','US','120','5');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('70586','Setup','A group of friends plan out a detailed heist that turns deadly when one betrays the other by taking off with the goods. Taking matters into his own hands, Sonny seeks out his revenge teaming up with the most dangerous mob boss in town to get back what is rightfully his. When he finally comes face to face with his longtime friend he will be forced to make a life changing choice.',null,to_date('04/11/11','DD/MM/RR'),'6,1','13','R','US','85','12');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('76163','The Expendables 2','Mr. Church reunites the Expendables for what should be an easy paycheck, but when one of their men is murdered on the job, their quest for revenge puts them deep in enemy territory and up against an unexpected threat.',null,to_date('17/08/12','DD/MM/RR'),'8,3','17','R','US','103','11');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('37733','Kane & Lynch','A pair of Death Row inmates, a mercenary named Kane and a schizophrenic named Lynch, escape during a prison transport and team up to retrieve a stolen fortune. Based on a video game.',null,to_date('31/12/13','DD/MM/RR'),'0','0',null,'US','0','12');
Insert into MAXUX_CC1.MOVIES (ID,TITLE,OVERVIEW,RATING,RELEASED_DATE,VOTE_AVERAGE,VOTE_COUNT,CERTIFICATION,PRODUCTION_COUNTRY,RUNTIME,NB_COPIES) values ('75736','Catch .44','The lives of three female assassins take a sudden turn when their charming boss lures them into one last job. They soon find themselves thrust into a bizarre situation involving a psychotic hit man, a grizzled trucker and a delusional line cook.',null,to_date('09/12/11','DD/MM/RR'),'6,9','8','R','US','93','8');
REM INSERTING into MAXUX_CC1.PRODUCTION_COMPANIES
SET DEFINE OFF;
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','161');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','163');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('268','298');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('269','299');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('270','298');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('271','9798');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('272','57324');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('273','77948');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('274','77948');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('275','77948');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('276','77948');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('277','77948');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('278','59967');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('279','59967');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('280','59967');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('281','59967');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('282','59967');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('283','75736');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('284','70586');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('285','76163');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('286','76163');
Insert into MAXUX_CC1.PRODUCTION_COMPANIES (COMPANY,MOVIE) values ('287','37733');
REM INSERTING into MAXUX_CC1.PROJECTION
SET DEFINE OFF;
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','3',to_date('14/12/13','DD/MM/RR'),'3','41');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','3',to_date('15/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','3',to_date('16/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','3',to_date('17/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('163','1','4',to_date('13/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('163','1','4',to_date('14/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('13/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('14/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('15/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('16/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('17/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('18/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('19/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('20/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','1','1',to_date('21/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('13/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('14/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('15/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('16/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('17/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('18/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('19/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','4',to_date('20/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('14/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('15/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('16/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('17/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('18/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('19/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('20/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('21/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('22/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('23/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','4','3',to_date('13/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('161','4','3',to_date('14/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('13/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('14/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('13/12/13','DD/MM/RR'),'2','41');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('14/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('15/12/13','DD/MM/RR'),'2','12');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('16/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('17/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('18/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('19/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('20/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('21/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('22/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('9798','2','2',to_date('23/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('15/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('16/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('17/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('18/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('19/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('20/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('21/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('13/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('14/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('15/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('16/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('17/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('18/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('19/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('20/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('21/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('22/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','2','2',to_date('23/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','3','3',to_date('13/12/13','DD/MM/RR'),'1','0');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','3','3',to_date('14/12/13','DD/MM/RR'),'1','0');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('22/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('23/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('24/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('25/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('26/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('27/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('163','2','2',to_date('13/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('163','2','2',to_date('14/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('163','2','2',to_date('15/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('28/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','12','1',to_date('29/12/13','DD/MM/RR'),'3','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('70586','21','1',to_date('13/12/13','DD/MM/RR'),'2','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('76163','14','4',to_date('13/12/13','DD/MM/RR'),'1','42');
Insert into MAXUX_CC1.PROJECTION (MOVIE,COPY,TIME_SLOT,DAY,ROOM,REMAINING_SEATS) values ('298','1','3',to_date('13/12/13','DD/MM/RR'),'3','42');
REM INSERTING into MAXUX_CC1.PROJECTION_ARCHIVES
SET DEFINE OFF;
Insert into MAXUX_CC1.PROJECTION_ARCHIVES (MOVIE,TOTAL_DAYS,TOTAL_SEATS) values ('299','5,14285714285714285714285714285714285714','3');
REM INSERTING into MAXUX_CC1.ROOM
SET DEFINE OFF;
Insert into MAXUX_CC1.ROOM (ID,SEATS) values ('1','42');
Insert into MAXUX_CC1.ROOM (ID,SEATS) values ('2','42');
Insert into MAXUX_CC1.ROOM (ID,SEATS) values ('3','42');
REM INSERTING into MAXUX_CC1.SPOKEN_LANG
SET DEFINE OFF;
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('CN','161');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('CS','9798');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','161');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','163');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','298');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','299');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','9798');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','37733');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','47964');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','57324');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','59967');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','70586');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','72559');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','75736');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','76163');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','77948');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('EN','139567');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','163');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','70586');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('FR','77948');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('IT','161');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('IT','163');
Insert into MAXUX_CC1.SPOKEN_LANG (LANGUAGES,MOVIE) values ('NL','163');
REM INSERTING into MAXUX_CC1.TIME_SLOT
SET DEFINE OFF;
Insert into MAXUX_CC1.TIME_SLOT (ID,SLOT) values ('1','10h');
Insert into MAXUX_CC1.TIME_SLOT (ID,SLOT) values ('2','14h');
Insert into MAXUX_CC1.TIME_SLOT (ID,SLOT) values ('3','18h');
Insert into MAXUX_CC1.TIME_SLOT (ID,SLOT) values ('4','22h');
REM INSERTING into MAXUX_CC1.INBANK
SET DEFINE OFF;
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('298','Ocean''s Thirteen','Danny Ocean''s team of criminals are back and are composing a plan more personal than ever. When ruthless casino owner Willy Bank double-crosses Reuben Tishkoff, causing a heart attack, Danny Ocean vows that him and his team will do anything to bring Willy Bank and everything he''s got down. Even if it includes hiring help from one of their own enemies, Terry Benedict.','PG-13','85','3,71428571428571428571428571428571428571');
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('9798','Enemy of the State','Hotshot Washington lawyer Robert Dean becomes a victim of high-tech identity theft when a hacker slips an incriminating video into his pocket. Soon, a rogue National Security agent sets out to recover the tape -- and destroy Dean.','R','31','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('76163','The Expendables 2','Mr. Church reunites the Expendables for what should be an easy paycheck, but when one of their men is murdered on the job, their quest for revenge puts them deep in enemy territory and up against an unexpected threat.','R','0','4');
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('161','Ocean''s Eleven','Less than 24 hours into his parole, charismatic thief Danny Ocean is already rolling out his next plan: In one night, Danny''s hand-picked crew of specialists will attempt to steal more than $150 million from three Las Vegas casinos. But to score the cash, Danny risks his chances of reconciling with ex-wife, Tess.','PG-13','0','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('163','Ocean''s Twelve','Danny Ocean reunites with his old flame and the rest of his merry band of thieves in a caper concerning three huge heists in Rome, Paris and Amsterdam. But Europol agent Isabel Lahiri is hot on their heels.','PG-13','0','0,7142857142857142857142857142857142857143');
Insert into MAXUX_CC1.INBANK (ID,TITLE,OVERVIEW,CERTIFICATION,POPULARITY,PERENITY) values ('70586','Setup','A group of friends plan out a detailed heist that turns deadly when one betrays the other by taking off with the goods. Taking matters into his own hands, Sonny seeks out his revenge teaming up with the most dangerous mob boss in town to get back what is rightfully his. When he finally comes face to face with his longtime friend he will be forced to make a life changing choice.','R','0','0,1428571428571428571428571428571428571429');
REM INSERTING into MAXUX_CC1.PERENITY
SET DEFINE OFF;
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('161','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('163','0,7142857142857142857142857142857142857143');
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('298','3,71428571428571428571428571428571428571');
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('9798','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('70586','0,1428571428571428571428571428571428571429');
Insert into MAXUX_CC1.PERENITY (MOVIE,PERENITY) values ('76163','4');
REM INSERTING into MAXUX_CC1.PERENITY_CURRENT
SET DEFINE OFF;
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('161','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('163','0,7142857142857142857142857142857142857143');
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('298','3,71428571428571428571428571428571428571');
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('9798','1,57142857142857142857142857142857142857');
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('70586','0,1428571428571428571428571428571428571429');
Insert into MAXUX_CC1.PERENITY_CURRENT (MOVIE,PERENITY) values ('76163','4');
REM INSERTING into MAXUX_CC1.POPULARITY
SET DEFINE OFF;
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('76163','0');
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('298','85');
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('163','0');
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('161','0');
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('70586','0');
Insert into MAXUX_CC1.POPULARITY (MOVIE,POPULARITY) values ('9798','31');
REM INSERTING into MAXUX_CC1.POPULARITY_CURRENT
SET DEFINE OFF;
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('76163','0');
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('298','85');
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('163','0');
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('161','0');
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('70586','0');
Insert into MAXUX_CC1.POPULARITY_CURRENT (MOVIE,POPULARITY) values ('9798','31');
REM INSERTING into MAXUX_CC1.PROJECTION_TEMP
SET DEFINE OFF;
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('1','1');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('1','2');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('1','3');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('1','4');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('2','1');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('2','2');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('2','3');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('2','4');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('3','1');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('3','2');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('3','3');
Insert into MAXUX_CC1.PROJECTION_TEMP (ROOM,TIME_SLOT) values ('3','4');
--------------------------------------------------------
--  DDL for Index ARTISTS_NAME
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."ARTISTS_NAME" ON "MAXUX_CC1"."ARTISTS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ARTISTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."ARTISTS_PK" ON "MAXUX_CC1"."ARTISTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CERTIFICATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."CERTIFICATION_PK" ON "MAXUX_CC1"."CERTIFICATION" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMPANIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."COMPANIES_PK" ON "MAXUX_CC1"."COMPANIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COPIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."COPIES_PK" ON "MAXUX_CC1"."COPIES" ("NUM_COPY", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."COUNTRIES_PK" ON "MAXUX_CC1"."COUNTRIES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRIES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."COUNTRIES_UK1" ON "MAXUX_CC1"."COUNTRIES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENRES_GENRE
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."GENRES_GENRE" ON "MAXUX_CC1"."GENRES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENRES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."GENRES_PK" ON "MAXUX_CC1"."GENRES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IMAGES_INDEX1
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."IMAGES_INDEX1" ON "MAXUX_CC1"."IMAGES" ("MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IMAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."IMAGES_PK" ON "MAXUX_CC1"."IMAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LANGUAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."LANGUAGES_PK" ON "MAXUX_CC1"."LANGUAGES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LANGUAGES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."LANGUAGES_UK1" ON "MAXUX_CC1"."LANGUAGES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."LOGS_PK" ON "MAXUX_CC1"."LOGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_DIRECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."MOVIE_DIRECT_PK" ON "MAXUX_CC1"."MOVIE_DIRECT" ("MOVIE", "DIRECTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_GENRES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."MOVIE_GENRES_PK" ON "MAXUX_CC1"."MOVIE_GENRES" ("GENRE", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIE_PLAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."MOVIE_PLAY_PK" ON "MAXUX_CC1"."MOVIE_PLAY" ("MOVIE", "ARTIST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_COUNTRY
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."MOVIES_COUNTRY" ON "MAXUX_CC1"."MOVIES" ("PRODUCTION_COUNTRY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_NB_COPIES
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."MOVIES_NB_COPIES" ON "MAXUX_CC1"."MOVIES" ("NB_COPIES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."MOVIES_PK" ON "MAXUX_CC1"."MOVIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MOVIES_TITLE
--------------------------------------------------------

  CREATE INDEX "MAXUX_CC1"."MOVIES_TITLE" ON "MAXUX_CC1"."MOVIES" ("TITLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTION_COMPANIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."PRODUCTION_COMPANIES_PK" ON "MAXUX_CC1"."PRODUCTION_COMPANIES" ("COMPANY", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECTION_ARCHIVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."PROJECTION_ARCHIVES_PK" ON "MAXUX_CC1"."PROJECTION_ARCHIVES" ("MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."PROJECTION_PK" ON "MAXUX_CC1"."PROJECTION" ("MOVIE", "COPY", "TIME_SLOT", "DAY", "ROOM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ROOM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."ROOM_PK" ON "MAXUX_CC1"."ROOM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPOKEN_LANG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."SPOKEN_LANG_PK" ON "MAXUX_CC1"."SPOKEN_LANG" ("LANGUAGES", "MOVIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIME_SLOT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAXUX_CC1"."TIME_SLOT_PK" ON "MAXUX_CC1"."TIME_SLOT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARTISTS
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."ARTISTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."ARTISTS" ADD CONSTRAINT "ARTISTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CERTIFICATION
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."CERTIFICATION" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."CERTIFICATION" ADD CONSTRAINT "CERTIFICATION_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."CERTIFICATION" ADD CONSTRAINT "CERTIFICATION_CODE" CHECK (CODE IN ('G', 'PG', 'PG-13', 'R', 'NC-17')) ENABLE;
--------------------------------------------------------
--  Constraints for Table COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."COMPANIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."COMPANIES" ADD CONSTRAINT "COMPANIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COPIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."COPIES" MODIFY ("NUM_COPY" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."COPIES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."COPIES" ADD CONSTRAINT "COPIES_PK" PRIMARY KEY ("NUM_COPY", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."COUNTRIES" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_UK1" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."GENRES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."GENRES" ADD CONSTRAINT "GENRES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table IMAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."IMAGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."IMAGES" ADD CONSTRAINT "IMAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LANGUAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."LANGUAGES" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."LANGUAGES" ADD CONSTRAINT "LANGUAGES_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."LANGUAGES" ADD CONSTRAINT "LANGUAGES_UK1" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGS
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."LOGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."LOGS" ADD CONSTRAINT "LOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIE_DIRECT
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_DIRECT" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_DIRECT" MODIFY ("DIRECTOR" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_PK" PRIMARY KEY ("MOVIE", "DIRECTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIE_GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_GENRES" MODIFY ("GENRE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_GENRES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_PK" PRIMARY KEY ("GENRE", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIE_PLAY
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_PLAY" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_PLAY" MODIFY ("ARTIST" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_PK" PRIMARY KEY ("MOVIE", "ARTIST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIES" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIES" MODIFY ("VOTE_AVERAGE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIES" MODIFY ("VOTE_COUNT" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIES" ADD CONSTRAINT "MOVIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."MOVIES" MODIFY ("NB_COPIES" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."MOVIES" ADD CONSTRAINT "MOVIES_CHK1" CHECK (VOTE_AVERAGE <= 10 AND VOTE_AVERAGE >= 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTION_COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" MODIFY ("COMPANY" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_PK" PRIMARY KEY ("COMPANY", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROJECTION
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PROJECTION" ADD CONSTRAINT "PROJECTION_PK" PRIMARY KEY ("MOVIE", "COPY", "TIME_SLOT", "DAY", "ROOM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."PROJECTION" MODIFY ("ROOM" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PROJECTION" MODIFY ("DAY" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PROJECTION" MODIFY ("TIME_SLOT" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PROJECTION" MODIFY ("COPY" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."PROJECTION" MODIFY ("MOVIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECTION_ARCHIVES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PROJECTION_ARCHIVES" ADD CONSTRAINT "PROJECTION_ARCHIVES_PK" PRIMARY KEY ("MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."PROJECTION_ARCHIVES" MODIFY ("MOVIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."ROOM" ADD CONSTRAINT "ROOM_CHK1" CHECK (SEATS >= 0) ENABLE;
  ALTER TABLE "MAXUX_CC1"."ROOM" ADD CONSTRAINT "ROOM_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."ROOM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPOKEN_LANG
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."SPOKEN_LANG" MODIFY ("LANGUAGES" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."SPOKEN_LANG" MODIFY ("MOVIE" NOT NULL ENABLE);
  ALTER TABLE "MAXUX_CC1"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_PK" PRIMARY KEY ("LANGUAGES", "MOVIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIME_SLOT
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."TIME_SLOT" ADD CONSTRAINT "TIME_SLOT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MAXUX_CC1"."TIME_SLOT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COPIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."COPIES" ADD CONSTRAINT "COPIES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IMAGES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."IMAGES" ADD CONSTRAINT "IMAGES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_DIRECT
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_ARTISTS_FK1" FOREIGN KEY ("DIRECTOR")
	  REFERENCES "MAXUX_CC1"."ARTISTS" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CC1"."MOVIE_DIRECT" ADD CONSTRAINT "MOVIE_DIRECT_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_GENRES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_GENRES_FK1" FOREIGN KEY ("GENRE")
	  REFERENCES "MAXUX_CC1"."GENRES" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CC1"."MOVIE_GENRES" ADD CONSTRAINT "MOVIE_GENRES_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_PLAY
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_ARTISTS_FK1" FOREIGN KEY ("ARTIST")
	  REFERENCES "MAXUX_CC1"."ARTISTS" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CC1"."MOVIE_PLAY" ADD CONSTRAINT "MOVIE_PLAY_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."MOVIES" ADD CONSTRAINT "MOVIES_CERTIFICATION_FK1" FOREIGN KEY ("CERTIFICATION")
	  REFERENCES "MAXUX_CC1"."CERTIFICATION" ("CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTION_COMPANIES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_COMP_FK1" FOREIGN KEY ("COMPANY")
	  REFERENCES "MAXUX_CC1"."COMPANIES" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CC1"."PRODUCTION_COMPANIES" ADD CONSTRAINT "PRODUCTION_COMPANIES_MOVI_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROJECTION
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PROJECTION" ADD CONSTRAINT "PROJECTION_COPIES_FK1" FOREIGN KEY ("COPY", "MOVIE")
	  REFERENCES "MAXUX_CC1"."COPIES" ("NUM_COPY", "MOVIE") ENABLE;
  ALTER TABLE "MAXUX_CC1"."PROJECTION" ADD CONSTRAINT "PROJECTION_ROOM_FK1" FOREIGN KEY ("ROOM")
	  REFERENCES "MAXUX_CC1"."ROOM" ("ID") ENABLE;
  ALTER TABLE "MAXUX_CC1"."PROJECTION" ADD CONSTRAINT "PROJECTION_TIME_SLOT_FK1" FOREIGN KEY ("TIME_SLOT")
	  REFERENCES "MAXUX_CC1"."TIME_SLOT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROJECTION_ARCHIVES
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."PROJECTION_ARCHIVES" ADD CONSTRAINT "PROJECTION_ARCHIVES_MOVIE_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPOKEN_LANG
--------------------------------------------------------

  ALTER TABLE "MAXUX_CC1"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_LANGUAGES_FK1" FOREIGN KEY ("LANGUAGES")
	  REFERENCES "MAXUX_CC1"."LANGUAGES" ("CODE") ENABLE;
  ALTER TABLE "MAXUX_CC1"."SPOKEN_LANG" ADD CONSTRAINT "SPOKEN_LANG_MOVIES_FK1" FOREIGN KEY ("MOVIE")
	  REFERENCES "MAXUX_CC1"."MOVIES" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGS_AUTO_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CC1"."LOGS_AUTO_ID" BEFORE INSERT ON LOGS
FOR EACH ROW
BEGIN
  SELECT LOGS_ID.nextval INTO :new.id FROM DUAL;
END;
/
ALTER TRIGGER "MAXUX_CC1"."LOGS_AUTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RETOURCOPIES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MAXUX_CC1"."RETOURCOPIES" 
AFTER UPDATE OF NB_COPIES ON MOVIES 
BEGIN
  SGBDCC.RetourCopiesRun;
END;
/
ALTER TRIGGER "MAXUX_CC1"."RETOURCOPIES" ENABLE;
--------------------------------------------------------
--  DDL for Package SGBDCC
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MAXUX_CC1"."SGBDCC" AS 

  TYPE RecordSearch IS RECORD (
    popularity_type NUMBER        := NULL,
    popularity_value VARCHAR(128) := 0,
    perenity_type NUMBER          := NULL,
    perenity_value VARCHAR(128)   := 0,
    title VARCHAR(512)            := NULL
  );
  
  TYPE TableSearch IS TABLE OF RecordSearch 
  INDEX BY BINARY_INTEGER;
  
  PROCEDURE Logger(v_errcode NUMBER, v_message VARCHAR2);
  PROCEDURE ProgFilms;
  
  PROCEDURE Search(v_movie RecordSearch, o_movie OUT SYS_REFCURSOR);
  PROCEDURE MovieInfo(mid NUMBER, o_movie OUT SYS_REFCURSOR, o_actors OUT SYS_REFCURSOR);
  PROCEDURE MovieInfoProgra(mid NUMBER, page NUMBER, o_progra OUT SYS_REFCURSOR);
  PROCEDURE MovieSearch(o_movie OUT SYS_REFCURSOR);
  
  PROCEDURE CmdPlace(
    v_day DATE,
    v_room INTEGER,
    v_movie INTEGER,
    v_timeslot INTEGER,
    v_seats INTEGER,
    o_errcode OUT NUMBER
  );
  
  PROCEDURE RetourCopiesRun;

END SGBDCC;

/
--------------------------------------------------------
--  DDL for Package Body SGBDCC
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MAXUX_CC1"."SGBDCC" AS

  PROCEDURE Logger(v_errcode NUMBER, v_message VARCHAR2) AS
    pragma autonomous_transaction;
  BEGIN
    INSERT INTO logs(date_log, errcode, message) VALUES (CURRENT_DATE, v_errcode, v_message);
    COMMIT;
  END Logger;
  
  --
  -- ProgFilms part
  --
  PROCEDURE ProgFilms AS
    thecopy COPIES%ROWTYPE;
    l_seed VARCHAR2(100);
    howlong INTEGER;
    i INTEGER;
  BEGIN
    Logger(0, 'Initializing ProgFilms');
    
    -- Randomize
    l_seed := TO_CHAR(SYSTIMESTAMP,'YYYYDDMMHH24MISSFFFF');
    DBMS_RANDOM.seed(val => l_seed);
    
    -- Grabbing rooms and time_slot empty
    FOR missing IN (
      SELECT t.* FROM projection_temp t
      LEFT JOIN projection p ON (
            p.time_slot = t.time_slot
        AND p.room = t.room
        AND TRUNC(p.day) = TRUNC(CURRENT_DATE + 1)
      ) WHERE movie IS NULL
    ) LOOP
      Logger(0, 'Missing: room: ' || missing.room || ', time_slot: ' || missing.time_slot);
      
      -- Grabbing random copy
      SELECT * INTO thecopy FROM (
        SELECT c.* FROM copies c
        LEFT JOIN projection p ON (
              p.copy = c.num_copy
          AND p.movie = c.movie
          AND TRUNC(p.day) = TRUNC(CURRENT_DATE + 1)
          AND p.time_slot = missing.time_slot
          AND p.room != missing.room
        )
        WHERE p.movie IS NULL
        ORDER BY DBMS_RANDOM.value
      ) WHERE rownum < 2;
      
      howlong := ROUND(DBMS_RANDOM.value(1, 21));
      Logger(0, 'Copy selected: movie: ' || thecopy.movie || ', copy: ' || thecopy.num_copy || ', days: ' || howlong);
      
      FOR i IN 1..howlong LOOP
        INSERT INTO projection (movie, copy, time_slot, day, room, remaining_seats) VALUES
         (thecopy.movie, thecopy.num_copy,
          missing.time_slot, TRUNC(CURRENT_DATE + i),
          missing.room,
          (SELECT seats FROM room WHERE id = missing.room)
        );
      END LOOP;
      COMMIT;
      
    END LOOP;
    
    EXCEPTION
      WHEN OTHERS THEN
        Logger(SQLCODE, 'ProgFilms: ' || SQLERRM);
        ROLLBACK;
    
    Logger(0, 'Ending ProgFilms');
  END ProgFilms;
  
  --
  -- RechPlaces subpart
  --
  FUNCTION GetOperator(optype NUMBER) RETURN VARCHAR2 AS
  BEGIN
    IF optype < 0 THEN
      RETURN '<';
    END IF;
    
    IF optype = 0 THEN
      RETURN '=';
    END IF;
    
    IF optype > 0 THEN
      RETURN '>';
    END IF;
  END GetOperator;
  
  FUNCTION StrEsc(inp VARCHAR2) RETURN VARCHAR2 AS
  BEGIN
    RETURN REPLACE(inp, '''', '''''');
  END StrEsc;
  
  --
  -- Process a search on different terms
  --
  PROCEDURE Search(v_movie RecordSearch, o_movie OUT SYS_REFCURSOR) AS
    v_request VARCHAR(3500) := 'SELECT * FROM inbank WHERE 1 = 1';
    v_operator VARCHAR(32);
  BEGIN
      IF v_movie.popularity_type IS NOT NULL THEN
        v_operator := GetOperator(v_movie.popularity_type);
        v_request := v_request || ' AND popularity ' || v_operator || ' ' || v_movie.popularity_value;
      END IF;
      
      IF v_movie.perenity_type IS NOT NULL THEN
        v_operator := GetOperator(v_movie.perenity_type);
        v_request := v_request || ' AND perenity ' || v_operator || ' ' || v_movie.perenity_value;
      END IF;
      
      IF v_movie.title IS NOT NULL THEN
        v_request := v_request || ' AND UPPER(title) LIKE UPPER(''%' || StrEsc(v_movie.title) || '%'')';
      END IF;
      
      OPEN o_movie FOR v_request;
  END Search; 
  
  --
  -- Send a full-information data about a movie
  --
  PROCEDURE MovieInfo(mid NUMBER, o_movie OUT SYS_REFCURSOR, o_actors OUT SYS_REFCURSOR) AS
  BEGIN
    -- Return the whole movie data
    OPEN o_movie FOR
      SELECT m.*, po.popularity, pe.perenity, i.image
      FROM movies m, popularity po, perenity pe, images i
      WHERE m.id = mid
        AND po.movie = m.id
        AND pe.movie = m.id
        AND i.movie = m.id
      ORDER BY popularity DESC, perenity DESC, title ASC;
    
    -- Return the list of the actor
    OPEN o_actors FOR
      SELECT a.* FROM artists a, movie_play p
      WHERE a.id = p.artist
        AND p.movie = mid;
  END MovieInfo;
  
  PROCEDURE MovieInfoProgra(mid NUMBER, page NUMBER, o_progra OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN o_progra FOR
      SELECT * FROM (
        SELECT p.*, r.seats, COUNT(*) OVER (PARTITION BY 1) as total, ROW_NUMBER() OVER (ORDER BY day) rnum FROM projection p, room r
        WHERE movie = mid
          AND r.id = p.room
          AND TRUNC(day) >= TRUNC(CURRENT_DATE)
        ORDER BY day, time_slot
      ) WHERE rnum > ((page - 1) * 7)
          AND rnum <= (page * 7);
  END MovieInfoProgra;
  
  --
  -- Return all the informations in bank (movie summary)
  --
  PROCEDURE MovieSearch(o_movie OUT SYS_REFCURSOR) AS
  BEGIN
    -- Return the whole movie data
    OPEN o_movie FOR SELECT * FROM inbank;
  END MovieSearch;
  
  --
  -- Changing remaining seats value
  --
  PROCEDURE CmdPlace(v_day DATE, v_room INTEGER, v_movie INTEGER, v_timeslot INTEGER, v_seats INTEGER, o_errcode OUT NUMBER) AS
    v_current INTEGER;
  BEGIN
    LOCK TABLE projection IN SHARE MODE;
    
    -- Checking if there is enought place left
    SELECT remaining_seats INTO v_current FROM projection
    WHERE TRUNC(day) = TRUNC(v_day)
      AND room = v_room
      AND movie = v_movie
      AND time_slot = v_timeslot;
      
    IF v_current < v_seats THEN
      o_errcode := -1;
      RETURN;
    END IF;
    
    -- Updating seats
    UPDATE projection SET remaining_seats = remaining_seats - v_seats
    WHERE TRUNC(day) = TRUNC(v_day)
      AND room = v_room
      AND movie = v_movie
      AND time_slot = v_timeslot;
    
    COMMIT;
    
    -- No Error
    o_errcode := 0;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        o_errcode := SQLCODE;
        
  END;
  
  --
  -- Called from a TRIGGER, do not commit/rollback
  --
  PROCEDURE RetourCopiesRun AS
    v_archive projection_archives%rowtype;
  BEGIN
    Logger(0, 'RetourCopie fired');
    
    -- Grabbing movies which is not programmed anymore
    FOR missing IN (
      SELECT DISTINCT movie FROM projection
      WHERE TRUNC(day) <= TRUNC(CURRENT_DATE)
        AND movie NOT IN (
          SELECT movie FROM projection
          WHERE TRUNC(day) > TRUNC(CURRENT_DATE)
      )
    ) LOOP
      BEGIN
      Logger(0, 'RetourCopie: handling movie ' || missing.movie);
      
      -- Checking if exists
      SELECT * INTO v_archive FROM projection_archives WHERE movie = missing.movie;
      
      -- Updating current row
      UPDATE projection_archives SET
        total_days = (SELECT perenity FROM perenity_current WHERE movie = missing.movie),
        total_seats = (SELECT popularity FROM popularity_current WHERE movie = missing.movie)
      WHERE movie = missing.movie;
      
      EXCEPTION
        -- Not exists, creating new
        WHEN NO_DATA_FOUND THEN
          INSERT INTO projection_archives (movie, total_days, total_seats) VALUES (
            missing.movie,
            (SELECT perenity FROM perenity_current WHERE movie = missing.movie),
            (SELECT popularity FROM popularity_current WHERE movie = missing.movie)
          );
          
        WHEN OTHERS THEN
          ROLLBACK;
          Logger(SQLCODE, 'RetourCopie: ' || SQLERRM);
          
        END; -- END BEGIN
        
        -- And finally moving copies, like CB and removing local copies
        INSERT INTO copies@link_cb (num_copy, movie) 
          SELECT * FROM copies WHERE movie = missing.movie;
        
        DELETE FROM projection WHERE movie = missing.movie;
        DELETE FROM copies WHERE movie = missing.movie;
        
        -- Refreshing nb_copies
        UPDATE movies SET nb_copies = 0 WHERE id = missing.movie;
    END LOOP;
    
    EXCEPTION
      WHEN OTHERS THEN
         Logger(SQLCODE, 'RetourCopie: ' || SQLERRM);
    
  END RetourCopiesRun;
  
END SGBDCC;

/
