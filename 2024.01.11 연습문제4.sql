#	날짜 : 2024.01.11
#	이름 : 김준형
# 	내용 : SQL연슴문제4

#실습 4-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore';
grant all privileges on `BookStore`.* to 'wnsgud1997';
flush privileges;

use `bookstore`;

create table `Customer` (
`custId` int not null auto_increment primary key,
`name` varchar(10) not null,
`address` varchar(20) default null,
`phone` varchar(13) default null
);

create table `Book` (
`bookId` int not null primary key,
`bookName` varchar(20) not null,
`publisher` varchar(20) not null,
`price` int default null
);

create table `Order` (
`orderId` int not null auto_increment primary key,
`custId` int not null,
`bookId` int not null,
`salePrice` int not null,
`orderDate` date not null
);

insert into `Customer` (`name`, `address`, `phone`) values
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001'),
('박세리', '대한민국 대전', null);

insert into `Book` (`bookId`,`bookname`, `publisher`, `price`) values
(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구아는 여자', '나무수', 13000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별기술', '굿스포츠', 6000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '삼성당', 7500),
(10, 'Olympic Chalmpions', 'Pearson', 13000);

insert into `Order` (`custId`, `bookId`,`salePrice`, `orderDate`) values
(1, 1, 6000, '2014-07-01'), 
(1, 3, 21000, '2014-07-03'), 
(2, 5, 8000, '2014-07-03'), 
(3, 6, 6000, '2014-07-04'), 
(4, 7, 20000, '2014-07-05'), 
(1, 2, 12000, '2014-07-07'), 
(4, 8, 13000, '2014-07-07'), 
(3, 10, 12000, '2014-07-08'), 
(2, 10, 7000, '2014-07-09'), 
(3, 8, 13000, '2014-07-10');

#실습 4-4
select * from `Customer`;

#실습 4-5
select `bookname`, `price` from `Book`;

#실습 4-6
select `price`, `bookname` from `book`;

#실습 4-7
select `bookId`, `bookname`, `publisher`, `price` from `book`;

#실습 4-8
select `publisher` from `book`;

#실습 4-9
select distinct `publisher` from `book`;

#실습 4-10
select * from `book` where price >= '20000';

#실습 4-11
select * from `book` where `price` < '20000';

#실습 4-12
select * from `book` where `price` <= 20000 and `price` >= 10000;
select * from `book` where `price` between 10000 and 20000;

#실습 4-13
select `bookId`, `bookname`, `price` from `book` where `price` >= 15000 and `price` <= 30000;
select `bookId`, `bookname`, `price` from `book` where `price` between  15000 and 30000;

#실습 4-14
select * from `book` where `bookId` = 2 or
						   `bookId` = 3 or 
					       `bookId` = 5;
                           
#실습 4-15
select * from `book` where mod(`bookId`,2) = 0;
select * from `book` where `bookId` % 2 = 0;

#실습 4-16
select * from `Customer` where `name` like '박%';

#실습 4-17
select * from `Customer` where `address` like '대한민국%';

#실습 4-18
select * from `Customer` where `phone` is not Null;

#실습 4-19
select * from `book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';

#실습 4-20
select `publisher` from `book` where `bookname` = '축구의 역사';

#실습 4-21
select `publisher` from `book` where `bookname` like '%축구%';

#실습 4-22
select * from `book` where `bookname` like '_구%';

#실습 4-23
select * from `book` where `bookname` like '%축구%' and `price` >= 20000;

#실습 4-24
select * from `book` order by `bookname` asc;

#실습 4-25
select * from `book` order by `price` asc, `bookname` asc;

#실습 4-26
select * from `book` order by `price` desc, `bookname` asc; 

#실습 4-27
select * from `book` order by `price` desc limit 3;

#실습 4-28
select * from `book` order by `price` asc limit 3;

#실습 4-29
select sum(`saleprice`) '총판매액' from `Order`;

#실습 4-30  ****
select sum(`saleprice`) as '총판매액',
	   avg(`saleprice`) as '평균값',
       min(`saleprice`) as '최저가',
       max(`saleprice`) as '최고가'
		from `Order`;
        
#실습 4-31
select count(`custId`) as '판매건수' from `Order`;
select count(1) as '판매건수' from `Order`;

#실습 4-32
update `book` set `bookname` = replace(`bookname`, '야구', '농구')
where `bookname` like '%야구%';
select * from `book` where `bookname` like '%농구%';

select `bookid`, replace(`bookname`, '야구', '농구') as `bookname`, `publisher`, `price` from `book`;
select * from `book` where `bookname` like '%농구%';

#실습 4-33 *******
select `custid`,
		count(*)as '수량'
from `order`
where `salePrice` >= 8000
group by `custId` having
'수량' >= 2;

#실습 4-34
select * from `Customer` as a
join `Order` as b on a.`custId` = b.`custID`;

select * from `Customer` join `order` using(`custid`);

select * from `Customer` as a, `order` as b where a.`custid`=b.`custId`;


#실습 4-35
select * from `Customer` as a
join `Order` as b on a.custId = b.custId
order by a.`custid` asc;

#실습 4-36 (고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오)
select `name`, `saleprice`
from `Customer` as a
join `order` as b on a.custid = b.custid
order by a.`custid`;

#4-37 ****
select a.`custID` ,a.`name`,
		sum(b.`saleprice`)
from `Customer` as a
join `order` as b on a.custid = b.custid
group by a.`custId`, a.`name`
order by a.`name`;

#4-38
select `name`,
		`bookname`
from `Customer` as a
join `order` as b on a.custid = b.custid
join `book` as c on b.bookid = c.bookid;

#4-39
select `name`,
		`bookname`
from `Customer` as a
join `order` as b on a.custid = b.custid
join `book` as c on b.bookid = c.bookid
where `price` = 20000;

#4-40 ***********
select  *
from `Customer` as a
left join `order` as b on a.custid = b.custid;



#4-41 *******
select sum(`saleprice`) as '총매출'
from `Customer` as a
join `order` as b on a.custid = b.custid
where `name` = '김연아';

SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');


#4-42
select `bookname` from `book` order by `price` desc limit 1;


#4-43
select `name` from `customer` as a
left join `order` as b on a.custid = b.custid
where `orderid` is null;


#4-44
insert into `book` (`bookid`, `bookname`, `publisher`, `price`) values
(11,'스포츠의학', '한솔의학서적', null);


#4-45
update `Customer` set `address` = '대한민국 부산' where `custid` = '5';
 
#4-46
delete from `customer` where `custid` = '5'; 
