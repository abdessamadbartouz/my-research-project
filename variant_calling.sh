#!/bin/bash
# Variant calling using bcftools
# Input: mapped/*.sorted.bam
# Output: variants/*.vcf

mkdir -p ~/klebsiella_project/variants

for bam in ~/klebsiella_project/mapped/*.sorted.bam; do
    base=$(basename $bam .sorted.bam)
    echo "Calling variants for $base ..."
    bcftools mpileup -Ou -f ~/klebsiella_project/reference/GCF_000016305.1_ASM1630v1_genomic.fna $bam | \
    bcftools call -mv -Ov -o ~/klebsiella_project/variants/${base}.vcf
done
