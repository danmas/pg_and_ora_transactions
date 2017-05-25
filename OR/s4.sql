
-- --             
	-- --             
	SET TRANSACTION NAME 'trans_1'; 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 12
	exec DBMS_LOCK.SLEEP(12); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4
	exec DBMS_LOCK.SLEEP(4); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 14 s
	exec DBMS_LOCK.SLEEP(14); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 3 s
	exec DBMS_LOCK.SLEEP(3); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
