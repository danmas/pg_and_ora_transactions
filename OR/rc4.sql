
-- --             
	-- BEGIN;
	SET TRANSACTION NAME 'trans_1'; 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 14 s
	exec DBMS_LOCK.SLEEP(14); 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 13 s
	exec DBMS_LOCK.SLEEP(13); 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	exec DBMS_LOCK.SLEEP(2); 
	-- COMMIT;
	select to_char(sysdate, 'HH24:MI:SS')||' -- COMMIT' from dual;
commit;
 
	-- --             
	

