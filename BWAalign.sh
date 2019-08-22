#!/usr/bin/bash

# Generating  transriptome indices

# bash script to align multiple sample files to the reference trnascriptome.

BWASAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $BWASAMPLES; do

        bwa mem indices/transcripts.fa -t 16 ${SAMPLE}_sortmerna_trimmomatic_1.fq.gz ${SAMPLE}_sortmerna_trimmomatic_2.fq.gz | gzip -3 > ${SAMPLE}_sortmerna_trimmomatic_BWAmem_sam.gz

done
