
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_seswaits.sql
   Task:           To list session wait states
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
COLUMN	STATE			FORMAT A20		HEADING 'Wait state'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$SESSION_WAIT.EVENT, 
	V$SESSION_WAIT.WAIT_CLASS, 
	V$SESSION_WAIT.STATE
FROM	V$SESSION JOIN V$SESSION_WAIT
ON	V$SESSION.SID = V$SESSION_WAIT.SID
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
