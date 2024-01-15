insert into `Students` values
('20101001', '10', 'p10101', '정우성', '760121-1234567', '010-1101-7601', null, '서울'),
('20101002', '10', 'p10101', '이정재', '760111-1234567', '010-1102-7506', null, '서울'),
('20111011', '11', 'p11103', '전지현', '890530-1234567', '010-1101-8905', 'jjh@naver.com', '대전'),
('20111013', '11', 'p11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '서울'),
('20111014', '11', 'p11104', '원빈', '660912-1234567', '010-2104-6609', 'one@dauam.net', '대전'),
('21221010', '22', 'p22110', '장동건', '790720-1234567', '010-3107-7907', 'jang@naver.com', '대전'),
('21231002', '23', 'p23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', '대구'),
('22311011', '31', 'p31104', '김연아', '651021-1234567', '010-0101-6510', 'yuna@daum.net', '대구'),
('22311014', '31', 'p31104', '유재석', '721128-1234567', '010-6101-7211', null, '부산'),
('22401001', '40', 'p40101', '강호동', '920907-1234567', '010-7103-9209', null, '부산'),
('22401002', '40', 'p40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail', '광주'),
('22421003', '42', 'p42103', '강동원', '770314-1234567', '010-81017703', 'dong@naver.com', '광주');

insert into `Professors` values
('P10101', '10', '김유신', '750120-1234567', '010-1101-1976', 'kimys@hg.co.kr', '서울'),
('P10102', '10', '계백', '740610-1234567', '010-1102-1975', 'gaeback@hg.co.kr', '서울'),
('P11101', '11', '김관창', '880529-1234567', '010-1103-1989', 'kwanch@hg.co.kr', '대전'),
('P11103', '11', '김춘추', '780412-1234567', '010-2101-1989', 'kimcc@hg.co.kr', '대전'),
('P11104', '11', '이사부', '650911-1234567', '010-2104-1979', 'leesabu@hg.co.kr', '대전'),
('P22110', '22', '장보고', '780727-1234567', '010-3101-1966', 'jangbg@hg.co.kr', '대구'),
('P23102', '23', '선덕여왕', '830614-1234567', '010-4101-1984', 'gueen@hg.co.kr', '대구'),
('P31101', '31', '강감찬', '641020-1234567', '010-5101-1965', 'kang@hg.co.kr', '대구'),
('P31104', '31', '신사임당', '711127-1234567', '010-6101-1972', 'sinsa@hg.co.kr', '부산'),
('P40101', '40', '이이', '910906-1234567', '010-7103-1992', 'leelee@hg.co.kr', '부산'),
('P40102', '40', '이황', '881208-1234567', '010-7104-1989', 'hwang@hg.co.kr', '광주'),
('P42103', '42', '송상현', '760318-1234567', '010-8101-1977', 'ssh@hg.co.kr', '광주');

insert into `Departments` values
('10','국어국문학과','051-510-1010'),
('11','영어영문학과','051-510-1011'),
('20','경영학과','051-510-1020'),
('21','경제학과','051-510-1021'),
('22','정치외교학과','051-510-1022'),
('23','사회복지학과','051-510-1023'),
('30','수학과','051-510-1030'),
('31','통계학과','051-510-1031'),
('32','생명과학과','051-510-1032'),
('40','기계공학과','051-510-1040'),
('41','전자공학과','051-510-1044'),
('42','컴퓨터공학과','051-510-1042');

insert into `Lectures` values
('101001','p10101','대학 글쓰기','2','10','본102'),
('101002','p10102','한국어음운론','3','30','본102'),
('101003','p10102','한국현대문학사','3','30','본103'),
('111011','p11103','중세영문학','3','25','본201'),
('111012','p11104','영미시','3','25','본201'),
('231110','p23102','사회복지학개론','1','8','별관103'),
('311002','p31101','통계학의 이해','2','16','별관303'),
('311003','p31104','기초 통계학','3','26','별관303'),
('401019','p40101','기계역학','3','36','공학관102'),
('421012','p42103','데이터베이스','3','32','공학관103');

insert into `Register` values
('20101001', '101001', 'P10101', null, null, null, null, null, null),
('20101001', '101002', 'P10102', null, null, null, null, null, null),
('20111013', '111011', 'P11103', null, null, null, null, null, null),
('21231002', '231110', 'P23102', null, null, null, null, null, null),
('22401001', '401019', 'P40101', null, null, null, null, null, null),
('22401001', '421012', 'P42103', null, null, null, null, null, null),
('20101001', '101003', 'P10102', null, null, null, null, null, null),
('22421003', '311003', 'P31104', null, null, null, null, null, null),
('22421003', '421012', 'P42103', null, null, null, null, null, null),
('20111013', '111012', 'P11104', null, null, null, null, null, null);

#문제1 (모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오)
select `stdNo`, `stdName`, `stdHp`, `depName`, b.`depNo` from `students` as a
join `departments` as b on a.Departments_depNo = b.depNo;

#문제2 (모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오)
select * from `professors` as a
join `departments` as b on a.Departments_depNo = b.depNo;

#문제3 (모든 강좌 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오)
select `lecNo`, `lecName`, `proName`, `proHp` from `Lectures` as a
join `professors` as b on a.Professors_proNo = b.proNo;

#문제4 (모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오)
select 
	`lecNo`,
	`lecName`,
    `proNo`,
    `proName`,
    `proHp`,
    c.`depNo`,
    `depName`
from 
`departments` as a,
`professor` as b,
`Departments` as c
where 
	a.`proNo` = b.`Departments_depNo` and
    b.`depNo` = c.`depNo`;

#문제5
select *
from `Register` as a
join `Students` as b on a.stdNo = b.stdNo
join `lectures` as c on a.lecNO = c.lecNo
join `professors` as d on a.proNo = d.proNo;

#문제6
update `Register` set
						`regAttenScore` = ceil(RAND() * 100),
						`regMidScore` = ceil(RAND() * 100),
						`regFinalScore` = ceil(RAND() * 100);


#문제7
update `Register` set
						`regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`)/3;


#문제8
update `Register` set
						`regGrade` = if(`regTotal` >= 90, 'A',
										if(`regTotal` >= 80, 'B',
											if(`regTotal` >= 70, 'C',
												if(`regTotal` >= 60, 'D', 'F'))));


#문제9
select * from `Register` order by `regTotal` desc limit 1;

#문제10
select avg(`regtotal`) as '총점평균'
 from `Register` as a
join `Students` as b on a.Students_stdNo = b.stdNo
where `stdName` = '정우성';