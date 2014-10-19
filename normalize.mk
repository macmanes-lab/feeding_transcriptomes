#!/usr/bin/make -rRsf

###########################################
###        -usage 'assembly.mk RUN=run CPU=8 MEM=15 READ1=/location/of/read1.fastq READ2=/location/of/read2.fastq'
###         -RUN= name of run
###
############################################


all:$(CURDIR)/10M_corr/10M.corr.inter.norm.fastQ \
$(CURDIR)/20M_corr/20M.corr.inter.norm.fastQ \
$(CURDIR)/50M_corr/50M.corr.inter.norm.fastQ \
$(CURDIR)/75M_corr/75M.corr.inter.norm.fastQ \
$(CURDIR)/100M_corr/100M.corr.inter.norm.fastQ

C=50
NORM_K=25

samp := 10M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &

samp := 20M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &

samp := 50M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &

samp := 75M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &

samp := 100M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &