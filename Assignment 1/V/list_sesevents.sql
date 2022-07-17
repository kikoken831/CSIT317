
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sesevents.sql
   Task:           To list session events
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
COLUMN	EVENT			FORMAT A30		HEADING 'Wait event'
COLUMN	WAIT_CLASS		FORMAT A13		HEADING 'Wait class'
COLUMN	TOTAL_WAITS		FORMAT 999,999,999	HEADING 'Total|waits'
COLUMN	TIME_WAITED_MICRO	FORMAT 999,999,999	HEADING 'Time|waited|(microsec)'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$SESSION_EVENT.EVENT, 
	V$SESSION_EVENT.WAIT_CLASS, 
	V$SESSION_EVENT.TOTAL_WAITS,
	V$SESSION_EVENT.TIME_WAITED_MICRO
FROM	V$SESSION JOIN V$SESSION_EVENT
ON	V$SESSION.SID = V$SESSION_EVENT.SID
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
