SPOOL solution1.lst
SET ECHO ON 
SET FEEDBACK ON 
SET LINESIZE 300 
SET PAGESIZE 300 
-- Student Name: Lee Yu Xian
-- Student Number: 7233164

-- Connect to system
CONNECT SYSTEM/oracle

-- Creating a table to collect statistics
CREATE TABLE OPSTAT_TABLE(
OWNER		VARCHAR2(30)	NOT NULL,
OBJECT_NAME	VARCHAR2(30)	NOT NULL,
STATISTIC_NAME	VARCHAR2(64)	NOT NULL,
VALUE		NUMBER		NOT NULL,
TS		TIMESTAMP	NOT NULL,
  CONSTRAINT OPSTAT_TABLE_PKEY 
	PRIMARY KEY(TS,OWNER,OBJECT_NAME,STATISTIC_NAME) );

INSERT INTO OPSTAT_TABLE (
	SELECT	OWNER,
 		OBJECT_NAME,
 		STATISTIC_NAME,
 		VALUE,
		SYSTIMESTAMP
	FROM  	V$SEGMENT_STATISTICS
	WHERE 	OWNER = 'TPCHR' AND
		STATISTIC_NAME IN ('logical reads',
				   'physical reads') );
COMMIT;

-- Connect to tpchr and run the task1.sql query
conn tpchr/oracle
SELECT COUNT(*)
FROM ( (SELECT *
       FROM LINEITEM
       WHERE L_SHIPDATE >= '01-JAN-1992' AND
             L_SHIPDATE <= '31-AUG-1992'
       INTERSECT
       SELECT *
       FROM LINEITEM
       WHERE L_SHIPDATE >= '01-APR-1992' AND
             L_SHIPDATE <= '30-APR-1993')
       UNION
      (SELECT *
       FROM LINEITEM
       WHERE L_SHIPDATE >= '01-JAN-1993' AND
             L_SHIPDATE <= '31-AUG-1993'
       INTERSECT
       SELECT *
       FROM LINEITEM
       WHERE L_SHIPDATE >= '01-APR-1992' AND
             L_SHIPDATE <= '30-APR-1993') );

-- Check the statistics
conn system/oracle
select	v.owner,
	v.object_name,
	v.statistic_name,
	v.value - nvl(stattable.value,0),
	systimestamp
from 	V$SEGMENT_STATISTICS v
left outer join opstat_table stattable
	on	v.owner = stattable.owner
	and	v.object_name = stattable.object_name
	and	v.statistic_name = stattable.statistic_name
where 	v.owner = 'TPCHR'
and	v.statistic_name in ('logical reads','physical reads')
and	(v.value - nvl(stattable.value,0)) <> 0;

-- Clear the table
TRUNCATE TABLE OPSTAT_TABLE;

-- Connect to tpchr and run the improved query
INSERT INTO OPSTAT_TABLE (
	SELECT	OWNER,
 		OBJECT_NAME,
 		STATISTIC_NAME,
 		VALUE,
		SYSTIMESTAMP
	FROM  	V$SEGMENT_STATISTICS
	WHERE 	OWNER = 'TPCHR' AND
		STATISTIC_NAME IN ('logical reads',
				   'physical reads') );
COMMIT;

-- Connect to tpchr and run the improved query
conn tpchr/oracle
select count(*)
from lineitem
where (l_shipdate >= '01-APR-1992' and l_shipdate <= '31-AUG-1992')
or (l_shipdate >= '01-JAN-1993' and l_shipdate <= '30-APR-1993');

-- Check the statistics
conn system/oracle
select	v.owner,
	v.object_name,
	v.statistic_name,
	v.value - nvl(stattable.value,0),
	systimestamp
from 	V$SEGMENT_STATISTICS v
left outer join opstat_table stattable
	on	v.owner = stattable.owner
	and	v.object_name = stattable.object_name
	and	v.statistic_name = stattable.statistic_name
where 	v.owner = 'TPCHR' 
and	v.statistic_name in ('logical reads','physical reads')
and	(v.value - nvl(stattable.value,0)) <> 0;

-- Drop the created table
drop table opstat_table cascade constraints purge;

SPOOL OFF

