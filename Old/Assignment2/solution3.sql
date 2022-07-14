SPOOL solution3.lst
SET ECHO ON 
SET FEEDBACK ON 
SET LINESIZE 300 
SET PAGESIZE 300
-- Student Name: Lee Yu Xian
-- Student Number: 7233164

-- Do the expected query and explain plan
explain plan for
select r_name, count(o_custkey)
from region, customer, orders, nation
where o_orderdate >= '01-JAN-97' and o_orderdate <= '31-DEC-97'
and c_custkey = o_custkey
and c_nationkey = n_nationkey
and n_regionkey = r_regionkey
group by r_name;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Doing denormalization by adding a new field
alter table orders add o_rname varchar(25);

-- Reloading the data (polulate with data)
update orders
set o_rname = (
select r_name
from region, nation, customer
where c_custkey = o_custkey
and c_nationkey = n_nationkey
and n_regionkey = r_regionkey);

-- Run the new query with new denormalized table and explain the plan
explain plan for
select o_rname, count(o_custkey)
from orders
where o_orderdate >= '01-JAN-97' and o_orderdate <= '31-DEC-97'
group by o_rname;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Creating an index to speed up the query
create index a2task3 on orders(o_orderdate, o_rname, o_custkey);

-- Run the new query with new denormalized table and explain the plan
explain plan for
select o_rname, count(o_custkey)
from orders
where o_orderdate >= '01-JAN-97' and o_orderdate <= '31-DEC-97'
group by o_rname;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Housekeeping
drop index a2task3;
alter table orders drop column o_rname;

SPOOL OFF
