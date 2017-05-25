
-- --             
	-- --             
	begin; set transaction isolation level REPEATABLE READ; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 12
	SELECT pg_sleep(12); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4
	SELECT pg_sleep(4); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- UPD -> V_3 (2)';
update trans_test set name = 'V_3 (2)' where id = 2; 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 14 s
	SELECT pg_sleep(14); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 3 s
	SELECT pg_sleep(3); 
	-- --             
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
