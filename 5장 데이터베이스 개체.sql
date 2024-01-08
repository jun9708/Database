#날짜 : 2024/01/08
#이름 : 김철학
#내용 : 제5장 데이터베이스 개체
use `studydb`;
##########################
# 인덱스
##########################

#실습 5-1
SHOW INDEX FROM `User1`;
SHOW INDEX FROM `User2`;
SHOW INDEX FROM `User3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` ON `User1` (`uid`);
ANALYZE TABLE `User1`;

#실습 5-3
DROP INDEX `idx_user1_uid` ON `User1`;

##########################
# 뷰
##########################

#실습 5-4
CREATE VIEW `vw_user1` AS (
	SELECT `name`, `hp`, `age` FROM `User1`
);

CREATE VIEW `vw_user4_age_under30` AS (
	SELECT * FROM `User4` WHERE `age` < 30
);

CREATE VIEW `vm_member_with_sales` AS (
	
    select 
		a.`uid` as `직원아이디`,
		b.`name` as `직원이름`,
		b.`pos` as `직급`,
		c.`name` as `부서명`,
		a.`year` as `매출년도`,
		a.`month` as `월`,
		a.`sale` as `매출액`
	from `Sales` as a
    join `Member` as b on a.uid = b.uid
    join `Department` as c on b.dep = c.depNo
);


#실습 5-5
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vm_member_with_sales`;

#실습 5-6
drop view `vm_member_with_sales`;

##########################
# 저장 프로시저
##########################

#실습 5-7
DELIMITER $$
CREATE PROCEDURE proc_test1()	
BEGIN
	SELECT * FROM `Member`;
    SELECT * FROM `Department`;
END $$
DELIMITER ;

CALL proc_test1();

#실습 5-8
DELIMITER $$
CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
BEGIN
	select * from `Member` where `name`=_userName;
END $$
DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
BEGIN
	select * from `Member` where `pos`=_pos AND `dep`=_dep;
END $$
DELIMITER ;

CALL proc_test3('차장', 101);

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
BEGIN
	SELECT count(*) INTO _count FROM `Member` WHERE `pos`=_pos;
END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
select concat('_count : ', @_count);

#실습 5-9
delimiter $$
create procedure proc_test5(IN _name varchar(10))
begin
	DECLARE userId VARCHAR(10);
    
    select `uid` into userId from `Member` where `name`=_name;
    select * from `Sales` where `uid` = userId;
    
end $$
delimiter ;

CALL proc_test5('김유신');

delimiter $$
create procedure proc_test6()
begin
	declare num1 int;
    declare num2 int;
     
	set num1 = 1;
    set num2 = 2;
    
    if (num1 > num2) then
		select 'num1이 num2보다 크다.' as `결과2`;
    else
		select 'num1이 num2보다 작다.' as `결과2`;
    end if;
end $$
delimiter ;

call proc_test6();

delimiter $$
create procedure proc_test7()
begin
	declare sum int;
    declare num int;
    
    set sum = 0;
    set num = 1;
    
    while(num <= 10) do
		set sum = sum + num;
        set num = num + 1;
    end while;
    
    select sum as '1부터 10까지 합계';
end $$	
delimiter ;

call proc_test7();


#실습 5-10
DELIMITER $$

CREATE PROCEDURE proc_test8()
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE price INT;
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
    
    DECLARE salesCursor CURSOR FOR 
		SELECT `sale` FROM `Sales`;
        
    DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET endOfRow = TRUE;
    
    OPEN salesCursor;
    
    cursor_loop: LOOP
        FETCH salesCursor INTO price;
        
        IF endOfRow THEN
            LEAVE cursor_loop;
        END IF;
        
        -- Process the fetched data
        SET total = total + price;
    
    END LOOP;
    
    SELECT total AS '전체 합계';
    
    CLOSE salesCursor;
    
END $$

DELIMITER ;

CALL proc_test8();


##########################
# 저장 함수
##########################

#실습 5-11
DELIMITER $$
CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
BEGIN
	declare total int;	
    select sum(`sale`) into total from `Sales` where `uid`=_userid;        
    return total;
END $$
DELIMITER ;

select func_test1('a101');


delimiter $$
create function func_test2(_sale int) returns double
begin
	declare bonus double;
    
    if( _sale >= 100000 ) then
		set bonus = _sale * 0.1;
    else
		set bonus = _sale * 0.05;
    end if;
	return bonus;
end $$;
delimiter ;

select 
	`uid`, 
    `year`, 
    `month`, 
    `sale`, 
    func_test2(`sale`) as `bonus`
from 
	`Sales`;