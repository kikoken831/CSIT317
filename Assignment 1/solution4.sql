SPOOL solution4
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 300
SET PAGESIZE 300
/*
Kendrick Kee
7366814
Task 4
*/
EXPLAIN PLAN FOR


SELECT C_CUSTKEY FROM CUSTOMER 
WHERE EXISTS
(
    SELECT O_CUSTKEY FROM ORDERS 
    WHERE C_CUSTKEY = O_CUSTKEY
	AND CUSTOMER.C_NAME = 'Golden Bolts' 
        AND ORDERS.O_TOTALPRICE > 100 
)
INTERSECT SELECT C_CUSTKEY FROM NATION 
JOIN CUSTOMER ON C_NATIONKEY = N_NATIONKEY  
WHERE
    (N_REGIONKEY = 1 OR N_REGIONKEY = 2 OR N_REGIONKEY = 3)
	AND C_NATIONKEY >= 0 
;


SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


SPOOL OFF
