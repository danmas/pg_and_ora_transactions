
-- --             
	-- BEGIN;
	begin; set transaction isolation level read committed; 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 8 s
	SELECT pg_sleep(8); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4 s
	SELECT pg_sleep(4); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- UPDATE -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- UPD -> V_X';
update trans_test set name = 'V_X' where id = 1; 
	-- 3 s
	SELECT pg_sleep(3); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 11 s
	SELECT pg_sleep(11); 
	-- COMMIT;
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- COM';
commit; 
	-- --             
	

	-- 
            
	
 
