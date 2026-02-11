#!/bin/bash
# Quality control with fastp

mkdir -p ~/klebsiella_project/cleaned_data
mkdir -p ~/klebsiella_project/reports

for f in ~/klebsiella_project/raw_data/*.fastq.gz; do
  base=$(basename $f .fastq.gz)
  fastp \
    -i $f \
    -o ~/klebsiella_project/cleaned_data/${base}.clean.fastq.gz \
    -h ~/klebsiella_project/reports/${base}.html \
    -j ~/klebsiella_project/reports/${base}.json
done
