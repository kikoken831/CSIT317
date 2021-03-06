SELECT COUNT( DISTINCT L_TAX)
FROM LINEITEM 
WHERE L_SHIPINSTRUCT LIKE '%DELIVER IN PERSON%';

SELECT COUNT(O_ORDERDATE)
FROM ORDERS;

SELECT AVG(PS_AVAILQTY)
FROM PARTSUPP;

SELECT COUNT(DISTINCT PS_COMMENT)
FROM PARTSUPP;

SELECT COUNT(*)
FROM ORDERS
WHERE O_TOTALPRICE > 100;

SELECT COUNT(*)
FROM ORDERS;

SELECT MIN(L_TAX), MAX(L_TAX)
FROM LINEITEM;


