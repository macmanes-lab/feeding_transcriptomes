#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk RUN=run CPU=8 MEM=15 READ1=/location/of/read1.fastq READ2=/location/of/read2.fastq'
###         -RUN= name of run
###
############################################


all:$(CURDIR)/10M_corr/10M.ec.P2/Trinity.fasta \
$(CURDIR)/20M_corr/10M.ec.P2/Trinity.fasta \
$(CURDIR)/50M_corr/10M.ec.P2/Trinity.fasta \
$(CURDIR)/75M_corr/10M.ec.P2/Trinity.fasta \
$(CURDIR)/100M_corr/10M.ec.P2/Trinity.fasta \

K=19

samp10 := 10M
$(CURDIR)/$(samp10)_corr/$(samp10).ec.P2/Trinity.fasta:\
$(CURDIR)/$(samp10)_corr/$(samp10)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp10)_corr/$(samp10)_corrk19.2.corrected.fastq.gz
	Trinity --seqType fq --JM 50G --trimmomatic \
    --left $<  \
    --right $(word 2,$^) \
    --CPU 24 --output $(samp10).ec.P2 \
    --quality_trimming_params "ILLUMINACLIP:$(CURDIR)/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"























