#날짜 : 2024.01.02
#이름 : 김준형
#내용 : 2장 SQL 기초

use `studydb2`;

#실습 2-1
create table `User1`(
	`uid` varchar(10),
	`name` varchar(10),
	`hp` CHAR(13),
	`age` int
    );
    
drop table `User1`;
    
#실습 2-2 데이터 추가
 insert into `user1` values ('A101', '김유신', '010-1234-1111', 25);
 insert into `user1` values ('A102', '김춘추', '010-1234-2222', 23);
 insert into `user1` values ('A103', '장보고', '010-1234-3333', 32);
 insert into `user1` (`uid`, `name`, `age`) values ('A104','강감찬', 45);
 insert into `user1` set `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3 데이터 보기
select * from `user1`;
select * from `user1` where `uid` ='A101';
select * from `user1` where `name`= '김춘추';
select * from `user1` where `age` <30;
select `uid`, `name`, `age` from `User1`;

#실습 2-4 테이블 데이터 수정
update `User1` set `hp`= '010-1234-4444' where `uid`='A104';
update `User1` set `age`= 51 where `uid`='A105';
update `User1` set `hp`= '010-1234-1001', `age`=27 where `uid`='A101';

#실습 2-5 테이블 삭제
delete from `user1` where `uid`='A101';
delete from `user1` where `uid`='A102' and `age`=25;
delete from `user1` where `age`>=30;

#실습 2-6 테이블 수정
alter table `User1` add `gender` tinyint;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1);
alter table `User1` modify `age` tinyint;
alter table `User1` drop `gender`;

#실습 2-7 테이블 복사
create table `User1copy` like `user1`;
insert into `User1Copy` select * from `User1`;

#실습 2-8


#실습 2-9
