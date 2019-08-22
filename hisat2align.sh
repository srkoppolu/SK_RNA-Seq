#!/usr/bin/bash

# bash script to align multiple sample files to the hisat2 indexed genome.

HISAT2SAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $HISAT2SAMPLES; do

     hisat2 -p 11 --dta -x ~/indices/genome -1 ~/samples/${SAMPLE}_sortmerna_trimmomatic_1.fq.gz -2 ~/samples/${SAMPLE}_sortmerna_trimmomatic_2.fq.gz -S ${SAMPLE}_sortmerna_trimmomatic_HISAT2.sam 

done
