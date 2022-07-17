
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_shserver.sql
   Task:           To list shared server statistics
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	NAME			FORMAT A4		HEADING 'Name'
COLUMN	PADDR			FORMAT 99999999999	HEADING 'Process|address'
COLUMN	STATUS			FORMAT A16		HEADING 'Status'
COLUMN	MESSAGES		FORMAT 999,999,999	HEADING 'Total|messages'
COLUMN	IDLE			FORMAT 999,999,999	HEADING 'Total idle|time'
COLUMN	BUSY			FORMAT 999,999,999	HEADING 'Total busy|time'
COLUMN	REQUESTS		FORMAT 999,999,999	HEADING 'Total number of| requests'
SELECT 	V$SHARED_SERVER.NAME, 
	V$SHARED_SERVER.PADDR,
	V$SHARED_SERVER.STATUS,
	V$SHARED_SERVER.MESSAGES,
	V$SHARED_SERVER.IDLE,
	V$SHARED_SERVER.BUSY,
	V$SHARED_SERVER.REQUESTS
FROM	V$SHARED_SERVER;
prompt Done.
