#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk RUN=run CPU=8 MEM=15 READ1=/location/of/read1.fastq READ2=/location/of/read2.fastq'
###         -RUN= name of run
###
############################################


all:10M.1.corrected.fastq.gz 10M.2.corrected.fastq.gz
20M.1.corrected.fastq.gz 20M.2.corrected.fastq.gz \
50M.1.corrected.fastq.gz 50M.2.corrected.fastq.gz \
75M.1.corrected.fastq.gz 75M.2.corrected.fastq.gz \
100M.1.corrected.fastq.gz 100M.2.corrected.fastq.gz


K=19

samp := 10M
$(samp).1.corrected.fastq.gz $(samp).2.corrected.fastq.gz:raw.$(samp).SRR797058_1.fastq raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	mkdir -p /mnt/data3/macmanes/subsamp/$(samp)_corr
	cd /mnt/data3/macmanes/subsamp/$(samp)_corr
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(samp)
	gzip $(samp).1.corrected.fastq $(samp).2.corrected.fastq &

samp := 20M
$(samp).1.corrected.fastq.gz $(samp).2.corrected.fastq.gz:raw.$(samp).SRR797058_1.fastq raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	mkdir -p /mnt/data3/macmanes/subsamp/$(samp)_corr
	cd /mnt/data3/macmanes/subsamp/$(samp)_corr
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(samp)
	gzip $(samp).1.corrected.fastq $(samp).2.corrected.fastq &

samp := 50M
$(samp).1.corrected.fastq.gz $(samp).2.corrected.fastq.gz:raw.$(samp).SRR797058_1.fastq raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	mkdir -p /mnt/data3/macmanes/subsamp/$(samp)_corr
	cd /mnt/data3/macmanes/subsamp/$(samp)_corr
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(samp)
	gzip $(samp).1.corrected.fastq $(samp).2.corrected.fastq &

samp := 75M
$(samp).1.corrected.fastq.gz $(samp).2.corrected.fastq.gz:raw.$(samp).SRR797058_1.fastq raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	mkdir -p /mnt/data3/macmanes/subsamp/$(samp)_corr
	cd /mnt/data3/macmanes/subsamp/$(samp)_corr
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(samp)
	gzip $(samp).1.corrected.fastq $(samp).2.corrected.fastq &

samp := 100M
$(samp).1.corrected.fastq.gz $(samp).2.corrected.fastq.gz:raw.$(samp).SRR797058_1.fastq raw.$(samp).SRR797058_2.fastq
	@echo '\n\n'BEGIN ERROR CORRECTION: `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Results will be in a file named *corrected.fastq.gz
	@echo Settings used: bless kmerlength = $(K)
	mkdir -p /mnt/data3/macmanes/subsamp/$(samp)_corr
	cd /mnt/data3/macmanes/subsamp/$(samp)_corr
	bless -kmerlength $(K) -read1 $< -read2 $(word 2,$^) -verify -notrim -prefix $(samp)
	gzip $(samp).1.corrected.fastq $(samp).2.corrected.fastq &
