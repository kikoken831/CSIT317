
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_vviews.sql
   Task:           To list V$ views
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET LINESIZE 300
SET PAGESIZE 200
SET WRAP ON
COLUMN VIEW_NAME FORMAT A30 HEADING "View name"
COLUMN VIEW_DEFINITION FORMAT A80 HEADING "View definition"
SELECT VIEW_NAME,VIEW_DEFINITION
FROM V$FIXED_VIEW_DEFINITION
WHERE VIEW_NAME LIKE 'V$%'
ORDER BY VIEW_NAME ASC;
prompt Done.
