#!/bin/bash
set -euo pipefail
gatk=gatk-4.1.2.0/gatk
ref=RefHg38/hg38.fasta
id=DRR002191
raw=${id}.both.vcf.gz
snv=${id}.snv.raw.vcf.gz
indel=${id}.indel.raw.vcf.gz
javaopt="-Xmx4g"

${gatk} --java-options ${javaopt} \
	SelectVariants \
	-R ${ref} \
	-V ${raw} \
	--select-type-to-include SNP \
	-O ${snv}
${gatk} --java-options ${javaopt} \
	SelectVariants \
	-R ${ref} \
	-V ${raw} \
	--select-type-to-include INDEL \
	-O ${indel}
