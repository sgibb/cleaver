\name{cleave}
\alias{cleave}
\title{Cleavage of polypeptide sequences}
\usage{
  cleave(x, enzym = "trypsin")
}
\arguments{
  \item{x}{\code{character}, polypeptide sequences.}

  \item{enzym}{\code{character}, cleavage rule.}
}
\value{
  a \code{list} of splitted polypeptides.
}
\description{
  This function cleaves polypeptide sequences.
}
\details{
  The cleavage rules are taken from:
  \url{http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}

  Cleavage rules (cleavage between P1 and P1'):
  \tabular{llllllll}{ Name \tab Enzyme name \tab P4 \tab P3
  \tab P2 \tab P1 \tab P1' \tab P2' \cr
  \code{chymotrypsin-high} \tab Chymotrypsin-high
  specificity (C-term to [FYW], not before P) \tab - \tab -
  \tab - \tab F or Y \tab not P \tab - \cr \tab \tab - \tab
  - \tab - \tab W \tab not M or P \tab - \cr
  \code{chymotrypsin-low} \tab Chymotrypsin-low specificity
  (C-term to [FYWML], not before P) \tab - \tab - \tab -
  \tab F,L or Y \tab not P \tab - \cr \tab \tab - \tab -
  \tab - \tab W \tab not M or P \tab - \cr \tab \tab - \tab
  - \tab - \tab M \tab not P or Y \tab - \cr \tab \tab -
  \tab - \tab - \tab H \tab not D,M,P or W \tab - \cr
  \code{pepsin1.3} \tab Pepsin (pH1.3) \tab - \tab not H,K,
  or R \tab not P \tab not R \tab F,L,W or Y \tab not P \cr
  \tab \tab - \tab not H,K, or R \tab not P \tab F,L,W or Y
  \tab - \tab not P \cr \code{pepsin} \tab Pepsin (pH>2)
  \tab - \tab not H,K or R \tab not P \tab not R \tab F or
  L \tab not P \cr \tab \tab - \tab not H,K or R \tab not P
  \tab F or L \tab - \tab not P \cr }

  Exceptions: \tabular{llllllll}{ Name \tab Enzyme name
  \tab P4 \tab P3 \tab P2 \tab P1 \tab P1' \tab P2' \cr
  trypsin \tab Trypsin \tab - \tab - \tab C or D \tab K
  \tab D \tab - \cr \tab \tab - \tab - \tab C \tab K \tab H
  or Y \tab - \cr \tab \tab - \tab - \tab C \tab R \tab K
  \tab - \cr \tab \tab - \tab - \tab R \tab R \tab H or R
  \tab - \cr }
}
\examples{
library("cleaver")

## Gastic juice peptide 1 (UniProtKB/Swiss-Prot: GAJU_HUMAN/P01358)
gaju <- "LAAGKVEDSD"

cleave(gaju, "trypsin")
# $LAAGKVEDSD
# [1] "LAAGK" "VEDSD"

cleave(gaju, "pepsin")
# $LAAGKVEDSD
# [1] "LAAGKVEDSD"
# (no cleavage)
}
\author{
  Sebastian Gibb
}
\references{
  \url{http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}
}

