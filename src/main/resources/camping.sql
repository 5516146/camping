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
                        "CAMP_NO"   VARCHAR2(10)      NOT NULL,
                        "CAMP_PRICE"   NUMBER(10)      NOT NULL,
                        "CAMP_PEAKPRICE"   NUMBER(10)      NOT NULL,
                        "CAMP_CATEGORY"   VARCHAR2(20)      NOT NULL,
                        "CAMP_SIZE"   VARCHAR2(10)      NULL,
                        "CAMP_CAPACITY"   NUMBER(2)   DEFAULT 0   NOT NULL
);

CREATE TABLE "BOARD_REVIEW" (
                                "BOARD_NO"   NUMBER(10)      NOT NULL,
                                "BOARD_TITLE"   VARCHAR2(100)      NOT NULL,
                                "BOARD_CONTENT"   VARCHAR2(1000)      NOT NULL,
                                "BOARD_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                "BOARD_UPDATEDATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                "BOARD_HIT"   NUMBER(10)   DEFAULT 0   NOT NULL,
                                "MEM_ID"   VARCHAR2(20)      NOT NULL
);

CREATE TABLE "MEMBER" (
                          "MEM_ID"   VARCHAR2(20)      NOT NULL,
                          "MEM_PW"   VARCHAR2(100)      NOT NULL,
                          "MEM_NAME"   VARCHAR2(20)      NOT NULL,
                          "MEM_EMAIL"   VARCHAR2(30)      NOT NULL,
                          "MEM_TEL"   VARCHAR2(20)      NOT NULL,
                          "MEM_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                          "MEM_ENABLED"   CHAR(1)   DEFAULT 1   NOT NULL
);


CREATE TABLE "RESERVE" (
                           "RESERVE_NO"   NUMBER(10)      NOT NULL,
                           "RESERVE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                           "RESERVE_PEOPLE"   NUMBER(2)      NOT NULL,
                           "RESERVE_PRICE"   NUMBER(10)      NOT NULL,
                           "CAMP_NO"   VARCHAR2(10)      NOT NULL,
                           "MEM_ID"   VARCHAR2(20)      NOT NULL
);

CREATE TABLE "MEMBER_AUTH" (
                               "MEM_ID"   VARCHAR2(20)      NOT NULL,
                               "AUTH"   VARCHAR2(50)      NOT NULL
);

CREATE TABLE "REPLY" (
                         "REPLY_NO"   NUMBER(10)      NOT NULL,
                         "REPLY_CONTENT"   VARCHAR2(1000)      NOT NULL,
                         "REPLY_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                         "REPLY_UPDATEDATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                         "BOARD_NO"   NUMBER(10)      NOT NULL,
                         "MEM_ID"   VARCHAR2(20)      NOT NULL
);

CREATE TABLE "ATTACH" (
                          "ATTACH_UUID"   VARCHAR2(100)      NOT NULL,
                          "ATTACH_PATH"   VARCHAR2(200)      NOT NULL,
                          "ATTACH_NAME"   VARCHAR2(100)      NOT NULL,
                          "BOARD_NO"   NUMBER(10)      NOT NULL
);

CREATE TABLE "BOARD_NOTICE" (
                                "BOARD_NO"   NUMBER(10)      NOT NULL,
                                "BOARD_TITLE"   VARCHAR2(100)      NOT NULL,
                                "BOARD_CONTENT"   VARCHAR2(1000)      NOT NULL,
                                "BOARD_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                "BOARD_UPDATEDATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                "BOARD_HIT"   NUMBER(10)   DEFAULT 0   NOT NULL,
                                "MEM_ID"   VARCHAR2(20)      NOT NULL
);

CREATE TABLE "BOARD_INQUIRY" (
                                 "BOARD_NO"   NUMBER(10)      NOT NULL,
                                 "BOARD_TITLE"   VARCHAR2(100)      NOT NULL,
                                 "BOARD_CONTENT"   VARCHAR2(1000)      NOT NULL,
                                 "BOARD_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                 "BOARD_UPDATEDATE"   DATE   DEFAULT SYSDATE   NOT NULL,
                                 "BOARD_HIT"   NUMBER(10)   DEFAULT 0   NOT NULL,
                                 "MEM_ID"   VARCHAR2(20)      NOT NULL
);

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

insert into MEMBER(MEM_ID, MEM_PW, MEM_NAME, MEM_EMAIL, MEM_TEL) values ("kkw", "1234", "김기원", "kkw@naver.com", "010-1234-1234");

ALTER TABLE reserve ADD RESERVE_ENDDATE DATE DEFAULT SYSDATE NOT NULL;

alter table RESERVE rename column RESERVE_DATE to RESERVE_STARTDATE;
select * from RESERVE;

select * from MEMBER;

