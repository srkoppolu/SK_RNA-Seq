#!/usr/bin/bash


# bash script to align multiple sample files to the reference trnascriptome.

BT2SAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $BT2SAMPLES; do

        bowtie2 -x transcripts -1 ${SAMPLE}_sortmerna_trimmomatic_1.fq.gz -2 ${SAMPLE}_sortmerna_trimmomatic_2.fq.gz -S ${SAMPLE}_sortmerna_trimmomatic_BWAmem_sam

done
