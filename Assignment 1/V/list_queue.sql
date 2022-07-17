
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_queue.sql
   Task:           To list queues
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	PADDR			FORMAT 999999999	HEADING 'Process|that owns|a queue'
COLUMN	TYPE			FORMAT A12		HEADING 'Type of|queue'
COLUMN	QUEUED			FORMAT 999,999		HEADING 'Number of items|in a queue'
COLUMN	WAIT			FORMAT 999,999.99	HEADING 'Total time all|items wait'
COLUMN	TOTALQ			FORMAT 999,999,999	HEADING 'Total number of|items ever|in a queue'
SELECT 	V$QUEUE.PADDR,
	V$QUEUE.TYPE,
	V$QUEUE.QUEUED,
	V$QUEUE.WAIT,
	V$QUEUE.TOTALQ
FROM	V$QUEUE;
prompt Done.
