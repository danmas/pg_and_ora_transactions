
-- --             
	-- BEGIN;
	COMMIT;
SET SERVEROUTPUT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
 
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
	-- 2 s
	exec DBMS_LOCK.SLEEP(2); 
	-- UPDATE -
	select to_char(sysdate, 'HH24:MI:SS')||' -- UPD -> V_3' from dual;
update trans_test set name = 'V_3' where id = 1;
 
	-- исполнение
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- COMMIT;
	select to_char(sysdate, 'HH24:MI:SS')||' -- COMMIT' from dual;
commit;
 
	-- --             
	

	-- 
            
	
 
