
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sql.sql
   Task:           To list SQL text
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
SELECT 	V$SQL.SQL_TEXT,
	V$SQL.EXECUTIONS,
	TO_CHAR(V$SQL.LAST_ACTIVE_TIME, 'DD-MON-YYYY') LAT
FROM	V$SQL
ORDER BY V$SQL.EXECUTIONS DESC;
prompt Done.
