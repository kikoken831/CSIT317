
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_net.sql
   Task:           To list system statistics
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	1000
COLUMN	STATISTIC#		FORMAT 9999			HEADING 'Statistic|number'
COLUMN	NAME			FORMAT A40			HEADING 'Statistic name'
COLUMN	VALUE			FORMAT 999,999,999,999,999	HEADING 'Statistic|value'
SELECT 	V$SYSSTAT.STATISTIC#, 
	V$SYSSTAT.NAME,
	V$SYSSTAT.VALUE
FROM	V$SYSSTAT
WHERE	V$SYSSTAT.NAME LIKE '%Net%';
prompt Done.
