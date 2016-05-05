# cleaver
[![build status](https://travis-ci.org/sgibb/cleaver.svg?branch=master)](https://travis-ci.org/sgibb/cleaver?branch=master)
[![codecov.io](https://img.shields.io/codecov/c/github/sgibb/cleaver.svg?branch=master)](https://codecov.io/github/sgibb/cleaver/?branch=master)
[![license](http://img.shields.io/badge/license-GPL%20%28%3E=%203%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

[![years in bioc](http://bioconductor.org/shields/years-in-bioc/cleaver.svg)](http://bioconductor.org/packages/release/bioc/html/cleaver.html)
[![bioc downloads](http://bioconductor.org/shields/downloads/cleaver.svg)](http://bioconductor.org/packages/stats/bioc/cleaver.html)
Release: [![build release](http://bioconductor.org/shields/build/release/bioc/cleaver.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/cleaver/)
Devel: [![build devel](http://bioconductor.org/shields/build/devel/bioc/cleaver.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/cleaver/)

## Description

This package cleaves polypeptide sequences. The
cleavage rules are taken from:
http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html

cleaver is part of [Bioconductor](http://bioconductor.org/packages/release/bioc/html/cleaver.html).

## Install development version (not recommended)

```s
install.packages("devtools")
library("devtools")
install_github("cleaver", "sgibb")
```

## Usage

```s
## load library
library("cleaver")

## Gastric juice peptide 1 (UniProtKB/Swiss-Prot: GAJU_HUMAN/P01358)
gaju <- "LAAGKVEDSD"

cleave(gaju, "trypsin")
# $LAAGKVEDSD
# [1] "LAAGK" "VEDSD"

cleave(gaju, "trypsin", missedCleavages=1)
# $LAAGKVEDSD
# [1] "LAAGKVEDSD"

cleave(gaju, "trypsin", missedCleavages=0:1)
# $LAAGKVEDSD
# [1] "LAAGK" "VEDSD" "LAAGKVEDSD"

cleave(gaju, "pepsin")
# $LAAGKVEDSD
# [1] "LAAGKVEDSD"
# (no cleavage)
```

