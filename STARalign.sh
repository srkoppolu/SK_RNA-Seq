#!/usr/bin/bash

# Generating genome indices

STAR --runMode genomeGenerate --genomeDir indices/genome --genomeFastaFiles genome.fa --runThreadN 16 --sjdbOverhang 99 --sjdbGTFfile genome.gff3


# bash script to align multiple sample files to the STAR indexed genome.

STARSAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $STARSAMPLES; do

     STAR --genomeDir indices/genome --readFilesIn ${SAMPLE}_sortmerna_trimmomatic_1.fq.gz ${SAMPLE}_sortmerna_trimmomatic_2.fq.gz --runThreadN 16 --sjdbGTFfile genome.gff3 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix results/${SAMPLE}_sortmerna_trimmomatic_STAR_

done
