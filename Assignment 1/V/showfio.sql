
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    showfio.sql
   Task:           To list file input output operations
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO 		OFF
SET FEEDBACK		ON
SET LINESIZE		100
SET PAGESIZE 		300
COLUMN FILE#		FORMAT 99 	 	HEADING "File|number"
COLUMN PHYRDS		FORMAT 999,999,999 	HEADING "Physical|reads"
COLUMN PHYWRTS		FORMAT 999,999,999	HEADING "Physical|writes"
COLUMN PHYBLKRD		FORMAT 999,999,999 	HEADING "Physical|block reads"
COLUMN PHYBLKWRT	FORMAT 999,999,999 	HEADING "Physical|block writes"
COLUMN SINGLEBLKRDS	FORMAT 999,999,999	HEADING "Single|block reads"

ACCEPT SCRIPT		CHAR PROMPT 'Script name>'
SET TERMOUT		OFF
CONNECT SYSTEM/oracle
TRUNCATE TABLE FSTAT_TABLE;

INSERT INTO FSTAT_TABLE (
	SELECT	FILE#,
 		PHYRDS,
 		PHYWRTS,
 		PHYBLKRD,
		PHYBLKWRT,
		SINGLEBLKRDS
	FROM  	V$FILESTAT);
COMMIT;

CONNECT tpchr/oracle
@&SCRIPT

SET TERMOUT		ON

CONNECT SYSTEM/oracle
SELECT	V$FILESTAT.FILE# FILE#,
	V$FILESTAT.PHYRDS - FSTAT_TABLE.PHYRDS PHYRDS,
	V$FILESTAT.PHYWRTS - FSTAT_TABLE.PHYWRTS PHYWRTS,
	V$FILESTAT.PHYBLKRD - FSTAT_TABLE.PHYBLKRD PHYBLKRD,
V$FILESTAT.PHYBLKWRT - FSTAT_TABLE.PHYBLKWRT PHYBLKWRT,
V$FILESTAT.SINGLEBLKRDS - FSTAT_TABLE.SINGLEBLKRDS SINGLEBLKRDS
FROM  	V$FILESTAT JOIN FSTAT_TABLE
	ON V$FILESTAT.FILE# = FSTAT_TABLE.FILE#;

SET FEEDBACK 		ON
SET ECHO 		ON;
prompt Done.
