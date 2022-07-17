
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_process.sql
   Task:           To list processes
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	PID			FORMAT 9999		HEADING 'Oracle|process|identifer'
COLUMN	SPID			FORMAT A12		HEADING 'Operating|system|process|identifier'
COLUMN	USERNAME		FORMAT A7		HEADING 'Operating|system|process|user|name'
COLUMN	SERIAL#			FORMAT 9999		HEADING 'Process|serial|number'
COLUMN	TERMINAL		FORMAT A10		HEADING 'Terminal|identifier'
COLUMN	PGA_USED_MEM		FORMAT 999,999,999	HEADING 'Currently|used|PGA|memory'
COLUMN	PGA_ALLOC_MEM		FORMAT 999,999,999	HEADING 'Currently|allocated|PGA|memory'
COLUMN	PGA_FREEABLE_MEM	FORMAT 999,999		HEADING 'Freeable|PGA|memory'
COLUMN	PGA_MAX_MEM		FORMAT 999,999,999	HEADING 'Maximum|PGA|memory|allocated'
SELECT 	V$PROCESS.PID, 
	V$PROCESS.SPID,
	V$PROCESS.USERNAME,
	V$PROCESS.SERIAL#,
	V$PROCESS.TERMINAL,
	V$PROCESS.PGA_USED_MEM,
	V$PROCESS.PGA_ALLOC_MEM,
	V$PROCESS.PGA_FREEABLE_MEM,
	V$PROCESS.PGA_MAX_MEM
FROM	V$PROCESS;
prompt Done.
