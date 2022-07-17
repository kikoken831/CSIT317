
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_waitstats.sql
   Task:           Tolist wait states
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	NAME			FORMAT A18		HEADING 'Wait class'
COLUMN	COUNT			FORMAT 999,999,999	HEADING 'Total number of waits'
COLUMN	TIME			FORMAT 999,999,999.99	HEADING 'Total time of waits'
SELECT 	V$WAITSTAT.CLASS, 
	V$WAITSTAT.COUNT,
	V$WAITSTAT.TIME
FROM	V$WAITSTAT;
prompt Done.
