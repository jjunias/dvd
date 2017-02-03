USER 테이블
CREATE TABLE dvd_users(
name VARCHAR2(50) not null,
id VARCHAR2(100) primary key,
pwd VARCHAR2(100) not null,
email VARCHAR2(100) not null,
phone NUMBER(50) not null,
addrNum VARCHAR2(200) not null,
addr VARCHAR2(200) not null,
addrDetail VARCHAR2(300) not null,
regdate date);

DVD 테이블
CREATE TABLE dvd(
num NUMBER PRIMARY KEY,
genre VARCHAR2(50) not null,
title VARCHAR2(50) not null,
actor VARCHAR2(100) not null,
content CLOB not null,
production VARCHAR2(50) not null,
price NUMBER not null,
grade  NUMBER(2,1),
views NUMBER,
regdate DATE,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER NOT NULL
);

DVD 시퀀스
CREATE SEQUENCE Dvd_seq NOCACHE;