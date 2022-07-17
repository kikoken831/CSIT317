
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_log.sql
   Task:           To list log
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	GROUP#			FORMAT 9999999		HEADING 'Log|group|number'
COLUMN	THREAD#			FORMAT 9999999		HEADING 'Log|thread|number'
COLUMN	SEQUENCE#		FORMAT 9999999		HEADING 'Log|sequence|number'
COLUMN	BYTES			FORMAT 999,999,999	HEADING 'Log|size'
COLUMN	MEMBERS			FORMAT 9999999		HEADING 'Total|members'
COLUMN	ARCHIVED		FORMAT A7		HEADING 'Archive|status'
COLUMN	STATUS			FORMAT A8		HEADING 'Log|status'
COLUMN	FIRST_CHANGE#		FORMAT 9999999		HEADING 'First|SCN'
COLUMN	FIRST			FORMAT A20		HEADING 'Time of first|SCN'
SELECT 	V$LOG.GROUP#, 
	V$LOG.THREAD#,
	V$LOG.SEQUENCE#,
	V$LOG.BYTES,
	V$LOG.MEMBERS,
	V$LOG.ARCHIVED,
	V$LOG.STATUS,
	V$LOG.FIRST_CHANGE#,
	TO_CHAR(V$LOG.FIRST_TIME,'DD-MON-YYYY:HH:MI:SS') FIRST
FROM	V$LOG;
prompt Done.
