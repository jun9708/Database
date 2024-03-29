#날짜 : 2024.01.09
#이름 : 김준형
#내용 : SQL 연습문제2

#2-1
create database `Bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on `Bank`.* to 'bank'@'%';
grant all privileges on `Bank`.* to 'wnsgud1997'@'%';
grant all privileges on `shop`.* to 'wnsgud1997'@'%';
flush privileges;

create table `bank_customer`(
`c_no` varchar(14) primary key not null,
`c_name` varchar(20) not null,
`c_dist` int not null default 0, 
`c_phone` varchar(20) unique not null,
`c_addr` varchar(100) default null
);

create table `bank_account`(
`a_no` varchar(11) not null primary key,
`a_item_dist` varchar(2) not null,
`a_item_name` varchar(20) not null,
`a_c_no` varchar(14) not null,
`a_balance` int not null default 0,
`a_open_date` date not null
);

create table `bank_transaction`(
`t_no` int not null auto_increment primary key,
`t_a_no` varchar(11) not null,
`t_dist` int not null,
`t_amount` int not null,
`t_datetime` datetime not null
);

insert into `bank_customer` values
('101-22-51094', '부산의원', 2, '051-518-1010', '부산시남구'),
('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `bank_account` values
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21'),
('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17'),
('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
('101-11-2003', 'S1', '자유저축예금', '101-22-51094', 8325010, '2010-06-07'),
('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13'),
('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15'),
('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values
('101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
('101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
('101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
('101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
('101-11-1001', 3, 0, '2022-08-21 04:26:52'),
('101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
('101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
('101-11-2002', 2, 32000, '2022-08-21 04:26:52'),
('101-11-2003', 3, 0, '2022-08-21 04:26:52'),
('101-11-1003', 1, 75000, '2022-08-21 04:26:52');

select * from `bank_account`;
select * from `bank_customer`;
select * from `bank_transaction`;

#실습 2-7 (고객의 이름과, 계좌번호를 조회하시오)
SELECT `c_name`, `c_no` from `bank_customer`;

#실습 2-8 (모든 계좌의 구분번호와 계좌상품 이름 조회하시오)
SELECT `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-9 (모든 계좌의 구분번호와 계좌상품 이름 조회하시오. 단, 중복을 제거하시오)
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-10 (자유저축예금 계좌 중 잔고액이 100만원 이상을 조회하시오)
select * from `bank_account` where `a_balance` > 1000000 and `a_item_name` = '자유저축예금';

#실습 2-11 (경기도에 거주하는 고객을 조회하시오)
select * from `bank_customer` where `c_addr` like '경기도%';

#실습 2-12 (기업고객을 조회하시오)
select * from `bank_customer` where `c_dist` = 2;

 #실습 2-13 (거래내역 중 입금만 조회하십시오)
 select * from `bank_transaction` where `t_dist` = 1;
 
 #실습 2-14 (출금액이 가장 큰 순서로 조회하십시오)
 select * from `bank_transaction` where `t_dist`='2' order by `t_amount` desc;
 
 #실습 2-15 (입금액의 총합과 평균을 구하시오)
 select sum(t_amount) '입금총합', avg(`t_amount`/`t_no`) '입금평군'
 from `bank_transaction` where `t_dist`=1;
 
 #실습 2-16 (출금액의 가장 큰 금액과 가장 작은 금액을 구하시오)
 select max(t_amount) '큰 금액', min(t_amount) '작은 금액'
 from `bank_transaction`
 where `t_dist` = 2;
 
 #실습 2-17 (자유저축 예금계좌에서 큰 잔고액 순으로 조회하시오)
 select * from `bank_account` where `a_item_dist` = 'S1' order by `a_balance` desc;
 
 #실습 2-18 (가장 많은 잔고를 보유한 자유저축 예금계좌를 조회하시오)
 select * from `bank_account` where `a_item_dist` = 'S1' order by `a_balance` desc limit 1;
 
 #다른방법
 select * from `bank_account`
 where `a_balance` =(select max(`a_balance`) from `bank_account` where `a_item_dist` = 'S1');
 
#실습 2-19 (거래내역에서 입금액과 출금액이 각각 큰 순서로 조회하시오)
select * from `bank_transaction` where `t_dist` in (1,2) order by `t_dist`, `t_amount` desc;
select * from `bank_transaction` where `t_dist` <> 3 order by `t_dist`, `t_amount` desc;

