----1.查看消耗资源最多的SQL：
select username,
		sid,
		opname,
		round(sofar*100 / totalwork,0) || '%' as progress,
		time_remaining,
		sql_text 
from v$session_longops , v$sql 
where time_remaining <> 0 and 
		sql_address=address and 
		sql_hash_value = hash_value;
		
		
----2.查找前10条性能差的sql语句
SELECT * 
FROM (
		select PARSING_USER_ID,
				EXECUTIONS,
				SORTS,
				COMMAND_TYPE,
				DISK_READS,
				sql_text 
		FROM v$sqlarea 
		order BY disk_reads DESC 
	)
where ROWNUM<10;

----3.检查数据操作的压力 
select * from v$locked_object;
