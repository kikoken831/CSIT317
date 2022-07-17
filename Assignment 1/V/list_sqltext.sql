
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_sqltext.sql
   Task:           To list SQL text
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	3000
COLUMN	SQL_ID			FORMAT A13		HEADING 'SQL Id.'
COLUMN	COMMAND_TYPE		FORMAT 9999		HEADING 'Statement|type'
COLUMN	PIECE			FORMAT 999		HEADING 'Line#'
COLUMN	SQL_TEXT		FORMAT A64		HEADING 'SQL text'
SELECT 	V$SQLTEXT.SQL_ID,
	V$SQLTEXT.COMMAND_TYPE,
	V$SQLTEXT.PIECE,
	V$SQLTEXT.SQL_TEXT
FROM	V$SQLTEXT
ORDER BY V$SQLTEXT.SQL_ID ASC, V$SQLTEXT.PIECE ASC;
prompt Done.
