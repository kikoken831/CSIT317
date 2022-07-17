
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_libobj.sql
   Task:           To list object cache
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	100
COLUMN	OWNER			FORMAT A10		HEADING 'Owner name'
COLUMN	NAME			FORMAT A20		HEADING 'Object name'
COLUMN	TYPE			FORMAT A15		HEADING 'Object type'
COLUMN	SHARABLE_MEM		FORMAT 999,999,999	HEADING 'Memory|used'
COLUMN	LOADS			FORMAT 999,999,999	HEADING 'Total|loads'
COLUMN	INVALIDATIONS		FORMAT 999,999,999	HEADING 'Total|invalidations'
ACCEPT 	OWNER 	CHAR	PROMPT 'Owner>'
SELECT 	V$DB_OBJECT_CACHE.OWNER, 
	V$DB_OBJECT_CACHE.NAME, 
	V$DB_OBJECT_CACHE.TYPE, 
	V$DB_OBJECT_CACHE.SHARABLE_MEM, 
	V$DB_OBJECT_CACHE.LOADS,
	V$DB_OBJECT_CACHE.INVALIDATIONS
FROM	V$DB_OBJECT_CACHE
WHERE 	V$DB_OBJECT_CACHE.OWNER = UPPER('&OWNER');
prompt Done.
