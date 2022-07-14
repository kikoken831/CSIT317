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

c