#실습 2-20 (거래내역에서 입금 건수, 출금 건수, 조회 건수를 조회하시오)
SELECT
    COUNT(CASE WHEN `t_dist` = 1 THEN 1 END) as '입금 건수',
    COUNT(CASE WHEN `t_dist` = 2 THEN 1 END) as '출금 건수',
    COUNT(CASE WHEN `t_dist` = 3 THEN 1 END) as '조회 건수'
FROM `bank_transaction`;

#또다른 방법
select
	count(if(`t_dist` = 1, 1, null)) as '입금 건수', 
	count(if(`t_dist` = 2, 1, null)) as '출금 건수',
	count(if(`t_dist` = 3, 1, null)) as '조회 건수'
from `bank_transaction`;

#실습 2-21 (거래내역에서 거래 구분번호를 통해 type을 아래와 같이 조회하시오)
select
	`t_dist`,
    case
		when (`t_dist` = 1) then '입금' 
		when (`t_dist` = 2) then '출금' 
		when (`t_dist` = 3) then '조회' 
	end as `type`,
    `t_a_no`, `t_amount`
    from `bank_transaction`;
    
#실습 2-22  (각 거래별 카운트를 조회하시오)
select `t_dist`, count(`t_no`)
from `bank_transaction`
group by `t_dist`;

#실습 2-23 (입금 거래만 계좌별로 합계를 조회하시오)
select `t_a_no`, `t_dist`, sum(`t_amouint`)
from `bank_transaction`
where `t_dist` = '1'
group by `t_a_no`;

#실습 2-24 (입금 거래만 계좌별로 합계 구하고 10만원 이상만 큰 순서로 조회하시오)
SELECT 
	`t_a_no`, 
	`t_dist`, 
	SUM(`t_amount`) AS `합계`
	FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`
having `합계` >= 100000
ORDER BY `합계` desc;


#실습 2-25 (계좌 테이블과 고객 테이블 결합 하시오)
SELECT * FROM `bank_account` AS a 
join `bank_customer` as b
on a.a_c_no = b.c_no;


#실습 2-26 
SELECT 
	`a_no` 			as `계좌번호`, 
	`a_item_name` 	as `계좌이름`,
	`c_no` 			as `주민번호(사업자번호)`,
	`c_name`  		as `고객명`,
	`a_balance` 	as `현재잔액`
FROM `bank_account` AS a 
JOIN `bank_customer` AS b
on a.a_c_no = b.c_no;

#실습 2-27 (거레 테이블과 계좌 테이블을 결합 하시오)
SELECT * FROM `bank_transaction` AS a
JOIN `bank_account` AS b
ON a.t_a_no = b.a_no;


#실습 2-28 
SELECT 
	`t_no` AS `거래번호`,
	`t_a_no` AS `계좌번호`,
	`a_c_no` AS `고객번호(주민번호)`,
	`t_dist` AS `거래구분`,
	`t_amount` AS `거래금액`,
	`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS b
ON a.a_no = b.t_a_no;


#실습 2-29 (거래 구분이 입금이고 큰 거래금액 순으로 아래와 같이 데이터가 조회되도록 하시오)
SELECT 
	`t_no`,
	`a_no`,
	`c_no`,
	`t_dist`,
	`a_item_name`,
	`c_name`,
	`t_amount`,
	`t_datetime`
FROM `bank_transaction` AS a
JOIN `bank_account`  as b ON a.t_a_no = b.a_no
JOIN `bank_customer` as c ON b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` DESC;



#실습 2-30 (거래 구분이 입금, 출금이고 개인 고객을 대상으로 거래건수를 아래와 같이 조회하시오 단, 거래구분은 작은 순서로 거래건수는 큰순서로 정렬하시오)
SELECT 
	ANY_VALUE(`t_no`),
	ANY_VALUE(`a_no`),
	`c_no`,
	ANY_VALUE(`t_dist`) AS `구분`,
	ANY_VALUE(`a_item_name`),
	ANY_VALUE(`c_name`),
	COUNT(`t_no`) AS `거래건수`
FROM `bank_transaction` AS a
JOIN `bank_account`  as b ON a.t_a_no = b.a_no
JOIN `bank_customer` as c ON b.a_c_no = c.c_no
WHERE `t_dist` IN(1, 2) AND `c_dist` = 1
group by `c_no`
ORDER BY `구분`, `거래건수` DESC;