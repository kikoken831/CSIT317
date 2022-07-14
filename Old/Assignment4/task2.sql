/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 1 */
SELECT DISTINCT l_extendedprice
FROM LINEITEM
WHERE l_extendedprice >= ALL (SELECT l_extendedprice
                              FROM LINEITEM);

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 2 */
SELECT p_partkey, p_retailprice
FROM PART
WHERE p_retailprice > (SELECT MAX(p_retailprice)
                         FROM PART
                         WHERE p_brand = 'Brand#13') AND
      p_retailprice > (SELECT MAX(p_retailprice)
                         FROM PART
                         WHERE p_brand = 'Brand#23') AND
      p_retailprice > (SELECT MAX(p_retailprice)
                         FROM PART
                         WHERE p_brand = 'Brand#55');

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 3 */
SELECT   p_partkey, 0
FROM     PART
WHERE    NOT EXISTS (SELECT 'whatever'
                      FROM LINEITEM
                      WHERE l_partkey = p_partkey)
UNION
SELECT   l_partkey, COUNT(*)
FROM     LINEITEM
GROUP BY l_partkey;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 4 */
SELECT l_orderkey
FROM LINEITEM l
WHERE (SELECT COUNT(*)
       FROM LINEITEM
       WHERE l_orderkey = l.l_orderkey) > 5;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 5 */
EXPLAIN PLAN FOR
SELECT DISTINCT n_regionkey, (SELECT count(*)
                              FROM nation
                              WHERE n_regionkey = n.n_regionkey)
FROM nation n;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* 6*/
SELECT *
FROM LINEITEM
WHERE l_extendedprice > (SELECT MIN(l_extendedprice)
                         FROM LINEITEM)
      AND
      l_extendedprice < (SELECT MAX(l_extendedprice)
                         FROM LINEITEM);

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

