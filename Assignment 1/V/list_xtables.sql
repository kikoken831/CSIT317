
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_xtables.sql
   Task:           A test case
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET HEADING OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET TERMOUT OFF
SET TRIMSPOOL ON
SET PAGESIZE 0
spool list_xtabcols.sql
PROMPT SET ECHO ON

SELECT 'DESCRIBE ', NAME
FROM V$FIXED_TABLE
WHERE NAME LIKE 'X$%';
ORDER BY NAME DESC;
SPOOL OFF
SET ECHO ON
SET HEADING ON
SET FEEDBACK ON
SET TERMOUT ON
SET LINESIZE 300
SET PAGESIZE 100
SET VERIFY ON
@list_xtabcols;
prompt Done.
