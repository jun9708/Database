create table `User1`(
	`user_uid` varchar(10),
	`user_name` varchar(10),
	`user_hp` CHAR(13),
	`user_age` int,
    `user_addr` varchar(13)
    );
    
insert into `User1` values ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
insert into `User1` values ('p102', '김춘추', '010-1234-1002', 25, '경남 경주시');
insert into `User1` set `user_uid`='A103', `user_name`='장보고', `user_age`=31, `user_addr`='전남 완도군';
insert into `User1` set `user_uid`='A104', `user_name`='강감찬', `user_addr`='서울시 중구';
insert into `User1` set `user_uid`='A105', `user_name`='이순신', `user_hp`='010-1234-1005',`user_age`=50;

CREATE TABLE `Tb1Product` (
  `prod_no` varchar(10),
  `prod_name` varchar(10),
  `produser1tb1product_price` CHAR(13),
  `prod_stock` int,
  `prod_company` varchar(13),
  `prod_data` date
);

insert into `Tb1Product` values ('1001', '냉장고', '800,000', 25, 'LG전자', '2022-01-06');
insert into `Tb1Product` values ('1002', '노트북', '1,200,000', 120, '삼성전자', '2022-01-07');
insert into `Tb1Product` values ('1003', '모니터', '350,000', 35, 'LG전자', '2023-01-13');
insert into `Tb1Product` values ('1004', '세탁기', '1,000,000', 80, '삼성전자', '2021-01-01');
insert into `Tb1Product` values ('1005', '컴퓨터', '1,500,000', 20, '삼성전자', '2023-01-01');
insert into `Tb1Product` set `prod_no`='A1006', `prod_name`='노트북', `proc_price`='950,000',`prod_stock`=102;

ALTER TABLE `Tb1Product` change column proc_price prod_price CHAR(13);