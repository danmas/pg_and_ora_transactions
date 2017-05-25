
-- --             
	-- --             
	begin; set transaction isolation level REPEATABLE READ; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 12 s
	SELECT pg_sleep(12); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 3 s
	SELECT pg_sleep(3); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- DEL';
delete from trans_test where id = 1; 
	-- --             
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	SELECT pg_sleep(2); 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
