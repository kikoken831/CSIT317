
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_instance.sql
   Task:           To list database instance
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	INSTANCE_NAME		FORMAT A6		HEADING 'Instance|name'
COLUMN	HOST_NAME		FORMAT A20		HEADING 'Host|name'
COLUMN	VERSION_NAME		FORMAT A12		HEADING 'Version'
COLUMN	STARTUP			FORMAT A12		HEADING 'Startup|date'
COLUMN	STATUS			FORMAT A10		HEADING 'Instance|status'
COLUMN	DATABASE_STATUS		FORMAT A10		HEADING 'Database|status'
SELECT 	V$INSTANCE.INSTANCE_NAME, 
	V$INSTANCE.HOST_NAME,
	V$INSTANCE.VERSION,
	TO_CHAR(V$INSTANCE.STARTUP_TIME,'DD-MON-YYYY-HH-MM-SS') STARTUP,
	V$INSTANCE.STATUS,
	V$INSTANCE.DATABASE_STATUS
FROM	V$INSTANCE;
prompt Done.
