SPOOL solution4.lst
SET ECHO ON 
SET FEEDBACK ON 
SET LINESIZE 300 
SET PAGESIZE 300
-- Student Name: Lee Yu Xian
-- Student Number: 7233164

-- Calling the given query
explain plan for
SELECT L_ORDERKEY, COUNT(*) TOT 
FROM LINEITEM 
WHERE L_QUANTITY = 37 AND L_DISCOUNT = 0.5
GROUP BY L_ORDERKEY 
HAVING COUNT(*) > 1 
ORDER BY L_ORDERKEY;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Creating index to improve performance
create index task4a on lineitem(l_discount);

-- Calling the given query
explain plan for
SELECT L_ORDERKEY, COUNT(*) TOT 
FROM LINEITEM 
WHERE L_QUANTITY = 37 AND L_DISCOUNT = 0.5
GROUP BY L_ORDERKEY 
HAVING COUNT(*) > 1 
ORDER BY L_ORDERKEY;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Dropping the index created
drop index task4a;

-- Creating index (2 columns) to improve performance
create index task4a on lineitem(l_quantity, l_discount);

-- Calling the given query
explain plan for
SELECT L_ORDERKEY, COUNT(*) TOT 
FROM LINEITEM 
WHERE L_QUANTITY = 37 AND L_DISCOUNT = 0.5
GROUP BY L_ORDERKEY 
HAVING COUNT(*) > 1 
ORDER BY L_ORDERKEY;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Dropping the index created
drop index task4a;

-- Creating indexes (2 single columns) to improve performance
create index task4a on lineitem(l_quantity);
create index task4b on lineitem(l_discount);

-- Calling the given query
explain plan for
SELECT L_ORDERKEY, COUNT(*) TOT 
FROM LINEITEM 
WHERE L_QUANTITY = 37 AND L_DISCOUNT = 0.5
GROUP BY L_ORDERKEY 
HAVING COUNT(*) > 1 
ORDER BY L_ORDERKEY;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Dropping the indexes created
drop index task4a;
drop index task4b;

-- Creating indexes (any columns) to improve performance
create index task4a on lineitem(l_quantity, l_discount, l_linenumber);

-- Calling the given query
explain plan for
SELECT L_ORDERKEY, COUNT(*) TOT 
FROM LINEITEM 
WHERE L_QUANTITY = 37 AND L_DISCOUNT = 0.5
GROUP BY L_ORDERKEY 
HAVING COUNT(*) > 1 
ORDER BY L_ORDERKEY;
-- Displaying the explained plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Dropping the indexes created
drop index task4a;

SPOOL OFF
