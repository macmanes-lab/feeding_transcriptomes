Proper Care and Feeding of Your Transcriptome
-----

***NOTE: this is a work in progress. The instructions below are not guaranteed to work until the paper is submitted.***

This is the home of our paper, *Proper Care and Feeding of Your Transcriptome*, by:

- Richard Smith-Unna (@blahah)
- Matt MacManes (@PeroMHC)

## Description

In this paper, we review best practice in de-novo transcriptome assembly from planning the sequencing experiment through to a final annotated assembly.

The paper incudes some novel analysis, and we have done our best to make the entire paper [data acquisition, analysis, figure generation and paper rendering] reproducible. See below for instructions on reproducing the analysis.

## Instructions

### System requirements

To run the assembly stages of the analysis you'll need at least 256GB of RAM and around 1TB of disk space.

If you only want to build the figures and paper from the pre-generated assembly data, any modern desktop or laptop computer will be fine.

### Installation

You'll need ruby (>= 2.0) installed.

**If you already have ruby >= 2.0**, simply install the paper app:

```bash
$ gem install txome-feeding-paper
```

**If you don't already have ruby**, you can install the latest ruby and the paper app at the same time on Linux and OSX using RVM with this one-line command:

```bash
$ \curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=txome-feeding-paper
```

Finally, the paper depends on specific versions of some software. You can install these packages yourself and place them in your PATH. Or you can let the app install them for you:

```bash
$ txome-feeding-paper --install-deps
```

### Running the paper

To regenerate the entire paper including all analysis, simply run the app:

```bash
$ txome-feeding-paper
```

If you only want to recreate a part of the paper, you can specify what part to run. To see the available options, run the app with the `--help` flag:

```bash
$ txome-feeding-paper --help
```
