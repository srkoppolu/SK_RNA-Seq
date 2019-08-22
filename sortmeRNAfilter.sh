#!/usr/bin/bash


# bash script to run sortmeRNA for each individual sample file.

sortmernaSAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $sortmernaSAMPLES; do

     # Run sortmerna for each individual sample
sortmerna --ref $SORTMERNA_DB --reads ${SAMPLE}_merged.fq --paired_in -a 16 --log --fastx --aligned ${SAMPLE}_rRNA --other ${SAMPLE}_sortmerna 

     # Unmerge the paired reads
unmerge-paired-reads.sh ${SAMPLE}_sortmerna.fq ${SAMPLE}_sortmerna_1.fq ${SAMPLE}_sortmerna_2.fq


done
