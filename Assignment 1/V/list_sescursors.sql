
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sescursors.sql
   Task:           To liste session cursors
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	USER_NAME	FORMAT A10	HEADING 'User name'
COLUMN	SID		FORMAT 9999	HEADING 'Session|id.'
COLUMN	SQL_ID		FORMAT A13	HEADING 'Statement Id.'
COLUMN	SQL_TEXT	FORMAT A60	HEADING 'SQL statement (60 chars)'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$OPEN_CURSOR.USER_NAME, 
	V$OPEN_CURSOR.SID, 
	V$OPEN_CURSOR.SQL_ID, 
	V$OPEN_CURSOR.SQL_TEXT
FROM	V$OPEN_CURSOR
WHERE 	V$OPEN_CURSOR.USER_NAME = UPPER('&USER');
prompt Done.
