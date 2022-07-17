
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_bufferpool.sql
   Task:           To list buffer pool
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	ID			FORMAT 9999		HEADING 'Buffer pool identifier'
COLUMN	NAME			FORMAT A20		HEADING 'Name'
COLUMN	BLOCK_SIZE		FORMAT 999,999,999	HEADING 'Block size|(Bytes)'
COLUMN	RESIZE_STATE		FORMAT A20		HEADING 'Resize state'
COLUMN	CURRENT_SIZE		FORMAT 999,999,999	HEADING 'Current size|(Mbytes)'
SELECT 	V$BUFFER_POOL.ID, 
	V$BUFFER_POOL.NAME,
	V$BUFFER_POOL.BLOCK_SIZE,
	V$BUFFER_POOL.RESIZE_STATE,
	V$BUFFER_POOL.CURRENT_SIZE
FROM	V$BUFFER_POOL;
prompt Done.
