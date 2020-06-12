begin
	-- initialize the DB
	@initScript.sql
	-- display all queries
	@querieScript.sql
	-- update all data
	-- @updateScript.sql
exception
when others then
	dbms_output.put_line('Error occured.');
end;

/