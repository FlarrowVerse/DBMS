begin
	-- create the tables
	@createScript_transaction.sql
	-- enter 5 records into each table
	@inputScript_transaction.sql
exception
when others then
	dbms_output.put_line('');
end;
/