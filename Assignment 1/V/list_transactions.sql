
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_transactions.sql
   Task:           To list transactions
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	SES_ADDR		FORMAT 999999		HEADING 'Session|address'
COLUMN	XIDSQN			FORMAT 999999		HEADING 'Sequence|number'
COLUMN	STATUS			FORMAT A8		HEADING 'Status'
COLUMN	START_TIME		FORMAT A20		HEADING 'Start time'
COLUMN	LOG_IO			FORMAT 999,999,999	HEADING 'Logical i/o'
COLUMN	PHY_IO			FORMAT 999,999,999	HEADING 'Physical i/o'
COLUMN	CR_GET			FORMAT 999,999,999	HEADING 'Consistent|gets'
COLUMN	CR_CHANGE		FORMAT 999,999,999	HEADING 'Consistent|changes'
SELECT 	V$TRANSACTION.SES_ADDR,
	V$TRANSACTION.XIDSQN,
	V$TRANSACTION.STATUS,
	V$TRANSACTION.START_TIME,
	V$TRANSACTION.LOG_IO,
	V$TRANSACTION.PHY_IO,
	V$TRANSACTION.CR_GET,
	V$TRANSACTION.CR_CHANGE
FROM	V$TRANSACTION;
prompt Done.
