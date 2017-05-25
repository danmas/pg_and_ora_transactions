
-- --             
	-- BEGIN;
	begin; set transaction isolation level read committed; 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 14 s
	SELECT pg_sleep(14); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 13 s
	SELECT pg_sleep(13); 
	-- SELECT -
	select to_char(timeofday()::timestamp, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	SELECT pg_sleep(2); 
	-- COMMIT;
	select to_char(timeofday()::timestamp, 'HH24:MI:SS')||' -- COM';
commit; 
	-- --             
	

