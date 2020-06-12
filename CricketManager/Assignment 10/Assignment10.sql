-- creates all required tables
create table MATCH
(
	match_id varchar2(6) primary key not null,
	team1 varchar2(15) not null,
	team2 varchar2(15) not null,
	ground varchar2(15) not null,
	mdate Date,
	winner varchar2(15) not null
);

create table PLAYER
(
	p_id varchar2(6) primary key not null,
	lname varchar2(20) not null, 
	fname varchar2(20) not null, 
	country varchar2(15) not null, 
	yborn Number(5), 
	bplace varchar2(15) not null, 
	ftest varchar2(15) not null 
);

create table BATTING 
( 
    match_id varchar2(6) not null references MATCH(match_id) on delete cascade,  
    p_id varchar2(6) not null references PLAYER(p_id) on delete cascade,  
    mts Number(8,2),  
    bat_order varchar2(20) not null,  
    out_type varchar2(15),  
    fow varchar2(20), 
    nruns Number(3),  
    nballs Number(3), 
    fours Number(2),  
    sixes Number(2) 
);

create table BOWLING 
( 
    match_id varchar2(6) not null references MATCH(match_id) on delete cascade,  
    p_id varchar2(6) not null references PLAYER(p_id) on delete cascade,  
    novers Number(5,1),  
    maidens Number(2),  
    nruns Number(3),  
    nwickets Number(2) 
);

-----------------------------------------------------------------------------------------------------------------

insert into MATCH values('M0001','IND','ENG','Eden Gardens',to_date('01-03-20', 'DD-MM-YY'),'IND');
insert into MATCH values('M0002','AUS','SL','Sydney',to_date('05-05-09', 'DD-MM-YY'),'AUS');
insert into MATCH values('M0003','WI','PAK','Lahore',to_date('09-06-20', 'DD-MM-YY'),'PAK');
insert into MATCH values('M0004','IND','ENG','Lords',to_date('12-08-18', 'DD-MM-YY'),'ENG');
insert into MATCH values('M0005','AUS','IND','Sydney',to_date('10-07-02', 'DD-MM-YY'),'IND');
insert into MATCH values('M0006','AUS','ENG','Oval',to_date('12-06-19', 'DD-MM-YY'),'ENG');
insert into MATCH values('M0007','SL','BAN','Sri Lanka',to_date('04-06-20', 'DD-MM-YY'),'SL');
insert into MATCH values('M0008','SL','PAK','Karachi',to_date('07-11-019', 'DD-MM-YY'),'SL');

insert into PLAYER values('27001','Virat','Kohli','India', 1988,'Delhi','Fit');
insert into PLAYER values('11111','Andrew','Strauss','England', 1977,'Leeds','Unfit');
insert into PLAYER values('22222','Sourav','Ganguly','India', 1972,'Kolkata','Fit');
insert into PLAYER values('33333','Alastair','Cook','England', 1988,'London','Fit');
insert into PLAYER values('44444','David','Warner','Australia', 1986,'Melbourne','Unfit');
insert into PLAYER values('SL001','Mahela','Jayawardene','Sri Lanka', 1970,'Colombo','Fit');
insert into PLAYER values('AUS01','Ricky','Ponting','Australia',1972,'Sydney','Fit');
insert into PLAYER values('BAN01','Shakib Al','Hasan','Bangladesh', 1988,'Dhaka','Fit');
insert into PLAYER values('PAK01','Wasim','Akram','Pakistan', 1966,'Lahore','Unfit');

insert into BATTING values('M0001','11111', 20,'Opening','Bowled','115-3','39','51','5','1');
insert into BATTING values('M0001','33333', 26,'Second down','Hit wicket','159-5','70','62','9','4');
insert into BATTING values('M0002','27001', 41,'Middle order','Stumped','219-5','81','65','11','4');
insert into BATTING values('M0005','27001', 60,'Middle order','Not out','','115','80','12','8');
insert into BATTING values('M0005','11111', 45,'Opening','Bowled','170-3','65','51','11','0');
insert into BATTING values('M0005','33333', 50,'First down','Bowled','255-7','22','65','7','2');
insert into BATTING values('M0003','22222', 42,'Opening','Bowled','80-1','40','50','6','1');
insert into BATTING values('M0006','27001', 50,'Middle order','Run out','313-6','125','80','15','6');
insert into BATTING values('M0007','SL001', 51,'Middle order','Run out','200-3','85','80','9','6');
insert into BATTING values('M0007','AUS01', 40,'Middle order','Bowled','320-6','57','80','2','6');
insert into BATTING values('M0007','BAN01', 20,'Middle order','Run out','200-6','41','80','6','0');
insert into BATTING values('M0007','PAK01', 50,'Opener','Caught','61-2','29','42','3','0');
insert into BATTING values('M0008','SL001', 51,'Middle order','Run out','200-3','85','80','9','6');
insert into BATTING values('M0008','AUS01', 40,'Middle order','Bowled','320-6','57','80','2','6');
insert into BATTING values('M0008','BAN01', 20,'Middle order','Run out','200-6','41','80','6','0');
insert into BATTING values('M0008','PAK01', 50,'Opener','Caught','61-2','29','42','3','0');

insert into BOWLING values('M0001','33333','5','0','33','1');
insert into BOWLING values('M0002','PAK01','10','2','44','3');
insert into BOWLING values('M0003','22222','7','0','40','2');
insert into BOWLING values('M0005','BAN01','5','0','20','4');

-----------------------------------------------------------------------------------------------------------------

select * from MATCH;
select * from PLAYER;
select * from BATTING;
select * from BOWLING;

-----------------------------------------------------------------------------------------------------------------

-- query i
select match_id 
from MATCH M natural join BATTING B
where B.p_id = '27001' and B.nruns > 
                                    (select max(BATTING.nruns) 
                                    from BATTING natural join MATCH 
                                    where MATCH.ground = 'Sydney'and BATTING.p_id = '27001');

-- query ii
select distinct(p_id) 
from BATTING 
where p_id not in 
            (select p_id 
            from BATTING 
            where nruns < 30);    

-- query iii
select p_id 
from BATTING 
group by p_id 
having avg(nruns) > 
                (select avg(B.nruns) 
                from MATCH M natural join BATTING B 
                group by M.ground 
                having M.ground = 'Sri Lanka');

-----------------------------------------------------------------------------------------------------------------

drop table BOWLING;
drop table BATTING;
drop table PLAYER;
drop table MATCH;
