```markdown
# Klebsiella pneumoniae Pediatric Cardiac Unit Outbreak Project

This repository contains the bioinformatics workflow for analyzing **Klebsiella pneumoniae** isolates from a pediatric cardiac unit outbreak. It includes scripts and QC reports to reproduce the analysis pipeline.

> Note: Raw FASTQ files, cleaned FASTQ files, mapped BAMs, and VCFs are **not included** due to size. Only reference genome, QC reports, and scripts are provided.

---

## Project Structure

```

klebsiella_project/
│
├─ scripts/               # QC, mapping, and variant calling commands
│   ├─ qc.sh
│   ├─ mapping.sh
│   └─ variant_calling.sh
│
├─ reports/               # fastp QC reports (HTML & JSON)
│   ├─ SRR32026272.html
│   ├─ SRR32026272.json
│   └─ ...
│
├─ reference/             # Reference genome
│   └─ GCF_000016305.1_ASM1630v1_genomic.fna
│
└─ README.md

```

---

## Data Sources

The WGS data were downloaded from **NCBI SRA**:

| Sample ID      | SRA Accession |
|----------------|---------------|
| SRR32026272    | [Link](https://www.ncbi.nlm.nih.gov/sra/SRR32026272) |
| SRR32026273    | [Link](https://www.ncbi.nlm.nih.gov/sra/SRR32026273) |
| ...            | ...           |

Reference genome:  
**Klebsiella pneumoniae ASM1630v1**  
`GCF_000016305.1_ASM1630v1_genomic.fna`  
Available from [NCBI](https://www.ncbi.nlm.nih.gov/assembly/GCF_000016305.1/).

---

## Included Files

* `scripts/` — contains all command scripts for QC, mapping, and variant calling.
* `reports/` — contains fastp HTML and JSON QC reports.
* `reference/` — contains the reference genome.

> All other intermediate or large files (FASTQ, BAM, VCF) are **not included**.

---

## How to Reproduce Analysis

1. **Quality Control (QC)**:  

Use `scripts/qc.sh` to run **fastp** on your local FASTQ files. QC reports will be similar to those included in `reports/`.

2. **Mapping to Reference**:  

Use `scripts/mapping.sh` to map cleaned FASTQs to the reference genome using **BWA MEM** and **samtools**.

3. **Variant Calling**:  

Use `scripts/variant_calling.sh` to call SNPs and small indels using **bcftools**.

> Note: You will need to provide local copies of FASTQ files to generate BAMs and VCFs.

---

## Future Steps

1. Variant filtering (quality & depth)  
2. Multi-sample VCF generation  
3. SNP matrix construction  
4. Phylogenetic tree and outbreak cluster analysis  

---

## References

* [fastp](https://github.com/OpenGene/fastp) — QC  
* [BWA MEM](http://bio-bwa.sourceforge.net/) — Mapping  
* [Samtools](http://www.htslib.org/) — BAM manipulation  
* [Bcftools](http://www.htslib.org/) — Variant calling
```
