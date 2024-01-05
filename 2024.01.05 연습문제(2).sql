use `shop`;

#실습 1-2
create table `Customer`(
`custid` varchar(10) primary key not null,
`name` varchar(10) null,
`hp` varchar(13) unique default null,
`addr` varchar(100) default null,
`rdate` date not null
);

create table `Product`(
`prodNo` int primary key not null,
`prodName` varchar(10) not null,
`stock` int not null default 0,
`price` int default null,
`company` varchar(10) not null
);

create table `Order`(
`orderNo` int primary key not null auto_increment,
`orderid` varchar(10) not null,
`orderProduct` int not null,
`orderCount` int not null,
`orderDate` datetime not null
);

#실습 1-3
insert into `Customer` (`custid`,`name`,`hp`,`addr`,`rdate`) values 
('c101','김유신',	'010-1234-1001','김해시 봉황동','2022-01-01'),
('c102','김춘추',	'010-1234-1002','경주시 보문동','2022-01-01'),
('c103','장보고',	'010-1234-1003','완도군 청산면','2022-01-01'),
('c104','강감찬',	'010-1234-1004','서울시 마포구','2022-01-01'),
('c105','이성계',	null,null,'2022-01-01'),
('c106','정철',	'010-1234-1006','경기도 용인시','2022-01-01'),
('c107','허준',	null,null,'2022-01-01'),
('c108','이순신',	'010-1234-1008','서울시 영등포구','2022-01-01'),
('c109','송상현',	'010-1234-1009','부산시 동래구','2022-01-01'),
('c110','정약용',	'010-1234-1010','경기도 광주시','2022-01-01');

insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values
(1, '새우깡', '5000', '1500', '농심'),
(2, '초코파이', '2500', '2500', '오리온'),
(3,'포카칩', '3600', '1700', '오리온'),
(4, '양파링', '1250', '1800', '농심'),
(5, '죠리퐁', '2200', null, '크라운'),
(6, '마카렛트', '3500', '3500', '롯데'),
(7, '뿌셔뿌셔', '1650', '1200', '오뚜기');

insert into `Order` (`orderid`, `orderProduct`, `orderCount`, `orderDate`) values
('c102', '3', '2', '2022-07-01 13:15:10'),
('c101', '4', '1', '2022-07-01 14:16:11'),
('c108', '1', '1', '2022-07-01 17:23:18'),
('c109', '6', '5', '2022-07-01 10:46:36'),
('c102', '2', '1', '2022-07-01 09:15:37'),
('c101', '7', '3', '2022-07-01 12:35:12'),
('c110', '1', '2', '2022-07-01 16:55:36'),
('c104', '2', '4', '2022-07-01 14:23:23'),
('c102', '1', '3', '2022-07-01 21:54:34'),
('c107', '6', '1', '2022-07-01 14:21:03');

#실습 1-4
select * from `Customer`;

#실습 1-5
select `custid`,`name`,`hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct `company` from `product`;

#실습 1-9
select `prodName`, `price` from `Product`;

#실습 1-10
select `prodName`, `price`+500 as '조정단가' from `Product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where`company`='오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderid`='c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderid`='c102'
and `orderCount` >=2 ;

#실습 1-14
select * from `Product` where `price` between 1000 and 2000;
select * from `Product` where `pirce` >= 1000 and `price` <= 2000;

#실습 1-15
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습 1-16
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습 1-17
select * from `Customer` where `hp` is null;

#실습 1-18
select * from `Customer` where `addr` is not null;

#실습 1-19
select * from `Customer` order by `rdate` desc;

#실습 1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` DESC, `orderid` ASC;

#실습 1-21
select AVG(`price`) from `Product`;

#실습 1-22
select SUM(`stock`) as `재고량 합계` from `Product` where `company` ='농심';

#23
select COUNT(*) as `고객수` from `Customer`;

#24
select COUNT(distinct `company`) as `제조업체` from `Product`;

#25
select `orderProduct` as `주문 상품번호`,
sum(`orderCount`) as `총 주문수량`
from `Order` group by `OrderProduct` order by `주문 상품번호`;

#26
select `company` as `제조업체`,
COUNT(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `company`;

#27
select `company` as `제조업체`,
count(*) as `제품수`,
max(`price`) as `최고가`
from `Product`
group by `company` having `제품수` >=2;

#28
select `orderProduct`, `orderId`, SUM(`orderCount`) as `총 주문수량` from `Order`
group by `orderProduct`, `orderId`
order by `orderProduct`;

#실습 1-29 
select a.orderId, b.prodName from `Order` as a join `product` as b on a.`orderProduct`=b.`prodNo`
where `orderId` = 'c102';

#30
select `orderid`, `name`, `prodName`, `orderData` from `Order` as a
join `Customer` as b on a.`orderId` = b.`custId`
join `product` as c on a.`orderPoduct` = c.`prodNo`
WHERE LEFT(`orderDate`, 10) = '2022-07-03';