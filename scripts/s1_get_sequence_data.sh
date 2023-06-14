#!/bin/bash

# download genome data for Lytechinus pictus
datasets download genome accession GCF_015342785.2 --include gff3,rna,cds,protein,genome,seq-report --filename ~/lp/genome/GCF_015342785.2.zip

# these are the steps taken to obtain L. pictus transcript data available on ncbi as of June 2023

esearch -db sra -query PRJNA952574 | efetch -format runinfo > ~/lp/resources/runinfo.csv
cat ~/lp/resources/runinfo.csv | cut -f 1 -d ',' | grep SRR > ~/lp/resources/runids.txt
cat ~/lp/resources/runids.txt | parallel fastq-dump --split-files --outdir ~/lp/transcriptome {}
pigz -5 -p 24 -r ~/lp/transcriptome
