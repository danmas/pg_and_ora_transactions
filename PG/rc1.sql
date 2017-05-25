
-- --             
	-- BEGIN;
	begin; set transaction isolation level read committed; 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 5 s
	SELECT pg_sleep(5); 
	-- UPDATE -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- UPD -> V_2';
update trans_test set name = 'V_2' where id = 1; 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 7 s
	SELECT pg_sleep(7); 
	-- COMMIT;
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- COM';
commit; 
	-- --             
	

	-- 
            
	
 
