#!/bin/bash
# Map reads to reference using BWA

mkdir -p ~/klebsiella_project/mapped

for f in ~/klebsiella_project/cleaned_data/*.clean.fastq.gz; do
  base=$(basename $f .clean.fastq.gz)
  bwa mem ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna $f > ~/klebsiella_project/mapped/${base}.sam
done
