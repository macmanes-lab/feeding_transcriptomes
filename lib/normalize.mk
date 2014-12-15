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

samp10 := 10M
$(CURDIR)/$(samp10)_corr/$(samp10).corr.inter.norm.fastQ:\
$(CURDIR)/$(samp10)_corr/$(samp10)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp10)_corr/$(samp10)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp10): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp10)_corr/$(samp10).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp10)_corr/$(samp10).corr.inter.fastQ
	gzip $(CURDIR)/$(samp10)_corr/$(samp10).corr.inter.fastQ &

samp20 := 20M
$(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.norm.fastQ:\
$(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp20)_corr/$(samp20)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp20): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.fastQ
	gzip $(CURDIR)/$(samp20)_corr/$(samp20).corr.inter.fastQ &

samp50 := 50M
$(CURDIR)/$(samp50)_corr/$(samp50).corr.inter.norm.fastQ:\
$(CURDIR)/$(samp50)_corr/$(samp50)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp50)_corr/$(samp50)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp50): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp50)_corr/$(samp50).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp50)_corr/$(samp50).corr.inter.fastQ
	gzip $(CURDIR)/$(samp50)_corr/$(samp50).corr.inter.fastQ &

samp75 := 75M
$(CURDIR)/$(samp75)_corr/$(samp75).corr.inter.norm.fastQ:\
$(CURDIR)/$(samp75)_corr/$(samp75)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp75)_corr/$(samp75)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp75): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp75)_corr/$(samp75).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp75)_corr/$(samp75).corr.inter.fastQ
	gzip $(CURDIR)/$(samp75)_corr/$(samp75).corr.inter.fastQ &

samp := 100M
$(CURDIR)/$(samp)_corr/$(samp).corr.inter.norm.fastQ:\
$(CURDIR)/$(samp)_corr/$(samp)_corrk19.1.corrected.fastq.gz $(CURDIR)/$(samp)_corr/$(samp)_corrk19.2.corrected.fastq.gz
	@echo '\n\n'BEGIN NORMALIZATION for $(samp): `date +'%a %d%b%Y  %H:%M:%S'`
	@echo Settings used: normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9
	interleave-reads.py $^ -o $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	normalize-by-median.py -p -k $(NORM_K) -C $(C) -N 4 -x 15e9 --out $@ $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ
	gzip $(CURDIR)/$(samp)_corr/$(samp).corr.inter.fastQ &