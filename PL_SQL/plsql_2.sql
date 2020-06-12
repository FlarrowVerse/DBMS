-- create tables
create table ACCT_MSTR
(
	ACCT_NO Number(15) primary key not null,
	ACCT_HOLDER varchar2(30) not null,
	CURBAL Number(12,2) default 0.00
);

-- set the values
insert into ACCT_MSTR values (122, 'Arindam Das', 50000);
insert into ACCT_MSTR values (123, 'Archisman Chakraborty', 20000);
insert into ACCT_MSTR values (124, 'Apratim Sen', 100000);
insert into ACCT_MSTR values (125, 'Anurag Ganguly', 30000);
insert into ACCT_MSTR values (126, 'Anupam Chakraborty', 100);
insert into ACCT_MSTR values (130, 'Aniket Das', 75);
insert into ACCT_MSTR values (131, 'Ananya Paul', 60000);
insert into ACCT_MSTR values (095, 'Mainak Roy', 25000);
insert into ACCT_MSTR values (133, 'Aishik Roy', 200);

-- showing all records
select * from ACCT_MSTR;
 
-- starting PL/SQL block 
Declare 

    acc_no ACCT_MSTR.ACCT_NO%TYPE := 0;
    min_bal ACCT_MSTR.CURBAL%TYPE := 0.00; 

Begin 
	-- taking account number and minimum balance required from user 
    min_bal := &min_bal;
    acc_no := &acc_no; 

    update ACCT_MSTR
    set ACCT_MSTR.CURBAL = ACCT_MSTR.CURBAL - 100
    where ACCT_MSTR.ACCT_NO = acc_no and ACCT_MSTR.CURBAL < min_bal and ACCT_MSTR.CURBAL > 100;

    dbms_output.put_line('Updated Records ::::::> ');

End; 
/

select * from ACCT_MSTR;

--delete tables
drop table ACCT_MSTR;