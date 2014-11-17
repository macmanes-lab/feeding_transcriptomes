#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk RUN=run CPU=8 MEM=15 READ1=/location/of/read1.fastq READ2=/location/of/read2.fastq'
###         -RUN= name of run
###
############################################


all:\
$(CURDIR)/$(samp20)_corr/$(samp20).ec.P2/Trinity.fasta
$(CURDIR)/$(samp100)_corr/$(samp100).ec.P2/Trinity.fasta
$(CURDIR)/20M.ec.P2.C50/Trinity.fasta \
$(CURDIR)/100M.ec.P2.C50/Trinity.fasta

CPU=32

samp20 := 20M
$(CURDIR)/$(samp20)_corr/$(samp20).ec.P2/Trinity.fasta:\
$(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.2.corrected.fastq.gz
	Trinity --seqType fq --JM 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU $(CPU) --output $(samp20).ec.P2 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

samp100 := 100M
$(CURDIR)/$(samp100)_corr/$(samp100).ec.P2/Trinity.fasta:\
$(CURDIR)/$(samp100)_corr/$(samp100)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp100)_corr/$(samp100)_corrk19.2.corrected.fastq.gz
	Trinity --seqType fq --JM 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU $(CPU) --output $(samp100).ec.P2 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

#######
## Assemble Normalized samples.
#######

$(CURDIR)/$(samp20).ec.P2.C50/Trinity.fasta:\
$(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.norm.fastQ.gz
	Trinity --seqType fq --JM 50G --trimmomatic \
    --single $< \
    --run_as_paired \
    --CPU $(CPU) --output $(samp20).ec.P2.C50 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"

$(CURDIR)/$(samp100).ec.P2.C50/Trinity.fasta:\
$(CURDIR)/$(samp100)_corr/$(samp100).corr.inter.norm.fastQ.gz
	Trinity --seqType fq --JM 50G --trimmomatic \
    --single $< \
    --run_as_paired \
    --CPU $(CPU) --output $(samp100).ec.P2.C50 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"
