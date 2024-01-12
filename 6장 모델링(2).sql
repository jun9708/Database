#날짜 : 2024/01/12
#이름 : 김준형
#내용 : Shop 모델링 실습

# 실습 6-2
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
insert into `Customer` values ('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, 1800, '농심');
insert into `Product` values (5, '죠리퐁', 2200, null, '크라운');

insert into `Order` set `orderId`='c102', `orderProduct`=3, `orderCount`=2, `orderDate`=NOW();
insert into `Order` set `orderId`='c101', `orderProduct`=4, `orderCount`=1, `orderDate`=NOW();
insert into `Order` set `orderId`='c102', `orderProduct`=1, `orderCount`=1, `orderDate`=NOW();
insert into `Order` set `orderId`='c105', `orderProduct`=2, `orderCount`=1, `orderDate`=NOW();
insert into `Order` set `orderNo`=11, `orderId`='c103', `orderProduct`=8, `orderCount`=5, `orderDate`=NOW();

#실습 6-3
select 	
    `orderNo`,
    `name`,
    `prodName`,
    `orderCount`,
    `orderDate`    
 from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo;

select 	
    `orderNo`,
    `prodNo`,        
    `prodName`,
    `price`,
    `orderCount`,
    `orderDate`    
 from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where `name`='김유신';


select 
	SUM(`price` * `orderCount`)
from `Order` as a
join `Product` as b on a.orderProduct = b.prodNo;