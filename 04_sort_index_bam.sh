#!/bin/bash
# Convert SAM to BAM, sort, and index
for f in ~/klebsiella_project/mapped/*.sam; do
  base=$(basename $f .sam)
  samtools view -bS $f | samtools sort -o ~/klebsiella_project/mapped/${base}.sorted.bam
  samtools index ~/klebsiella_project/mapped/${base}.sorted.bam
done
