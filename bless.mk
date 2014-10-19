#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk RUN=run CPU=8 MEM=15 READ1=/location/of/read1.fastq READ2=/location/of/read2.fastq'
###         -RUN= name of run
###
############################################


all:$(CURDIR)/10M_corr/10M.1.corrected.fastq.gz $(CURDIR)/10M_corr/10M.2.corrected.fastq.gz
$(CURDIR)/20M_corr/20M.1.corrected.fastq.gz $(CURDIR)/20M_corr/20M.2.corrected.fastq.gz \
$(CURDIR)/50M_corr/50M.1.corrected.fastq.gz $(CURDIR)/50M_corr/50M.2.corrected.fastq.gz \
$(CURDIR)/75M_corr/75M.1.corrected.fastq.gz $(CURDIR)/75M_corr/75M.2.corrected.fastq.gz \
$(CURDIR)/100M_corr/100M.1.corrected.fastq.gz $(CURDIR)/100M_corr/100M.2.corrected.fastq.gz


K=19

samp := 10M
$(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq.gz:\
$(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_1.fastq $(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(CURDIR)/$(samp)_corr/$(samp)
	gzip $(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq &

samp := 20M
$(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq.gz:\
$(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_1.fastq $(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(CURDIR)/$(samp)_corr/$(samp)
	gzip $(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq &

samp := 50M
$(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq.gz:\
$(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_1.fastq $(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(CURDIR)/$(samp)_corr/$(samp)
	gzip $(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq &

samp := 75M
$(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq.gz:\
$(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_1.fastq $(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(CURDIR)/$(samp)_corr/$(samp)
	gzip $(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq &

samp := 100M
$(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq.gz:\
$(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_1.fastq $(CURDIR)/$(samp)_corr/raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(CURDIR)/$(samp)_corr/$(samp)
	gzip $(CURDIR)/$(samp)_corr/$(samp).1.corrected.fastq $(CURDIR)/$(samp)_corr/$(samp).2.corrected.fastq &

#samp := 10M
#Trinity.fasta:$(samp)_corrk19.1.corrected.fastq.gz $(samp)_corrk19.2.corrected.fastq.gz
#	Trinity --seqType fq --JM 50G --trimmomatic \
#    --left $<  \
#    --right $(word 2,$^) \
#    --CPU 24 --output $(samp) \
#    --quality_trimming_params "ILLUMINACLIP:/mnt/data3/macmanes/subsamp/barcodes.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"























