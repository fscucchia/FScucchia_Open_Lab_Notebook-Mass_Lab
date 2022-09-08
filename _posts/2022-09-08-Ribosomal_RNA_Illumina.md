---
layout: post
title: Detection of ribosomal RNA from Illumina sequencing reads
category: [Sequencing, Transcriptome, Protocol ]
tags: [ Coral, Bioinformatics, Porites lutea ]
---

This protocol details the steps and code used to detect and quantify ribosomal RNA in Illumina sequencing reads. Coral RNA samples were sequenced using an Illumina Stranded mRNA workflow (polyA enrichment).

### Install all necessary programs within your conda environment
Here I'm using [SortMeRNA](https://github.com/biocore/sortmerna), a local sequence alignment tool used for filtering rRNA from metatranscriptomic data. 
SortMeRNA takes as input files of reads and one or multiple rRNA database file(s), and sorts apart aligned and rejected reads. SortMeRNA works with Illumina, Ion Torrent and PacBio data, and can produce SAM and BLAST-like alignments.

```
conda activate qualityfilt
conda install sortmerna

# test the installation
sortmerna --version
#SortMeRNA version 4.3.6

# view help
sortmerna -h
```

### Run the rRNA filtering
For SortMeRNA the only required options are ```--ref``` and ```--reads```. Both plain fasta/fastq and archived fasta.gz/fastq.gz files are accepted.
For the rRNA database, I downloaded the [Silva](https://www.arb-silva.de/) rRNA database from the SortMeRNA [4.3.4 release](https://github.com/biocore/sortmerna/releases).

###### Usage:
```
# single reference and single reads file
sortmerna --ref REF_PATH --reads READS_PATH

# for multiple references use multiple '--ref'
sortmerna --ref REF_PATH_1 --ref REF_PATH_2 --ref REF_PATH_3 --reads READS_PATH

# for paired reads use '--reads' twice
sortmerna --ref REF_PATH_1 --ref REF_PATH_2 --ref REF_PATH_3 --reads READS_PATH_1 --reads READS_PATH_2
```
I created the following .sh script and ran it using the [Hive](https://hivehpc.haifa.ac.il/) shell, a high performance computing system of the Faculty of Natural Sciences at University of Haifa.
```
#!/bin/sh

O="/Home/output/sortMeRNA"
ref1="/Home/databases/silva_rRNA/smr_v4.3_default_db.fasta"
ref2="/Home/databases/silva_rRNA/smr_v4.3_fast_db.fasta"
ref3="/Home/databases/silva_rRNA/smr_v4.3_sensitive_db.fasta"
ref4="/Home/databases/silva_rRNA/smr_v4.3_sensitive_db_rfam_seeds.fasta"
read1="/Home/pathToRead/readName_L001_R1.fastq.gz"
read2="/Home/pathToRead/readName_L001_R2.fastq.gz"
read3="/Home/pathToRead/readName_L001_R1.fastq.gz"
read4="/Home/pathToRead/readName_L001_R2.fastq.gz"
read5="/Home/pathToRead/readName_L001_R2.fastq.gz"
read6="/Home/pathToRead/readName_L001_R1.fastq.gz"
read7="/Home/pathToRead/readName_L001_R2.fastq.gz"
read8="/Home/pathToRead/readName_L001_R1.fastq.gz"
read9="/Home/pathToRead/readName_L001_R2.fastq.gz"
read10="/Home/pathToRead/readName_L001_R1.fastq.gz"
read11="/Home/pathToRead/readName_L001_R2.fastq.gz"
read12="/Home/pathToRead/readName_L001_R1.fastq.gz"
read13="/Home/pathToRead/readName_L001_R2.fastq.gz"
read14="/Home/pathToRead/readName_L001_R1.fastq.gz"
read15="/Home/pathToRead/readName_L001_R2.fastq.gz"
read16="/Home/pathToRead/readName_L001_R1.fastq.gz"

if [ $1 -eq 1 ]; then
     sbatch --mem=128000 -N1 -n20 --ntasks-per-node=20 --job-name "sortRNA" -o "$O/sortRNA.out" -e "$O/sortRNA.err" \
     -p hive7d,preempt7d,preempt31d,hiveunlim,queen \
  	 	--wrap ". $CONDA; conda activate qualityfilt 
          sortmerna --workdir $O --ref $ref1 --ref $ref2 --ref $ref3 --ref $ref4 --reads $read1 --reads $read2 --reads $read3 --reads $read4 --reads $read5 --reads $read6 --reads $read7 --reads $read8 --reads $read9 --reads $read10 --reads $read11 --reads $read12 --reads $read13 --reads $read14 --reads $read15 --reads $read16 --fastx --log; conda deactivate"     

fi
```



