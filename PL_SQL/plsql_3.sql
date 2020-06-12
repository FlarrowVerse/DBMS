create table AREAS
(
	RADIUS Number(3,2),
	AREA Number(10,6)
);

Declare
	rad Number(3,2) := 0.00;
	ar Number(10, 6) := 0.00;
	ex_inv_inp exception;
Begin
	rad := &rad;

	if rad < 3 or rad > 7 then
		raise ex_inv_inp;
	end if;

	ar := 3 * rad * rad;

	insert into AREAS values(rad, ar);
Exception
	when ex_inv_inp then
		dbms_output.put_line('Radius must be in the range 3 to 7.');
End;
/

select * from AREAS;

drop table AREAS;