
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_database.sql
   Task:           To list a database state
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	3000
COLUMN	NAME			FORMAT A8		HEADING 'Database|name'
COLUMN	CREA			FORMAT A12		HEADING 'When|created'
COLUMN	LOG_MODE		FORMAT A6		HEADING 'Log|mode'
COLUMN	CHECKPOINT_CHANGE#	FORMAT 999,999,999	HEADING 'Curent|checkpoint|number'
COLUMN	CURRENT_SCN		FORMAT 999,999,999	HEADING 'Current|system|change|number'
COLUMN	FORCE_LOGGING		FORMAT A8		HEADING 'Force|logging'
COLUMN	PROTECTION_LEVEL	FORMAT A11		HEADING 'Protection|level'
COLUMN	OPEN_MODE		FORMAT A5		HEADING 'Open|mode'
SELECT 	V$DATABASE.NAME,
	TO_CHAR(V$DATABASE.CREATED,'DD-MON-YYYY') CREA,
	V$DATABASE.LOG_MODE,
	V$DATABASE.CHECKPOINT_CHANGE#,
	V$DATABASE.CURRENT_SCN,
	V$DATABASE.FORCE_LOGGING,
	V$DATABASE.PROTECTION_LEVEL,
	V$DATABASE.OPEN_MODE
FROM	V$DATABASE;
prompt Done.
