
-- --             
	-- create table
	drop table trans_test;
create table trans_test(id integer, name varchar2(7), count integer);
insert into trans_test values (1, 'V_1',1);
insert into trans_test values (2, 'V_1',1);
insert into trans_test values (3, 'V_1',1);
insert into trans_test values (4, 'V_1',1);
insert into trans_test values (5, 'V_1',1);
insert into trans_test values (6, 'V_1',1);
insert into trans_test values (7, 'V_1',1);
insert into trans_test values (8, 'V_1',1);
insert into trans_test values (9, 'V_1',1);
insert into trans_test values (10, 'V_1',1);
commit;

CREATE OR REPLACE FUNCTION long_test(p_sleep_time_s IN NUMBER) RETURN NUMBER
IS

BEGIN
  
 DBMS_LOCK.SLEEP(p_sleep_time_s);
 RETURN (1);

END long_test;
/ 
	-- --             
	

	-- 
            
	
 
