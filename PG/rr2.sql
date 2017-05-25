
-- --             
	-- BEGIN;
	begin; set transaction isolation level REPEATABLE READ; 
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
	-- 12 s
	SELECT pg_sleep(12); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- COMMIT;
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- COM';
commit; 
	-- --             
	

	-- 
            
	
 
