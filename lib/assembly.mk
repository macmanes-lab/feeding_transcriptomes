#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk CPU=8
###         -RUN= name of run
###
############################################

samp10 := 10M
samp20 := 20M
samp50 := 50M
samp100 := 100M

all:\
$(CURDIR)/$(samp10).P2/Trinity.fasta \
$(CURDIR)/$(samp20).P2/Trinity.fasta \
$(CURDIR)/$(samp50).P2/Trinity.fasta \
$(CURDIR)/$(samp100).P2/Trinity.fasta \
$(CURDIR)/$(samp10).ec.P2/Trinity.fasta \
$(CURDIR)/(samp20).ec.P2/Trinity.fasta \
$(CURDIR)/$(samp50).ec.P2/Trinity.fasta \
$(CURDIR)/$(samp100).ec.P2/Trinity.fasta \
$(CURDIR)/$(samp10).ec.P2.C50/Trinity.fasta \
$(CURDIR)/$(samp20).ec.P2.C50/Trinity.fasta \
$(CURDIR)/$(samp50).ec.P2.C50/Trinity.fasta \
$(CURDIR)/$(samp100).ec.P2.C50/Trinity.fasta

CPU=20

#######
## Assemble RAW samples.
#######

$(CURDIR)/$(samp10).P2/Trinity.fasta:\
/mnt/data3/macmanes/subsamp/$(samp10)_corr/raw.$(samp10).SRR797058_1.fastq.gz /mnt/data3/macmanes/subsamp/$(samp10)_corr/raw.$(samp10).SRR797058_2.fastq.gz
    Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $< \
    --right $(word 2,$^) \
    --CPU $(CPU) --output trinity_$(samp10).P2 --inchworm_cpu 10 --full_cleanup \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"


$(CURDIR)/$(samp20).P2/Trinity.fasta:\
/mnt/data3/macmanes/subsamp/20M_corr/raw.20M.SRR797058_1.fastq.gz /mnt/data3/macmanes/subsamp/20M_corr/raw.20M.SRR797058_2.fastq.gz
    Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $< \
    --right $(word 2,$^) \
    --CPU $(CPU) --output trinity_$(samp20).P2 --inchworm_cpu 10 --full_cleanup \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

$(CURDIR)/$(samp50).P2/Trinity.fasta:\
/mnt/data3/macmanes/subsamp/50M_corr/raw.50M.SRR797058_1.fastq.gz /mnt/data3/macmanes/subsamp/50M_corr/raw.50M.SRR797058_2.fastq.gz
    Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $< \
    --right $(word 2,$^) \
    --CPU $(CPU) --output trinity_$(samp50).P2 --inchworm_cpu 10 --full_cleanup \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

$(CURDIR)/$(samp100).P2/Trinity.fasta:\
/mnt/data3/macmanes/subsamp/100M_corr/raw.100M.SRR797058_1.fastq.gz /mnt/data3/macmanes/subsamp/100M_corr/raw.100M.SRR797058_2.fastq.gz
    Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU $(CPU) --output trinity_$(samp100).P2 --inchworm_cpu 10 --full_cleanup \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"



#######
## Assemble EC samples.
#######

$(CURDIR)/$(samp20).ec.P2/Trinity.fasta:\
$(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.2.corrected.fastq.gz
	Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU $(CPU) --output $(samp20).ec.P2 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

$(CURDIR)/$(samp100).ec.P2/Trinity.fasta:\
$(CURDIR)/$(samp100)_corr/$(samp100)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp100)_corr/$(samp100)_corrk19.2.corrected.fastq.gz
	Trinity --seqType fq --max_memory 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU $(CPU) --output $(samp100).ec.P2 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

#######
## Assemble Normalized samples.
#######

$(CURDIR)/$(samp20).ec.P2.C50/Trinity.fasta:\
$(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.norm.fastQ.gz
	Trinity --seqType fq --max_memory 50G --trimmomatic \
    --single $< \
    --run_as_paired \
    --CPU $(CPU) --output $(samp20).ec.P2.C50 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

$(CURDIR)/$(samp100).ec.P2.C50/Trinity.fasta:\
$(CURDIR)/$(samp100)_corr/$(samp100).corr.inter.norm.fastQ.gz
	Trinity --seqType fq --max_memory 50G --trimmomatic \
    --single $< \
    --run_as_paired \
    --CPU $(CPU) --output $(samp100).ec.P2.C50 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"
