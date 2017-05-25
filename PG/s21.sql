
-- --             
	-- --             
	begin; set transaction isolation level REPEATABLE READ; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 5 s
	SELECT pg_sleep(5); 
	-- --             
	update trans_test set name = 'V_2' where id = 1; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 7 s
	SELECT pg_sleep(7); 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
