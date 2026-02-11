#!/bin/bash
# Mapping cleaned FASTQ files to reference genome using BWA MEM
# Input: cleaned_data/*.clean.fastq.gz
# Output: mapped/*.sorted.bam and .bai

mkdir -p ~/klebsiella_project/mapped

# Index reference if not already done
bwa index ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna
samtools faidx ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna

for f in ~/klebsiella_project/cleaned_data/*.clean.fastq.gz; do
    base=$(basename $f .clean.fastq.gz)
    echo "Mapping $base ..."
    bwa mem ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna $f | \
    samtools sort -o ~/klebsiella_project/mapped/${base}.sorted.bam
    samtools index ~/klebsiella_project/mapped/${base}.sorted.bam
done
