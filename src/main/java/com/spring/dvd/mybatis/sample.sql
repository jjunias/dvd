상품평 DB 설계

dvd_num 값(외래키)
title 제목
content 내용
score 평점

create table basket(
id varchar2(50) references TestUser(id) on delete cascade,
num number references testProduct(num) on delete cascade);