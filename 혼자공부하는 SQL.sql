#날짜 : 2024.01.08
#이름 : 김준형
#내용 : 교재 Ch03 SQL 기본문법

#손코딩 p111
use `market_db`;

#손코딩 p112
select * from `member`;
select * from `market_db.member`;
select * from `member`;

#손코딩 p114
select `mem_name` from `member`;

#손코딩 p115
select addr, debut_date, mem_name from member;

#손코딩 p116
select * from `member` where `mem_name` = '블랙핑크';

#손코딩 p117
select * from `member` where `mem_number` = 4;

#관계연산자, 논리 연산자의 사용
select `mem_id`, `mem_name` from `member` where height <= 162;
select `mem_name`, `height`, `mem_number` from `member` where height >= 165 and `mem_number` > 6;

#손코딩 p118
select `mem_name`, `height`, `mem_number` from `member` where height >= 165 or `mem_number` > 6;

select `mem_name`, `height` from `member` where height >= 163 and height <=165;
select `mem_name`, `height` from `member` where height between 163 and 165;


#손코딩 p119
select `mem_name`, `addr` from `member` where `addr` = '경기' or `addr` = '전남' or `addr` = '경남'; 
select `mem_name`, `addr` from `member` where `addr` in('경기', '전남', '경남');
select * from `member` where `mem_name` like '우%';

#손코딩 p120
select * from `member` where `mem_name` like '__핑크';

#손코딩 p125
select `mem_id`, `mem_name`, `debut_date` from `member` order by `debut_date`;

#손코딩 p126
select `mem_id`, `mem_name`, `debut_date`, `height` from `member` where `height` >= 164 order by `height` desc;

#손코딩 p127
select `mem_id`, `mem_name`, `debut_date`, `height` from `member` where `height` >= 164 order by `height` desc, `debut_date` asc;

#손코딩 p128
select * from member limit 3;
select `mem_name`, `debut_date` from `member` order by `debut_date` limit 3;

#손코딩 p129
select `mem_name`, `height` from `member` order by `height` desc limit 3, 2;
select `addr` from `member`;

#손코딩 p130
select `addr` from `member` order by `addr`;
#중복제거
select distinct `addr` from `member`;

#손코딩 p131
select `mem_id`, `amount` from `buy` order by `mem_id`;

#손코딩 p132
select `mem_id`, sum(amount) from `buy` group by `mem_id`;
select `mem_id` '회원 아이디', sum(amount) '총 구매 개수' from `buy` group by `mem_id`;

#손코딩 p133
#총구매 금액
select `mem_id` '회원 아이디', sum(price*amount) '총 구매 금액' from `buy` group by `mem_id`;

#평균구매 개수
select avg(amount) '평균 구매 개수' from `buy`;

#손코딩 p134
select `mem_id`, avg(amount) '평균 구매 개수' from `buy` group by `mem_id`;
select count(*) from `member`;

select count(phone1) '연락처가 있는 회원' from `member`;

select `mem_id` '회원 아이디', sum(price * amount) '총 구매 금액' from `buy` group by `mem_id`;

#손코딩 p135
select `mem_id` '회원 아이디' , sum(price * amount) '총 구매 금액'
from `buy` group by `mem_id` having sum(price*amount) > 1000;

#손코딩 p136
select `mem_id` '회원 아이디', sum(price*amount) '총 구매 금액'
from `buy`
group by `mem_id` having sum(price*amount) > 1000
order by sum(price*amount) desc;
