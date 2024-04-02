-- 시스템 계정으로 계정 생성 및 권한부여
--create user camping identified by 1234;
--grant connect, resource, create view to camping;

--테이블 강제삭제
DROP TABLE BOARD_NOTICE CASCADE CONSTRAINTS;
DROP TABLE ATTACH CASCADE CONSTRAINTS;
DROP TABLE BOARD_REVIEW CASCADE CONSTRAINTS;
DROP TABLE RESERVE CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE CAMP CASCADE CONSTRAINTS;
DROP TABLE MEMBER_AUTH CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE BOARD_INQUIRY CASCADE CONSTRAINTS;

--테이블생성 (수정됨)
CREATE TABLE "CAMP" (
	"CAMP_NO"	VARCHAR2(10)		NOT NULL,
	"CAMP_PRICE"	NUMBER(10)		NOT NULL,
	"CAMP_PEAKPRICE"	NUMBER(10)		NOT NULL,
	"CAMP_CATEGORY"	VARCHAR2(20)		NOT NULL,
	"CAMP_SIZE"	VARCHAR2(10)		NULL,
	"CAMP_CAPACITY"	NUMBER(2)	DEFAULT 0	NOT NULL
);

CREATE TABLE "BOARD_REVIEW" (
	"BOARD_NO"	NUMBER(10)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"BOARD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATEDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_HIT"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "MEMBER" (
	"MEM_ID"	VARCHAR2(20)		NOT NULL,
	"MEM_PW"	VARCHAR2(100)		NOT NULL,
	"MEM_NAME"	VARCHAR2(20)		NOT NULL,
	"MEM_EMAIL"	VARCHAR2(30)		NOT NULL,
	"MEM_TEL"	VARCHAR2(20)		NOT NULL,
	"MEM_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEM_ENABLED"	CHAR(1)	DEFAULT 1	NOT NULL
);

CREATE TABLE "RESERVE" (
	"RESERVE_NO"	NUMBER(10)		NOT NULL,
	"RESERVE_STARTDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"RESERVE_ENDDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"RESERVE_PEOPLE"	NUMBER(2)		NOT NULL,
	"RESERVE_PRICE"	NUMBER(10)		NOT NULL,
	"CAMP_NO"	VARCHAR2(10)		NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "MEMBER_AUTH" (
	"MEM_ID"	VARCHAR2(20)		NOT NULL,
	"AUTH"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER(10)		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"REPLY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPLY_UPDATEDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_NO"	NUMBER(10)		NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "ATTACH" (
	"ATTACH_UUID"	VARCHAR2(100)		NOT NULL,
	"ATTACH_PATH"	VARCHAR2(200)		NOT NULL,
	"ATTACH_NAME"	VARCHAR2(100)		NOT NULL,
	"BOARD_NO"	NUMBER(10)		NOT NULL
);

CREATE TABLE "BOARD_NOTICE" (
	"BOARD_NO"	NUMBER(10)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"BOARD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATEDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_HIT"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "BOARD_INQUIRY" (
	"BOARD_NO"	NUMBER(10)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"BOARD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATEDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_HIT"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"MEM_ID"	VARCHAR2(20)		NOT NULL
);

drop table equipment;
drop table order_equip;

-- 장비 테이블
create table equipment (
    equip_no NUMBER(10) not null,       -- 장비 번호
    equip_name varchar2(30) not null ,  -- 장비 이름
    equip_price number(10) not null ,   -- 장비 가격
    equip_quantity number(10) not null ,-- 장비 재고
    equip_class varchar2(10) not null   -- 장비 분류
);

-- 장비 주문 테이블
create table order_equip(
    order_no number(10) not null,           -- 주문 번호
    reserve_no number(10) not null ,        -- 예약 번호
    equip_no NUMBER(10) not null ,          -- 장비 번호
    equip_name varchar2(1000) not null ,    -- 장비 이름
    order_quantity varchar2(100) not null,  -- 주문 수량
    order_price number(10) not null         -- 주문 가격
);

alter table equipment add constraint "pk_equipment" primary key (equip_no); -- 기본키 지정
ALTER TABLE order_equip ADD CONSTRAINT pk_order_equip PRIMARY KEY (order_no, equip_no); -- 기본키를 복합키로 지정

-- 외래키 지정
ALTER TABLE order_equip ADD CONSTRAINT "FK_equipment_TO_order_equip" FOREIGN KEY (equip_no) REFERENCES equipment (equip_no);
ALTER TABLE order_equip ADD CONSTRAINT "FK_reserve_TO_order_equip" FOREIGN KEY (reserve_no) REFERENCES RESERVE (RESERVE_NO);

-- 시퀀스 생성
CREATE SEQUENCE seq_order_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_equip_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 더미 데이터 입력
insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '가스버너', 6000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '랜턴', 10000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '감성 전구', 3000, 5, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '릴선', 6000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '화로대', 15000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '토치', 1000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '선풍기', 8000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '전기장판', 10000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '온풍기', 10000, 10, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '장작', 10000, 50, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '숱', 10000, 50, '장비');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '삼겹살', 2500, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '목살', 2300, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '소시지', 3000, 50, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '버섯세트', 5000, 50, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '쌈채소세트', 3000, 50, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '라면', 1500, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '햇반', 3000, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '소주', 3000, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '맥주', 3000, 100, '음식');

insert into equipment(equip_no, equip_name, equip_price, equip_quantity, equip_class)
values (seq_equip_no.nextval, '음료수', 2000, 100, '음식');

select * from equipment;

Commit ;

ALTER TABLE "CAMP" ADD CONSTRAINT "PK_CAMP" PRIMARY KEY (
	"CAMP_NO"
);

ALTER TABLE "BOARD_REVIEW" ADD CONSTRAINT "PK_BOARD_REVIEW" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEM_ID"
);

ALTER TABLE "RESERVE" ADD CONSTRAINT "PK_RESERVE" PRIMARY KEY (
	"RESERVE_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "ATTACH" ADD CONSTRAINT "PK_ATTACH" PRIMARY KEY (
	"ATTACH_UUID"
);

ALTER TABLE "BOARD_NOTICE" ADD CONSTRAINT "PK_BOARD_NOTICE" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "BOARD_INQUIRY" ADD CONSTRAINT "PK_BOARD_INQUIRY" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "BOARD_REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_REVIEW_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "RESERVE" ADD CONSTRAINT "FK_CAMP_TO_RESERVE_1" FOREIGN KEY (
	"CAMP_NO"
)
REFERENCES "CAMP" (
	"CAMP_NO"
);

