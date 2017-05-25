
-- --             
	-- --             
	SET TRANSACTION NAME 'trans_1'; 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 8 s
	exec DBMS_LOCK.SLEEP(8); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 4 s
	exec DBMS_LOCK.SLEEP(4); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- 2 s
	exec DBMS_LOCK.SLEEP(4); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS')||' -- UPD -> V_3' from dual;
update trans_test set name = 'V_3' where id = 1;
 
	-- 12 s
	exec DBMS_LOCK.SLEEP(12); 
	-- --             
	select to_char(sysdate, 'HH24:MI:SS'),name from trans_test where id = 1; 
	-- --             
	commit; 
	-- --             
	

	-- 
            
	
 
