SPOOL solution4
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 300
SET PAGESIZE 300
-- Student Name: Lee Yu Xian
-- Student Number: 7233164

-- Explaining plan for the given query processing plan
explain plan for
select *
from orders join lineitem
on o_orderkey = l_orderkey
where o_orderdate < to_date('1996-01-01 00:00:00', 'syyyy-mm-dd hh24:mi:ss')
and l_partkey not in (select p_partkey from part where p_brand in ('Golden bolts') );

-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

SPOOL OFF
