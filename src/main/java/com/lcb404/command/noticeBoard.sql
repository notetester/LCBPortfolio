create table noticeBoard(
tno number(10,0) not null,
title varchar2(50) not null,
writer varchar2(50) not null,
content varchar2(300) not null,
regdate date default sysdate,
PRIMARY key(tno)
);

create SEQUENCE tno_seq Increment by 1 start with 1 NOCACHE;