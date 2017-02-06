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

dvd_num 값(외래키)
title 제목
content 내용
score 평점

-- 장바구니 테이블
create table basket(
id varchar2(50) references TestUser(id) on delete cascade,
num number references testProduct(num) on delete cascade);

-- Q&A 테이블
CREATE TABLE qna(
qna_num NUMBER PRIMARY KEY,
qna_writer VARCHAR2(100) NOT NULL,
qna_title VARCHAR2(50) NOT NULL,
qna_content VARCHAR2(2000) NOT NULL,
regdate DATE,
qna_ref_num NUMBER NOT NULL,
dvd_num NUMBER REFERENCES dvd(num) ON DELETE CASCADE
);

-- Q&A 시퀀스
CREATE SEQUENCE qna_seq NOCACHE;






