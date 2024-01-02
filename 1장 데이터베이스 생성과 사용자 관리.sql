#날짜 : 2024.01.02
#이름 : 김준형
#내용 : 1장 데이터베이스 생성과 사용자 관리

#실습 1-1
create database `StudyDB2`;
drop database `StudyDB2`;

#실습 1-2
create user 'wnsgud1997'@'%' identified by '1234';
grant all privileges on `StudyDB`.* TO 'wnsgud1997'@'%';
flush privileges;

#실습 1-3
alter user 'wnsgud1997'@'%' identified by 'abc1234'
drop user 'wnsgud1997'@'%';
flush privileges;