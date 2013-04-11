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
  \tabular{llllllll}{ Rule name \tab Enzyme name \tab P4
  \tab P3 \tab P2 \tab P1 \tab P1' \tab P2' \cr \code{arg-c
  proteinase} \tab Arg-C proteinase \tab - \tab - \tab -
  \tab R \tab - \tab - \cr \code{asp-n endopeptidase} \tab
  Asp-N endopeptidase \tab - \tab - \tab - \tab - \tab D
  \tab - \cr \code{bnps-skatole-c} \tab BNPS-Skatole \tab -
  \tab - \tab - \tab W \tab - \tab - \cr \code{caspase1}
  \tab Caspase 1 \tab F,W,Y or L \tab - \tab H,A or T \tab
  D \tab not P,E,D,Q,K or R \tab - \cr \code{caspase2} \tab
  Caspase 2 \tab D \tab V \tab A \tab D \tab not P,E,D,Q,K
  or R \tab - \cr \code{caspase3} \tab Caspase 3 \tab D
  \tab M \tab Q \tab D \tab not P,E,D,Q,K or R \tab - \cr
  \code{caspase4} \tab Caspase 4 \tab L \tab E \tab V \tab
  D \tab not P,E,D,Q,K or R \tab - \cr \code{caspase5} \tab
  Caspase 5 \tab L or W \tab E \tab H \tab D \tab - \tab -
  \cr \code{caspase6} \tab Caspase 6 \tab V \tab E \tab H
  or I \tab D \tab not P,E,D,Q,K or R \tab - \cr
  \code{caspase7} \tab Caspase 7 \tab D \tab E \tab V \tab
  D \tab not P,E,D,Q,K or R \tab - \cr \code{caspase8} \tab
  Caspase 8 \tab I or L \tab E \tab T \tab D \tab not
  P,E,D,Q,K or R \tab - \cr \code{caspase9} \tab Caspase 9
  \tab L \tab E \tab H \tab D \tab - \tab - \cr
  \code{caspase10} \tab Caspase 10 \tab I \tab E \tab A
  \tab D \tab - \tab - \cr \code{chymotrypsin-high} \tab
  Chymotrypsin-high specificity (C-term to [FYW], not
  before P) \tab - \tab - \tab - \tab F or Y \tab not P
  \tab - \cr \tab \tab - \tab - \tab - \tab W \tab not M or
  P \tab - \cr \code{chymotrypsin-low} \tab
  Chymotrypsin-low specificity (C-term to [FYWML], not
  before P) \tab - \tab - \tab - \tab F,L or Y \tab not P
  \tab - \cr \tab \tab - \tab - \tab - \tab W \tab not M or
  P \tab - \cr \tab \tab - \tab - \tab - \tab M \tab not P
  or Y \tab - \cr \tab \tab - \tab - \tab - \tab H \tab not
  D,M,P or W \tab - \cr \code{clostripain} \tab Clostripain
  (Clostridiopeptidase B) \tab - \tab - \tab - \tab R \tab
  - \tab - \cr \code{cnbr} \tab CNBr \tab - \tab - \tab -
  \tab M \tab - \tab - \cr \code{enterokinase} \tab
  Enterokinase \tab D or E \tab D or E \tab D or E \tab K
  \tab - \tab - \cr \code{factor xa} \tab Factor Xa \tab
  A,F,G,I,L,T,V or M \tab D or E \tab G \tab R \tab - \tab
  - \cr \code{formic acid} \tab Formic acid \tab - \tab -
  \tab - \tab D \tab - \tab - \cr \code{pepsin1.3} \tab
  Pepsin (pH1.3) \tab - \tab not H,K, or R \tab not P \tab
  not R \tab F,L,W or Y \tab not P \cr \tab \tab - \tab not
  H,K, or R \tab not P \tab F,L,W or Y \tab - \tab not P
  \cr \code{pepsin} \tab Pepsin (pH>2) \tab - \tab not H,K
  or R \tab not P \tab not R \tab F or L \tab not P \cr
  \tab \tab - \tab not H,K or R \tab not P \tab F or L \tab
  - \tab not P \cr \code{trypsin} \tab Trypsin \tab - \tab
  - \tab - \tab K or R \tab not P \tab - \cr \tab \tab -
  \tab - \tab W \tab K \tab P \tab - \cr \tab \tab - \tab -
  \tab M \tab R \tab P \tab - \cr }

  Exceptions: \tabular{llllllll}{ Rule name \tab Enzyme
  name \tab P4 \tab P3 \tab P2 \tab P1 \tab P1' \tab P2'
  \cr trypsin \tab Trypsin \tab - \tab - \tab C or D \tab K
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

