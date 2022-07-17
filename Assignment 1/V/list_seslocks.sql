
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_seslocks.sql
   Task:           To list session locks
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	USERNAME		FORMAT A10		HEADING 'User name'
COLUMN	SID			FORMAT 9999		HEADING 'Session|id.'
COLUMN	TYPE			FORMAT A5		HEADING 'Lock|type'
COLUMN	LMODE			FORMAT 99		HEADING 'Lock|mode'
COLUMN	REQUEST			FORMAT 99		HEADING 'Request|mode'
COLUMN	CTIME			FORMAT 999,999		HEADING 'Time since|granted'
COLUMN	BLOCK			FORMAT 99		HEADING 'Blocking?'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$LOCK.TYPE, 
	V$LOCK.LMODE, 
	V$LOCK.REQUEST,
	V$LOCK.CTIME,
	V$LOCK.BLOCK
FROM	V$SESSION JOIN V$LOCK
ON	V$SESSION.SID = V$LOCK.SID
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
