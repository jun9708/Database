# 날짜 : 2024.01.10
# 이름 : 김준형
# 내용 : SQL 연습문제3

# 실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `College`.* to 'college'@'%';
grant all privileges on `College`.* to 'wnsgud1997'@'%';
flush privileges;

# 실습 3-2
create table `Student`(
`stdNo` char(8) primary key not null,
`stdName` varchar(20) not null,
`stdHp` char(13) unique not null, 
`stdYear` int not null,
`stdAddress` varchar(100) default null 
);

create table `Lecture`(
`lecNo` int primary key not null,
`lecName` varchar(20) not null,
`lecCredit` int not null, 
`lecTime` int not null,
`lecClass` varchar(10) default null 
);

create table `Register`(
`regStdNo` char(8) not null,
`regLecNo` int not null,
`regMidScore` int default null, 
`regFinalScore` int default null,
`regTotalScore` int default null,
`regGrade` char(1) default null
);


# 실습 3-3
insert into `Student` values
('20201016', '김유신', '010-1234-1001', 3, null),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B04'),
(234, '중급영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터개론', 3, 20, '본3B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

insert into `Register` values
(20201126, 234, null, null, null, null),
(20201016, 248, null, null, null, null),
(20201016, 253, null, null, null, null),
(20201126, 239, null, null, null, null),
(20210216, 349, null, null, null, null),
(20210326, 349, null, null, null, null),
(20201016, 167, null, null, null, null),
(20220416, 349, null, null, null, null);


# 실습 3-4
select * from `Lecture`;

# 실습 3-5
select * from `Student`;

# 실습 3-6
select * from `Register`;

# 실습 3-7
select * from `Student` where `stdYear` = 3;

# 실습 3-8
select * from `Lecture` where `lecCredit` = 2;

# 실습 3-9
update `Register` set `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
update `Register` set `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
update `Register` set `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
update `Register` set `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
update `Register` set `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
update `Register` set `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
update `Register` set `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
update `Register` set  `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;


# 실습 3-10
update `Register` set `regTotalScore` = `regMidScore` + `regFinalScore`,
							`regGrade` = if(`regTotalScore` >= 90 , 'A',
										 if(`regTotalScore` >= 80, 'B',
										 if(`regTotalScore` >= 70, 'C',
										 if(`regTotalScore` >= 60, 'D', 'F'))));

# 실습 3-11
select * from `Register` order by `regTotalScore` desc;

# 실습 3-12 (강좌번호가 349번이면서 총점이 가장 큰 순서로 조회하시오)
select * from `Register` where `regLecNo` = 349 order by `regTotalScore` desc;

# 실습 3-13 (30시간 이상인 강조를 조회하시오)
select * from `Lecture` where `lecTime` >= 30;

#실습 3-14
 select `lecName`, `lecClass` from `Lecture`;
 
#실습 3-15 
select `stdNo`, `stdName` from `Student`;

#실습 3-16 
select * from `Student` where `stdAddress` is Null;

#실습 3-17 
select * from `Student` where `stdAddress` like '부산시%';

#실습 3-18 
select * from `Student` as a left join `Register` as b on a.stdNo = b.regStdNo;

#실습 3-19 
select
	`stdNo`, `stdName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
from `student` as a, `Register` as b where a.stdNO = b.regStdNo;

#실습 3-20 
select `stdName`, `stdNo`, `regLecNo` 
from `student` as a join `Register` as b
on a.stdNo = b.regstdNo
where `regLecNo` = 349;

#실습 3-21  (학생별 수강 신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오)
select
	`stdNo`,
    `stdName`,
    count(`stdNo`) as '수강신청 건수',
    sum(`regTotalScore`) as '종합 건수',
	sum(`regTotalscore`) / count(`stdNo`) as '평균'
from `student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by `stdNo` order by `stdNo`;


#실습 3-22 (수강 테이블과 강좌 테이블을 결합하시오)
select * from `Register` 
as a  join `Lecture` as b
on a.`regLecNo` = b.`lecNo`;

#실습 3-23 
select
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Register` as a
join `Lecture` as b on a.regLecNo = b.lecNo;

#실습 3-24 (사회복지 마케팅 강좌를 신청한 건수와 평균을 조회하시오)
select
	count(*) as '사횝복지 마케팅 수강 신청 건수',
    avg(`regTotalScore`) as '사회복지 마케팅 평균'
from `Register` as a join `Lecture` as b on a.regLecNo = b.lecNo
where `lecName` = '사회복지마케팅' ;

#실습 3-25 (A 등급을 받은 학번과 강좌명을 조회하시오)
select
	`regStdNo`,
	`lecName`
from `Register` as a join `Lecture` as b on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습 3-26
select * from `Student` as a
join `register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo;

#실습 3-27 
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a
join `Register` as b on a.stdNo = b.regstdno
join `lecture` as c on b.reglecno = c.lecNo
order by `regGrade` ASC, `regFinalScore` DESC;


#실습 3-28 (F학점을 받은 학번과 이름, 수강 과목명 점수 그리고 등급을 조회하시오)
select
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regstdno
join `lecture` as c on b.reglecno = c.lecNo
where `regGrade` = 'F';

#실습 3-29 (학생별 이수학점을 조회하시오 단 F등급은 받은 과목은 학점으로 인정되지 않음)
select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as '이수학점'
from `Student` as a
join `Register` as b on a.stdNo = b.regstdno
join `lecture` as c on b.reglecno = c.lecNo
where `regGrade` != 'F'
group by `stdNo`;


#실습 3-30  (신청과목과 이수과목을 조회하시오 단 F등급을 받은 과목은 이수과목으로 인정 안됨)
select
	`stdNo`,
    `stdName`,
    group_concat(`lecName`) as '신청과목',
    group_concat(if(`regTotalScore` >= 60, `lecName`, null)) as '이수과목'
from `Student` as a
join `Register` as b on a.stdNo = b.regstdno
join `lecture` as c on b.reglecno = c.lecNo
group by `stdNo`;
