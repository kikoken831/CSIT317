SPOOL solution1
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 300
SET PAGESIZE 300


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Assignment 1
   Task 1
   Part 1
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

connect system/oracle;

COLUMN	INSTANCE_NAME		FORMAT A6		HEADING 'Instance|name'
COLUMN	HOST_NAME		FORMAT A20		HEADING 'Host|name'
COLUMN	STARTUP			FORMAT A12		HEADING 'Startup|time'
COLUMN	DATABASE_STATUS		FORMAT A10		HEADING 'Database|status'
SELECT 	V$INSTANCE.INSTANCE_NAME, 
	V$INSTANCE.HOST_NAME,
	TO_CHAR(V$INSTANCE.STARTUP_TIME,'DD-MON-YYYY-HH:MM:SS') STARTUP,
	V$INSTANCE.DATABASE_STATUS
FROM	V$INSTANCE;


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Assignment 1
   Task 1
   Part 2
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

connect tpchr/oracle;

ANALYZE TABLE ORDERS COMPUTE STATISTICS;
ANALYZE TABLE REGION COMPUTE STATISTICS;
ANALYZE TABLE NATION COMPUTE STATISTICS;
ANALYZE TABLE PART COMPUTE STATISTICS;
ANALYZE TABLE SUPPLIER COMPUTE STATISTICS;
ANALYZE TABLE PARTSUPP COMPUTE STATISTICS;
ANALYZE TABLE CUSTOMER COMPUTE STATISTICS;
ANALYZE TABLE LINEITEM COMPUTE STATISTICS;



SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'ORDERS';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'REGION';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'NATION';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'PART';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'SUPPLIER';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'PARTSUPP';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'CUSTOMER';

SELECT TABLE_NAME, TABLESPACE_NAME, AVG_ROW_LEN, NUM_FREELIST_BLOCKS, CHAIN_CNT, AVG_SPACE_FREELIST_BLOCKS
FROM USER_TABLES
WHERE TABLE_NAME = 'LINEITEM';


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Assignment 1
   Task 1
   Part 3
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
connect sys/oracle as sysdba;

SELECT SYSTIMESTAMP FROM DUAL;

select a.segment_name, b.num_rows, a.blocks, a.extents, a.bytes
from dba_segments a, dba_tables b
where a.segment_name = b.table_name
and b.table_name in ('PART', 'SUPPLIER', 'PARTSUPP', 'LINEITEM', 'ORDERS', 'CUSTOMER', 'NATION', 'REGION');

SELECT ds.segment_name as index_name, ds.blocks as total_blocks, ds.extents as total_extents,
ds.bytes as total_bytes from dba_segments ds where ds.owner = 'TPCHR' and ds.segment_type = 'INDEX';
SPOOL OFF
