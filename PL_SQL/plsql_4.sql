create table apples
(
    boxnum Number(3),
    weight Number(3)
);

insert into apples values(1, 10);
insert into apples values(2, 7);
insert into apples values(3, 100);

create or replace procedure costcal (weight IN number) is
	totcost number;
	exc exception;
begin
	if weight >=10 THEN
		totcost:=5*weight;
		dbms_output.put_line('Cost of ' || weight || 'kg apple box is : Rs. ' || totcost);
	elsif weight <10 and weight >0 then
		totcost:=7*weight;
		dbms_output.put_line('Cost of ' || weight || 'kg apple box is : Rs. ' || totcost);
	else
		raise exc;
	end if;
exception
	when exc then
		dbms_output.put_line('Invalid weight! Please check again');
end costcal;
/

Declare
	w apples.weight%type;
	i number := 1;
begin
	loop
	    select weight into w 
		from apples
		where boxnum = i;
		costcal(w);
		i := i + 1;
		exit when i = 4;
	end loop;
end;
/

drop table apples;