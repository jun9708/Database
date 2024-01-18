# 날짜 : 2024.01.18
# 이름 : 김준형
# 내영 : 8장 트랜잭션과 병행 제어

#실습 8-1
-- 트랜잭션 시작
start transaction;

select * from `bank_account`;

update `bank_account` 
	set `a_balance` = `a_balance` - 10000
	where `a_no`  = '101-11-1001';

update `bank_account`
	set `a_balance` = `a_balance` + 10000
    where `a_no` = '101-11-1003';

-- 트랜잭션 작업 
commit;

#실습 8-2

start transaction;

update `bank_account` 
	set `a_balance` = `a_balance` - 10000
	where `a_no`  = '101-11-1001';

update `bank_account`
	set `a_balance` = `a_balance` + 10000
    where `a_no` = '101-11-1003';

-- 트랜잭션 작업 종료
rollback;

select * from `bank_account`;

#실습 8-3
select @@autocommit;

update `bank_account` 
	set `a_balance` = `a_balance` - 10000
	where `a_no`  = '101-11-1001';

#실습 8-4 Lock & Unlock 	병행제어 실습 by root
select * from `bank_account` where `a_no` = '101-11-1001';

start transaction;

update `bank_account`
	set `a_balance` = `a_balance`  - 10000
	where `a_no` = '101-11-1001';
    
commit;
