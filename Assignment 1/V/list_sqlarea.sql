
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sqlarea.sql
   Task:           To list SQL area
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	3000
COLUMN	SQL_TEXT		FORMAT A60		HEADING 'SQL statement'
COLUMN	EXECUTIONS		FORMAT 999,999		HEADING 'Total|executions'
COLUMN	LAT			FORMAT A12		HEADING 'Last time|active'
SELECT 	V$SQLAREA.SQL_TEXT,
	V$SQLAREA.EXECUTIONS,
	TO_CHAR(V$SQLAREA.LAST_ACTIVE_TIME, 'DD-MON-YYYY') LAT
FROM	V$SQLAREA
ORDER BY V$SQLAREA.EXECUTIONS DESC;
prompt Done.
