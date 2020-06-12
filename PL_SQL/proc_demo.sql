create or replace procedure Sum(a IN number, b IN number) is
c number;
Begin
	c := a + b;
	dbms_output.put_line('Sum of two nos = ' || c);
End Sum;
/

Declare
	x number;
	y number;
Begin
	x := &x;
	y := &y;

	Sum(x, y);
End;
/