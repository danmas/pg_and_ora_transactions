
-- --             
	-- BEGIN;
	SET TRANSACTION NAME 'trans_1'; 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 5 s
	exec DBMS_LOCK.SLEEP(5); 
	-- UPDATE -
	select to_char(sysdate, 'HH24:MI:SS')||' -- UPD -> V_2' from dual;
update trans_test set name = 'V_2' where id = 1;
 
	-- SELECT -
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 7 s
	exec DBMS_LOCK.SLEEP(7); 
	-- COMMIT;
	select to_char(sysdate, 'HH24:MI:SS')||' -- COMMIT' from dual;
commit;
 
	-- --             
	

	-- 
            
	
 
