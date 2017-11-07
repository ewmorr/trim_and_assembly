#!/bin/bash

FORWARD=$1
REVERSE=$2

nohup trimmomatic PE -threads 8 $FORWARD $REVERSE\
	paired_$FORWARD unpaired_$FORWARD\
	paired_$REVERSE unpaired_$REVERSE\
	ILLUMINACLIP:/opt/Trimmomatic-0.32/adapters/NexteraPE-PE.fa:2:30:10\
	SLIDINGWINDOW:4:15 MINLEN:36 &



