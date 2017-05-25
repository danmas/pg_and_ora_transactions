
-- --             
	-- --             
	begin; set transaction isolation level READ UNCOMMITTED; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 8 s
	SELECT pg_sleep(8); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4 s
	SELECT pg_sleep(4); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	SELECT pg_sleep(2); 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
