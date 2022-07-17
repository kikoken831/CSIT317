
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sesobjs.sql
   Task:           To list session objects
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	USERNAME	FORMAT A10	HEADING 'User name'
COLUMN	SID		FORMAT 9999	HEADING 'Session id.'
COLUMN	OBJECT		FORMAT A30	HEADING 'Object name'
COLUMN	TYPE		FORMAT A20	HEADING 'Object type'
COLUMN	OWNER		FORMAT A10	HEADING 'Owner name'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$ACCESS.OWNER, 
	V$ACCESS.OBJECT,
	V$ACCESS.TYPE
FROM	V$SESSION JOIN V$ACCESS
ON	V$SESSION.SID = V$ACCESS.SID
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
