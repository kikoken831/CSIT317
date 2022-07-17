
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sesios.sql
   Task:           To list session input output operations
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	USERNAME		FORMAT A10		HEADING 'User name'
COLUMN	SID			FORMAT 9999		HEADING 'Session id.'
COLUMN	BLOCK_GETS		FORMAT 999,999,999	HEADING 'Block gets'
COLUMN	CONSISTENT_GETS		FORMAT 999,999,999	HEADING 'Consistent gets'
COLUMN	PHYSICAL_READS		FORMAT 999,999,999	HEADING 'Physical reads'
COLUMN	BLOCK_CHANGES		FORMAT 999,999,999	HEADING 'Block changes'
COLUMN	CONSISTENT_CHANGES	FORMAT 999,999,999	HEADING 'Consistent changes'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$SESS_IO.BLOCK_GETS, 
	V$SESS_IO.CONSISTENT_GETS,
	V$SESS_IO.PHYSICAL_READS,
	V$SESS_IO.BLOCK_CHANGES,
	V$SESS_IO.CONSISTENT_CHANGES
FROM	V$SESSION JOIN V$SESS_IO
ON	V$SESSION.SID = V$SESS_IO.SID
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
