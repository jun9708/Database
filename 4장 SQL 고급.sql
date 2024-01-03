#날짜 : 2024.01.03
#이름 : 김준형
#내용 : 4장 SQL 고급

create database `Test`;
use `Test`;

#실습 4-1
create table `Member`(
`uid` varchar(10) primary key not null,
`name`	varchar(10) not null,
`hp` varchar(13) unique not null,
`pos` varchar(10) not null default '사원',
`dep` int default NULL,
`rdate` datetime
);

create table `Department`(
`depNo` int primary key not null,
`name` varchar(10) not null,
`tel` varchar(12) not null
);

create table `Sales` (
`seq` int primary key auto_increment,
`uid` varchar(10) not null,
`year` year not null,
`month` int not null,
`sale` int not null
);

#실습 4-2
insert into `Member` values ('A101','박혁거세','010-1234-1001','부장','101','2020-11-19 11:39:48');
insert into `Member` values ('A102','김유신','010-1234-1002','차장','101','2020-11-19 11:39:48');
insert into `Member` values ('A103','김춘추','010-1234-1003','사원','101','2020-11-19 11:39:48');
insert into `Member` values ('A104','장보고','010-1234-1004','대리','101','2020-11-19 11:39:48');
insert into `Member` values ('A105','강감찬','010-1234-1005','과장','101','2020-11-19 11:39:48');
insert into `Member` values ('A106','이성계','010-1234-1006','차장','101','2020-11-19 11:39:48');
insert into `Member` values ('A107','정철','010-1234-1007','차장','101','2020-11-19 11:39:48');
insert into `Member` values ('A108','이순신','010-1234-1008','부장','101','2020-11-19 11:39:48');
insert into `Member` values ('A109','허균','010-1234-1009','부장','101','2020-11-19 11:39:48');
insert into `Member` values ('A1010','장약용','010-1234-1010','사원','101','2020-11-19 11:39:48');
insert into `Member` values ('A1011','박지원','010-1234-1011','사원','101','2020-11-19 11:39:48');


insert into `Department` (`depNo`,`name`,`tel`) values ('101','영업1부','010-512-1001');
insert into `Department` (`depNo`,`name`,`tel`) values ('102','영업2부','010-512-1002');
insert into `Department` (`depNo`,`name`,`tel`) values ('103','영업3부','010-512-1003');
insert into `Department` (`depNo`,`name`,`tel`) values ('104','영업4부','010-512-1004');
insert into `Department` (`depNo`,`name`,`tel`) values ('105','영업5부','010-512-1005');
insert into `Department` (`depNo`,`name`,`tel`) values ('106','영업6부','010-512-1006');
insert into `Department` (`depNo`,`name`,`tel`) values ('107','영업7부','010-512-1007');


insert into `sales` (`uid`,`year`,`month`,`sale`) values 
 ('a101', 2018, 1, 98100),
 ('a102', 2018, 1, 136000),
 ('a103', 2018, 1, 80100),
 ('a104', 2018, 1, 78000),
 ('a105', 2018, 1, 93000),
 ('a101', 2018, 2, 23500),
 ('a102', 2018, 2, 126000),
 ('a103', 2018, 2, 18500),
 ('a105', 2018, 2, 19000),
 ('a106', 2018, 2, 53000),
 ('a101', 2019, 1, 24000),
 ('a102', 2019, 1, 109000),
 ('a103', 2019, 1, 101000),
 ('a104', 2019, 1, 53500),
 ('a107', 2019, 1, 24000),
 ('a102', 2019, 2, 160000),
 ('a103', 2019, 2, 101000),
 ('a104', 2019, 2, 43000),
 ('a105', 2019, 2, 24000),
 ('a106', 2019, 2, 109000),
 ('a102', 2020, 1, 201000),
 ('a104', 2020, 1, 63000),
 ('a105', 2020, 1, 74000),
 ('a106', 2020, 1, 122000),
 ('a107', 2020, 1, 111000),
 ('a102', 2020, 2, 120000),
 ('a103', 2020, 2, 93000),
 ('a104', 2020, 2, 84000),
 ('a105', 2020, 2, 180000),
 ('a108', 2020, 2, 76000);


insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a101','2018','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a102','2018','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a103','2018','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a104','2018','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a105','2018','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a101','2018','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a102','2018','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a103','2018','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a105','2018','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a116','2019','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a111','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a112','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a113','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a104','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a107','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a102','2019','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a103','2019','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a104','2019','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a105','2019','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a106','2019','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a102','2020','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a104','2020','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a105','2020','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a106','2020','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a107','2020','1','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a102','2020','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a103','2020','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a104','2020','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a105','2020','2','98,100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) values ('a108','2020','2','98,100');

#실습 4-3
#실습 4-4
#실습 4-5
#실습 4-6
#실습 4-7
#실습 4-8
#실습 4-9
#실습 4-10
#실습 4-11
#실습 4-12
#실습 4-13
#실습 4-14
#실습 4-15
#실습 4-16
#실습 4-17