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