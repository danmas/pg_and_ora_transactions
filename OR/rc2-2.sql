
-- --             
	-- BEGIN;
	SET TRANSACTION NAME 'trans_1'; 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 8 s
	exec DBMS_LOCK.SLEEP(8); 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4 s
	exec DBMS_LOCK.SLEEP(4); 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- DELETE
	select to_char(sysdate, 'HH24:MI:SS')||' -- DEL' from dual;
delete from trans_test where id = 1;
 
	-- 3 s
	exec DBMS_LOCK.SLEEP(3); 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 11 s
	exec DBMS_LOCK.SLEEP(11); 
	-- COMMIT;
	select to_char(sysdate, 'HH24:MI:SS')||' -- COMMIT' from dual;
commit;
 
	-- --             
	

	-- 
            
	
 
