# cleaver

<!-- badges: start -->
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![build status](https://github.com/sgibb/cleaver/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/sgibb/cleaver/actions)
[![codecov.io](https://img.shields.io/codecov/c/github/sgibb/cleaver.svg?branch=master)](https://codecov.io/github/sgibb/cleaver/?branch=master)
[![license](https://img.shields.io/badge/license-GPL%20%28%3E=%203%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-3.0.html)

[![years in bioc](https://bioconductor.org/shields/years-in-bioc/cleaver.svg)](https://bioconductor.org/packages/release/bioc/html/cleaver.html)
[![Ranking by downloads](http://bioconductor.org/shields/downloads/release/cleaver.svg)](https://bioconductor.org/packages/stats/bioc/cleaver/)
Release: [![build release](https://bioconductor.org/shields/build/release/bioc/cleaver.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/cleaver/)
Devel: [![build devel](https://bioconductor.org/shields/build/devel/bioc/cleaver.svg)](https://bioconductor.org/checkResults/devel/bioc-LATEST/cleaver/)
<!-- badges: end -->

## Description

This package cleaves polypeptide sequences. The
cleavage rules are taken from:
https://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html

cleaver is part of [Bioconductor](https://bioconductor.org/packages/release/bioc/html/cleaver.html).

## Install development version (not recommended)

```r
install.packages("devtools")
library("devtools")
install_github("sgibb/cleaver")
```

## Usage

```r
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

