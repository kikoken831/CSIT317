
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_laches.sql
   Task:           To list latches
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	600
COLUMN	LATCH#			FORMAT 999		HEADING 'Latch|number'
COLUMN	LEVEL#			FORMAT 99		HEADING 'Latch|level'
COLUMN	NAME			FORMAT A10		HEADING 'Latch|name'
COLUMN	GETS			FORMAT 999,999,999	HEADING 'Willing|to wait|gets'
COLUMN	MISSES			FORMAT 999,999,999	HEADING 'Willing|to wait|misses'
COLUMN	SLEEPS			FORMAT 999,999,999	HEADING 'Willing|to wait|sleeps'
COLUMN	IMMEDIATE_GETS		FORMAT 999,999		HEADING 'No wait|gets'
COLUMN	IMMEDIATE_MISSES	FORMAT 999,999		HEADING 'No wait|misses'
COLUMN	SPIN_GETS		FORMAT 999,999		HEADING 'Gets|after|spinning'
COLUMN	WAIT_TIME		FORMAT 999,999		HEADING 'Waiting|time'
SELECT 	V$LATCH.LATCH#, 
	V$LATCH.LEVEL#,
	V$LATCH.NAME,
	V$LATCH.GETS,
	V$LATCH.MISSES,
	V$LATCH.SLEEPS,
	V$LATCH.IMMEDIATE_GETS,
	V$LATCH.IMMEDIATE_MISSES,
	V$LATCH.SPIN_GETS,
	V$LATCH.WAIT_TIME
FROM	V$LATCH;
prompt Done.
