
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
	-- 2 s
	SELECT pg_sleep(2); 
	-- UPDATE -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- UPD -> V_3';
update trans_test set name = 'V_3' where id = 1; 
	-- исполнение
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- COMMIT;
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- COM';
commit; 
	-- --             
	

	-- 
            
	
 
