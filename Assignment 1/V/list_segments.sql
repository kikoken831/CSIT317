
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.1
   Title:          How to trace SQL statements with SYSTIMESTAMP, TIMIMG, and AUTOTRACE options of SQL*Plus ?
   Script name:    list_segments.sql
   Task:           List segments included in a given tablespace
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET FEEDBACK ON
SET VERIFY OFF
SET LINESIZE 300
SET PAGESIZE 100
COLUMN SEGMENT_NAME FORMAT A20 HEADING "Segment|name"
COLUMN SEGMENT_TYPE FORMAT A10 HEADING "Type"
COLUMN TABLESPACE_NAME FORMAT A15 HEADING "Tablespace| name"
COLUMN OWNER FORMAT A10 HEADING "Owner"
COLUMN BYTES FORMAT 9,999,999,999 HEADING "Segment|size(bytes)"
COLUMN BLOCKS FORMAT 9,999,999 HEADING "Segment|size(blocks)"
COLUMN EXTENTS FORMAT 9,999,999 HEADING "Total|extents"
ACCEPT TBSNAME CHAR PROMPT 'TABLESPACE NAME>'
SELECT SEGMENT_NAME, SEGMENT_TYPE, TABLESPACE_NAME,OWNER,
BYTES,BLOCKS,EXTENTS
FROM DBA_SEGMENTS
WHERE TABLESPACE_NAME = UPPER('&TBSNAME');
prompt Done.
