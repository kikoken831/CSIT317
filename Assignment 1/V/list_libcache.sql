
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    list_libcache.sql
   Task:           To list library cache
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 	OFF
SET VERIFY	OFF
SET LINESIZE 	100
SET PAGESIZE 	600
COLUMN	NAMESPACE		FORMAT A15		HEADING 'Namespace'
COLUMN	GETS			FORMAT 999,999		HEADING 'Get|requests'
COLUMN	GETHITS			FORMAT 999,999		HEADING 'Get hits'
COLUMN	GETHITRATIO		FORMAT 9.99		HEADING 'Get hit|ratio'
COLUMN	PINS			FORMAT 999,999,999	HEADING 'Pin|requests'
COLUMN	PINHITS			FORMAT 999,999,999	HEADING 'Pin hits'
COLUMN	PINHITRATIO		FORMAT 9.99		HEADING 'Pin hit|ratio'
COLUMN	RELOADS			FORMAT 999,999		HEADING 'Number of|reloads'
COLUMN	INVALIDATIONS		FORMAT 999,999		HEADING 'Number of|invalidations'
SELECT 	V$LIBRARYCACHE.NAMESPACE,
	V$LIBRARYCACHE.GETS,
	V$LIBRARYCACHE.GETHITS,
	V$LIBRARYCACHE.GETHITRATIO,
	V$LIBRARYCACHE.PINS,
	V$LIBRARYCACHE.PINHITS,
	V$LIBRARYCACHE.PINHITRATIO,
	V$LIBRARYCACHE.RELOADS,
	V$LIBRARYCACHE.INVALIDATIONS
FROM	V$LIBRARYCACHE;
prompt Done.
