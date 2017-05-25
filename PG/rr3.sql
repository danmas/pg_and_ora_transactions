
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
	-- 3 s
	SELECT pg_sleep(3); 
	-- DELETE
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- DEL';
delete from trans_test where id = 1; 
	-- --             
	

	-- 
            
	
 
