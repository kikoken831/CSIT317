
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sysevents.sql
   Task:           To list system events
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	1000
COLUMN	EVENT			FORMAT A50		HEADING 'Wait event'
COLUMN	WAIT_CLASS		FORMAT A11		HEADING 'Wait|class'
COLUMN	TOTAL_WAITS		FORMAT 999,999,999	HEADING 'Total|waits'
COLUMN	TIME_WAITED_MICRO	FORMAT 999,999,999,999	HEADING 'Time|waited|(microsec)'
SELECT 	V$SYSTEM_EVENT.EVENT, 
	V$SYSTEM_EVENT.WAIT_CLASS, 
	V$SYSTEM_EVENT.TOTAL_WAITS,
	V$SYSTEM_EVENT.TIME_WAITED_MICRO
FROM	V$SYSTEM_EVENT;
prompt Done.
