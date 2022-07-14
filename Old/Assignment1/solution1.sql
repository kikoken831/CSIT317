SPOOL solution1
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 300
SET PAGESIZE 300
-- Student Name: Lee Yu Xian
-- Student Number: 7233164

-- Connecting as system
connect system/oracle

-- Listing dynamic performance view from V$INSTANCE
select v$instance.instance_name,
v$instance.host_name,
v$instance.startup_time,
v$instance.database_status
from v$instance;

-- Connecting as tpchr
connect tpchr/oracle

-- Analyzing table
analyze table lineitem compute statistics;
analyze table orders compute statistics;
analyze table customer compute statistics;
analyze table part compute statistics;
analyze table supplier compute statistics;
analyze table partsupp compute statistics;
analyze table nation compute statistics;
analyze table region compute statistics;

-- Analyzing index
analyze index lineitem_pkey compute statistics;
analyze index orders_pkey compute statistics;
analyze index customer_pkey compute statistics;
analyze index part_pkey compute statistics;
analyze index supplier_pkey compute statistics;
analyze index partsupp_pkey compute statistics;
analyze index nation_pkey compute statistics;
analyze index region_pkey compute statistics;

-- Getting systimestamp
select systimestamp from dual;

-- Finding row, data blocks, extends and bytes of tables
select us.segment_name, 
ut.num_rows, 
us.blocks,
us.extents,
us.bytes
from user_segments us join user_tables ut
on us.segment_name = ut.table_name
where ut.table_name in ('NATION', 'REGION', 'PART', 'SUPPLIER', 'PARTSUPP', 'CUSTOMER', 'ORDERS', 'LINEITEM');

-- Finding row, data blocks, extends and bytes of index
select us.segment_name,
us.blocks,
us.extents,
us.bytes
from user_segments us
where us.segment_name in ('NATION_PKEY', 'REGION_PKEY', 'PART_PKEY', 'SUPPLIER_PKEY', 'PARTSUPP_PKEY', 'CUSTOMER_PKEY', 'ORDERS_PKEY', 'LINEITEM_PKEY');

spool off
