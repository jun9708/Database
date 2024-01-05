#날짜 : 2024.01.05
#이름 : 김준형
#내용 : SQL 연습문제1

#실습 1 - 1
create database `Shop`;
create user `shop`@`%` identified by '1234';
grant all privileges on Shop.*to `shop`@`%`;
flush privileges;