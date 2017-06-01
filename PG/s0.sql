
-- --             
	-- create table
	drop table if exists trans_test;
create table trans_test(id int primary key, name text, count int);
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

create or replace function long_test(p_sleep_time_s int) returns int 
as $$
declare
begin
	perform pg_sleep(p_sleep_time_s);
    return 1;
end
$$ language plpgsql; 
 
	-- --             
	

	-- 
            
	
 
