
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.1
   Title:          How to trace SQL statements with SYSTIMESTAMP, TIMIMG, and AUTOTRACE options of SQL*Plus ?
   Script name:    trace1.sql
   Task:           Create a sample trace and save it in trace2.lst
   Created by:     Janusz R. Getta
   Created on:	   01 February 2020
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET LINESIZE 300
SET PAGESIZE 100
set termout off
spool trace2
SELECT *
FROM LINEITEM
WHERE ROWNUM < 3;
spool off
set termout on
prompt Done.
