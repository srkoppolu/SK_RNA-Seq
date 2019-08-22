#!/usr/bin/bash


# bash script to run trimmomatic for each individual sample file.

trimmoSAMPLES = "sample_1 sample_2 sample_3 ... sample_N"

for SAMPLE in $trimmoSAMPLES; do

     # Run trimmomatic for each individual sample
     trimmomatic PE -threads 8 -phred64 sortmerna/${SAMPLE}_sortmerna_1.fq sortmerna/${SAMPLE}_sortmerna_2.fq ${SAMPLE}_sortmerna_trimmomatic_1.fq ${SAMPLE}_sortmerna_unpaired_1.fq ${SAMPLE}_sortmerna_trimmomatic_2.fq ${SAMPLE}_sortmerna_unpaired_2.fq ILLUMINACLIP:/usr/share/Trimmomatic-0.33/adapters/TruSeq3-PE.fa:3:30:10 SLIDINGWINDOW:5:20 MINLEN:50

done
