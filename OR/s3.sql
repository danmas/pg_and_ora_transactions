
-- --             
	-- --             
	SET TRANSACTION NAME 'trans_1'; 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 12 s
	exec DBMS_LOCK.SLEEP(12); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 3 s
	exec DBMS_LOCK.SLEEP(3); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS')||' -- DEL' from dual;
delete from trans_test where id = 1;
 
	-- --             
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	exec DBMS_LOCK.SLEEP(2); 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
