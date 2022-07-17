
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_logfile.sql
   Task:           To list log files
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	GROUP#			FORMAT 9999999		HEADING 'Log|group|number'
COLUMN	STATUS			FORMAT A7		HEADING 'Log|status'
COLUMN	TYPE			FORMAT A7		HEADING 'Type of|log file'
COLUMN	MEMBER			FORMAT A60		HEADING 'Rego log member name'
SELECT 	V$LOGFILE.GROUP#, 
	V$LOGFILE.STATUS,
	V$LOGFILE.TYPE,
	V$LOGFILE.MEMBER
FROM	V$LOGFILE;
prompt Done.
