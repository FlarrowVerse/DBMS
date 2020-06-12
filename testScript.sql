CREATE TABLE test_table(
	id Number(8) primary key not null,
	name varchar2(20) not null
);

DESC test_table;

DROP TABLE test_table PURGE;
