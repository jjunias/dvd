USER 테이블
CREATE TABLE dvd_users(
name VARCHAR2(50) not null,
id VARCHAR2(100) primary key,
pwd VARCHAR2(100) not null,
email VARCHAR2(100) not null,
phone NUMBER not null,
addrNum VARCHAR2(200) not null,
addr VARCHAR2(200) not null,
addrDetail VARCHAR2(300) not null,
regdate date);

DVD 테이블
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

DVD 시퀀스
CREATE SEQUENCE Dvd_seq NOCACHE;

dvd_num 값(외래키)
title 제목
content 내용
score 평점

create table dvd_basket(
id varchar2(50) references dvd_users(id) on delete cascade,
num number references dvd(num) on delete cascade);
-- 장바구니 테이블
create table basket(
id varchar2(50) references TestUser(id) on delete cascade,
num number references testProduct(num) on delete cascade);

<!-- 평점 테이블 -->
CREATE TABLE rating(
num NUMBER primary key,
writer REFERENCES dvd_users(id) ON DELETE CASCADE,
score NUMBER(2,1) NOT NULL,
content VARCHAR2(50) NOT NULL,
dvd_num REFERENCES dvd(num) ON DELETE CASCADE,
regdate DATE
);
<!-- DVD 시퀀스 -->
CREATE SEQUENCE dvd_rating_seq NOCACHE;


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

-- Q&A 테이블 테스트 입력
INSERT INTO qna
VALUES(1, 'aaa', 'title', 'content', sysdate, 0, 1);
INSERT INTO qna
VALUES(2, 'bbb', 'title1', 'content1', sysdate, 0, 1);
INSERT INTO qna
VALUES(3, 'admin', 'title3', 'content3', sysdate, 1, 1);
INSERT INTO qna
VALUES(4, 'ccc', 'title2', 'content2', sysdate, 0, 1);
INSERT INTO qna
VALUES(5, 'admin', 'title4', 'content4', sysdate, 2, 1);
INSERT INTO qna
VALUES(6, 'admin', 'title5', 'content5', sysdate, 4, 1);



