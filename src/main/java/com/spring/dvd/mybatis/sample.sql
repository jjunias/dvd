--USER 테이블
CREATE TABLE dvd_users(
name VARCHAR2(50) not null,
id VARCHAR2(100) primary key,
pwd VARCHAR2(100) not null,
email VARCHAR2(100) not null,
phone VARCHAR2(20) not null,
addrNum VARCHAR2(50) not null,
addr VARCHAR2(100) not null,
addrDetail VARCHAR2(50) not null,
regdate date);

--DVD 테이블
CREATE TABLE dvd(
num NUMBER PRIMARY KEY,
national VARCHAR2(20) not null,
genre VARCHAR2(50) not null,
title VARCHAR2(50) not null,
actor VARCHAR2(100) not null,
content CLOB not null,
production VARCHAR2(50) not null,
price NUMBER not null,
trailer VARCHAR2(100) not null,
grade  NUMBER(2,1),
views NUMBER,
regdate DATE,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER NOT NULL
);

--DVD 시퀀스
CREATE SEQUENCE Dvd_seq NOCACHE;

-- 장바구니 테이블
CREATE TABLE dvd_basket(
basket_id VARCHAR2(50) REFERENCES dvd_users(id) ON DELETE CASCADE,
basket_num NUMBER REFERENCES dvd(num) ON DELETE CASCADE);

-- 평점 테이블
CREATE TABLE rating(
num NUMBER primary key,
writer REFERENCES dvd_users(id) ON DELETE CASCADE,
title VARCHAR2(30) NOT NULL,
score NUMBER(2,1) NOT NULL,
content CLOB NOT NULL,
recommend NUMBER,
dvd_num REFERENCES dvd(num) ON DELETE CASCADE,
regdate DATE
);

<!--평점 추천 테이블 -->
CREATE TABLE rating_recommend(
rating_num NUMBER references rating(num) on delete cascade,
userId VARCHAR2(50) references dvd_users(id) on delete cascade 
);

-- DVD 시퀀스
CREATE SEQUENCE dvd_rating_seq NOCACHE;


-- Q&A 테이블
CREATE TABLE qna(
qna_num NUMBER PRIMARY KEY,
qna_writer VARCHAR2(100) NOT NULL,
qna_title VARCHAR2(50) NOT NULL,
qna_content VARCHAR2(2000) NOT NULL,
qna_answer VARCHAR2(2000),
dvd_num NUMBER REFERENCES dvd(num) ON DELETE CASCADE NOT NULL,
regdate DATE
);

-- Q&A 시퀀스
CREATE SEQUENCE qna_seq NOCACHE;


