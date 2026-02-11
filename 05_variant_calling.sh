#!/bin/bash
# Variant calling with bcftools
mkdir -p ~/klebsiella_project/variants
for f in ~/klebsiella_project/mapped/*.sorted.bam; do
  base=$(basename $f .sorted.bam)
  bcftools mpileup -f ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna $f | \
  bcftools call -mv -Oz -o ~/klebsiella_project/variants/${base}.vcf.gz
done
