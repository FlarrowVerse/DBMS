-- create tables
create table STUDENT
(
	STUD_ID Number(15) primary key not null,
	STUD_NAME varchar2(30) not null,
	STUD_ATT Number(4,2) default 0.00
);

-- set the values
insert into STUDENT values (13000117122, 'Arindam Das', 96.67);
insert into STUDENT values (13000117123, 'Archisman Chakraborty', 94.25);
insert into STUDENT values (13000117124, 'Apratim Sen', 97.00);
insert into STUDENT values (13000117125, 'Anurag Ganguly', 96.03);
insert into STUDENT values (13000117126, 'Anupam Chakraborty', 96.45);
insert into STUDENT values (13000117130, 'Aniket Das', 75.00);
insert into STUDENT values (13000117131, 'Ananya Paul', 74.67);
insert into STUDENT values (13000117095, 'Mainak Roy', 95.23);
insert into STUDENT values (13000117133, 'Aishik Roy', 59.34);

-- showing all records
select * from STUDENT;
 
-- starting PL/SQL block 
Declare 
    id number := 0;
    att number := 0.00;
    name varchar2(30);

Begin 
	-- taking id from user 
    id := &id; 

    select STUD_ATT into att from STUDENT where STUD_ID = id;
    select STUD_NAME into name from STUDENT where STUD_ID = id;

    if att < 80.00 then 
        dbms_output.put_line('Student ' || name || ' cannot attend exam.'); 
    else 
        dbms_output.put_line('Student ' || name || ' can attend exam.'); 
    end if; 
End; 
/

--delete tables
drop table STUDENT;