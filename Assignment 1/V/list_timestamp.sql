
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.1
   Title:          How to trace SQL statements with SYSTIMESTAMP, TIMIMG, and AUTOTRACE options of SQL*Plus ?
   Script name:    list_timestamp.sql
   Task:           List timestamps
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
COLUMN STARTED FORMAT A30 HEADING "Started at"
COLUMN MIDDLE FORMAT A30 HEADING "In the middle at"
COLUMN COMPLETED FORMAT A30 HEADING "Completed at"
SELECT TO_CHAR(SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS.FF4') STARTED
FROM DUAL;
SET ECHO ON
SELECT count(*)
FROM LINEITEM;
SET ECHO OFF
SELECT TO_CHAR(SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS.FF4') MIDDLE
FROM DUAL;
SET ECHO ON
SELECT count(*)
FROM LINEITEM;
SET ECHO OFF
SELECT TO_CHAR(SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS.FF4') COMPLETED
FROM DUAL;
prompt Done.
