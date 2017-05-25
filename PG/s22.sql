
-- --             
	-- --             
	begin; set transaction isolation level REPEATABLE READ; 
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
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- UPD -> V_3';
update trans_test set name = 'V_3' where id = 1; 
	-- 12 s
	SELECT pg_sleep(12); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
