
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     4.2
   Title:          How to investigate the dynamic performance views (V$ views) ?
   Script name:    creafstat.sql
   Task:           To create FSTAT_TABLE table
   Created by:     Janusz R. Getta
   Created on:	   31 May 2014
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET VERIFY ON
SET LINESIZE 100
SET PAGESIZE 100
CREATE TABLE FSTAT_TABLE(
FILE#		NUMBER		NOT NULL,
PHYRDS		NUMBER		NOT NULL,
PHYWRTS		NUMBER		NOT NULL,
PHYBLKRD	NUMBER		NOT NULL,
PHYBLKWRT	NUMBER		NOT NULL,
SINGLEBLKRDS	NUMBER		NOT NULL,
  CONSTRAINT FSTAT_TABLE_PKEY 
	PRIMARY KEY(FILE#) );
prompt Done.