ALTER TABLE "RESERVE" ADD CONSTRAINT "FK_MEMBER_TO_RESERVE_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "MEMBER_AUTH" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_AUTH_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_REVIEW_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD_REVIEW" (
	"BOARD_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "ATTACH" ADD CONSTRAINT "FK_BOARD_REVIEW_TO_ATTACH_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD_REVIEW" (
	"BOARD_NO"
);

ALTER TABLE "BOARD_NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_NOTICE_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);

ALTER TABLE "BOARD_INQUIRY" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_INQUIRY_1" FOREIGN KEY (
	"MEM_ID"
)
REFERENCES "MEMBER" (
	"MEM_ID"
);


--추가 코드(시큐리티용)
CREATE TABLE "PERSISTENT_LOGINS" (
   "USERNAME" VARCHAR(64) NOT NULL,
   "SERIES" VARCHAR(64) PRIMARY KEY,
   "TOKEN" VARCHAR(64) NOT NULL,
   "LAST_USED" TIMESTAMP NOT NULL
);

--시퀀스
CREATE SEQUENCE seq_reserve_no
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_camp_no
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_BOARD_NOTICE
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE board_no
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE;

--더미데이터
INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES (seq_camp_no.nextval, 50000, 60000, '텐트', '대', 5);

insert into camping.MEMBER (MEM_ID, MEM_PW, MEM_NAME, MEM_EMAIL, MEM_TEL) VALUES ('admin00', 'pw00', 'admin', 'admin@naver.com', '010-1234-5678');

insert into CAMPING.MEMBER_AUTH (MEM_ID, AUTH) VALUES ('kkw','ROLE_ADMIN');

select * from CAMP;

--추가 테이블
alter table CAMP ADD CAMP_ENABLED NUMBER(1) DEFAULT 0 NOT NULL;

-- CAMP 테이블에 더미 데이터 삽입
INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('A1', 60000, 60000, '캠핑존', '10x10', 8);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('A2', 60000, 60000, '캠핑존', '10x10', 8);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('A3', 35000, 35000, '캠핑존', '8x8', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('B1', 40000, 40000, '캠핑존', '8x10', 6);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('B2', 40000, 40000, '캠핑존', '8x10', 6);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('B3', 40000, 40000, '캠핑존', '8x10', 6);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('B4', 40000, 40000, '캠핑존', '8x10', 6);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('C1', 40000, 40000, '캠핑존', '8x8', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('C2', 40000, 40000, '캠핑존', '8x8', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('C3', 35000, 35000, '캠핑존', '8x8', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('D1', 150000, 300000, '글램핑존', '12x12', 6);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('E1', 120000, 200000, '글램핑존', '10x10', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('E2', 120000, 200000, '글램핑존', '10x10', 4);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('F1', 100000, 100000, '카라반존', '8x6', 2);

INSERT INTO CAMP (CAMP_NO, CAMP_PRICE, CAMP_PEAKPRICE, CAMP_CATEGORY, CAMP_SIZE, CAMP_CAPACITY)
VALUES ('F2', 100000, 100000, '카라반존', '8x6', 2);
