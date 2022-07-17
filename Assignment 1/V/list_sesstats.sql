
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sesstats.sql
   Task:           To list session statistics
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	1000
COLUMN	USERNAME		FORMAT A30		HEADING 'User name'
COLUMN	SID			FORMAT 9999		HEADING 'Session|id.'
COLUMN	STATISTIC#		FORMAT 9999		HEADING 'Statistic|number'
COLUMN	NAME			FORMAT A30		HEADING 'Statistic name'
COLUMN	VALUE			FORMAT 999,999,999,999	HEADING 'Statistic|value'
ACCEPT 	USER 	CHAR	PROMPT 'User name>'
SELECT 	V$SESSION.USERNAME, 
	V$SESSION.SID, 
	V$SESSTAT.STATISTIC#, 
	V$SESSTAT.VALUE, 
	V$STATNAME.NAME
FROM	V$SESSION JOIN V$SESSTAT
ON	V$SESSION.SID = V$SESSTAT.SID
                  JOIN V$STATNAME
ON	V$SESSTAT.STATISTIC#=V$STATNAME.STATISTIC#
WHERE 	V$SESSION.USERNAME = UPPER('&USER');
prompt Done.
