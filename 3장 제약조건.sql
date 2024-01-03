	#날짜 : 2024.02.03
    #이름 : 김준형
    #내용 : 3장 제약조건
    
#실습 : 3-1
CREATE TABLE `user2` (
`uid` VARCHAR(10) primary key,
`name` VARCHAR(10),
`birth` CHAR(10),
`addr` VARCHAR(50)
);

drop table `user2`;

insert into `user2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `user2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `user2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `user2` values ('A105', '강감찬', '1979-08-16', '서울시 관악구');
insert into `user2` values ('A106', '이순신', '1981-05-23', '부산시 진구');

#실습 : 3-2
CREATE TABLE `user3` (
`uid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`hp` char(13) unique,
`addr` varchar(50)
);


insert into `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
insert into `user3` values ('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
insert into `user3` values ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도시');
insert into `user3` values ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
insert into `user3` values ('A105', '이순신', '1981-05-23', '010-1234-2222', '부산시 진구');
insert into `user3` values ('A106', '안중근', '1981-08-23', 'null', '부산시 진구');

#실습 : 3-3
create table `Parent` (
`pid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`addr` varchar(100)
);

create table `Child` (
`cid` varchar(10) primary key,
`name` varchar(10),
`hp` char(13) unique ,
`parent` varchar(10),
foreign key (`parent`) references `Parent`(`pid`)
);

insert into `Parent` values ('P101','김유신','1968-05-09','경남 김해시');
insert into `Parent` values ('P102','김춘추','1972-11-23','경남 경주시');
insert into `Parent` values ('P103','장보고','1978-03-01','전남 완도시');
insert into `Parent` values ('P104','강감찬','1979-08-16','서울시 관악구');
insert into `Parent` values ('P105','이순신','1981-05-23','부산시 진구');

insert into `Child` values ('C101','김철수','010-1234-1001','P101');
insert into `Child` values ('C102','김영희','010-1234-1002','P101');
insert into `Child` values ('C103','강철수','010-1234-1003','P103');
insert into `Child` values ('C104','이철수','010-1234-1004','P107');

#실습 : 3-4
 create table `User4` (
 `uid` varchar(10) primary key,
 `name` varchar(10) not null,
 `gender` char(1),
 `age` int default 1,
 `hp` char(13) unique,
 `addr` varchar(20)
 );
    
insert into `User4` values ('A101','김유신','M','25','010-1234-1111','경남 김해시');
insert into `User4` values ('A102','김춘추','M','23','010-1234-2222','경남 경주시');
insert into `User4` values ('A103','장보고','M','35','010-1234-3333','전남 완도시');
insert into `User4` values ('A104','강감찬','M','42','010-1234-4444','서울시 관악구');
insert into `User4` (`uid`, `name`, `gender`, `hp`, `addr`) values ('A105','이순신','M','010-1234-5555','부산시 진구');
insert into `User4` values ('A106','신사임당','F','32',null,'강릉시');
insert into `User4` values ('A107','허난설현','F','27',NULL,'경기도 광주시');
    
    
#실습 : 3-5
create table `User5` (
`seq` int primary key auto_increment,
`name` varchar(10) not null,
`gender` char(1) check (`gender` in ('M', 'F')),
`age` int default 1 check (`age` > 0 and `age` < 100),
`addr` varchar(20)
);

insert into `User5` (`name`,`gender`,`age`,`addr`)values ('김유신','M','25','경남 김해시');
insert into `User5` (`name`,`gender`,`age`,`addr`)values ('김춘추','M','23','경남 경주시;');
insert into `User5` (`name`,`gender`,`age`,`addr`)values ('장보고','M','35','전남 완도시');
insert into `User5` (`name`,`gender`,`age`,`addr`)values ('강감찬','M','42','서울시 관악구');
insert into `User5` (`name`,`gender`,`age`,`addr`)values ('이순신','M','51','부산시');
insert into `User5` (`name`,`gender`,`age`,`addr`)values ('신사임당','F','28','강릉시');
