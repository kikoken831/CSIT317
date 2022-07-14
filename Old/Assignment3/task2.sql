SELECT O_CUSTKEY, SUM(L_EXTENDEDPRICE)
FROM LINEITEM JOIN ORDERS
              ON L_ORDERKEY = O_ORDERKEY
WHERE O_ORDERSTATUS = <value-1> AND
      L_TAX = <value-2>
GROUP BY O_CUSTKEY;


SELECT C_NAME, C_PHONE
FROM CUSTOMER
WHERE C_ACCTBAL > <value-3> AND
      C_CUSTKEY NOT IN ( SELECT O_CUSTKEY
                         FROM ORDERS
                         WHERE O_TOTALPRICE > <value-4> AND
			 O_CLERK = <value-5>  );


SELECT O_ORDERKEY, O_ORDERDATE, O_TOTALPRICE
FROM ORDERS
WHERE NOT EXISTS ( SELECT 'whatever'
                   FROM LINEITEM
                   WHERE L_ORDERKEY = O_ORDERKEY AND
                         L_PARTKEY IN 
                             ( SELECT P_PARTKEY
                               FROM PART
                               WHERE P_NAME = <value-6> ) );

