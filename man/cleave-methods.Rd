\name{cleave-methods}
\docType{methods}
\alias{cleave}
\alias{cleave,character-method}
\alias{cleave,AAString-method}
\alias{cleave,AAStringSet-method}
\alias{cleavageRanges}
\alias{cleavageRanges,character-method}
\alias{cleavageRanges,AAString-method}
\alias{cleavageRanges,AAStringSet-method}
\alias{cleavageSites}
\alias{cleavageSites,character-method}
\alias{cleavageSites,AAString-method}
\alias{cleavageSites,AAStringSet-method}
\title{Cleavage of polypeptide sequences}
\usage{
\S4method{cleave}{character}(x, enzym = "trypsin", missedCleavages = 0,
                             custom = NULL, unique = TRUE)

\S4method{cleave}{AAString}(x, enzym = "trypsin", missedCleavages = 0,
                            custom = NULL, unique = TRUE)

\S4method{cleave}{AAStringSet}(x, enzym = "trypsin", missedCleavages = 0,
                               custom = NULL, unique = TRUE)

\S4method{cleavageRanges}{character}(x, enzym = "trypsin", missedCleavages = 0,
                                     custom = NULL)

\S4method{cleavageRanges}{AAString}(x, enzym = "trypsin", missedCleavages = 0,
                                    custom = NULL)

\S4method{cleavageRanges}{AAStringSet}(x, enzym = "trypsin", missedCleavages = 0,
                                       custom = NULL)

\S4method{cleavageSites}{character}(x, enzym = "trypsin", custom = NULL)

\S4method{cleavageSites}{AAString}(x, enzym = "trypsin", custom = NULL)

\S4method{cleavageSites}{AAStringSet}(x, enzym = "trypsin", custom = NULL)
}
\arguments{
  \item{x}{polypeptide sequences.}

  \item{enzym}{\code{character}, cleavage rule.}

  \item{missedCleavages}{\code{numeric}, number of missed
  cleavages.}

  \item{custom}{\code{character}, of length 1 or 2. Could be used to define own
    cleaveage rules. The first element would be the pattern and the optional
    second element would be an exception (non-cleavage) pattern. Perl-like
    regular expressions are supported, see \code{\link[base:grep]{gregexpr}} for
    details. If \code{custom} is set the \code{enzym} is ignored.}

  \item{unique}{\code{logical}, if \code{TRUE} all duplicated cleavage products
    per peptide are removed.}
}
\value{
  \describe{
    \item{\code{cleave}}{
      If \code{x} is a \code{character} it returns a \code{list} of the same
      length as \code{x}. Each element contains a \code{character} vector with
      the corresponding cleavage products of the polypeptides.
      If \code{x} is an \code{\linkS4class{AAString}} or an
      \code{\linkS4class{AAStringSet}} an
      \code{\linkS4class{AAStringSet}} or an
      \code{\linkS4class{AAStringSetList}} instance of the same length as
      \code{x} is returned.
      Each element contains an
      \code{\linkS4class{AAString}} or an \code{\linkS4class{AAStringSet}}
      instance with the corresponding cleavage products of the polypeptides.
    }
    \item{\code{cleavageRanges}}{
      If \code{x} is a \code{character} it returns a \code{list} of the same
      length as \code{x}. Each element contains a two-column \code{matrix} with
      the start and end positions of the peptides.
      If \code{x} is an \code{\linkS4class{AAString}} or an
      \code{\linkS4class{AAStringSet}} instance an
      \code{\linkS4class{IRanges}} or an \code{\linkS4class{IRangesList}} of the
      same length as \code{x} is returned.
    }
    \item{\code{cleavageSites}}{
      Returns a \code{list} of the same length as \code{x}. Each element
      contains an \code{integer} vector with the cleavage positions.
    }
  }

  Overview:

  \tabular{llll}{
    Input \tab \code{cleave} \tab \code{cleavageRanges}
      \tab \code{cleavageSites} \cr

    \code{character} \tab \code{list} of \code{character}
      \tab \code{list} of \code{matrix}
      \tab \code{list} of \code{integer} \cr

    \code{\linkS4class{AAString}} \tab \code{\linkS4class{AAStringSet}}
      \tab \code{\linkS4class{IRanges}}
      \tab \code{list} of \code{integer} \cr

    \code{\linkS4class{AAStringSet}} \tab \code{\linkS4class{AAStringSetList}}
      \tab \code{\linkS4class{IRangesList}}
      \tab \code{list} of \code{integer} \cr
  }
}
\description{
  This functions cleave polypeptide sequences. Use \code{cleavageSites} to find
  the cleavage sites, \code{cleavageRanges} to find the cleavage
  ranges and \code{cleave} to get the cleavage products.
}
\details{
  The cleavage rules are taken from:
  \url{https://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}

  Cleavage rules (cleavage between P1 and P1'):
  \tabular{llllllll}{
    Rule name \tab P4 \tab P3 \tab P2 \tab P1 \tab P1' \tab P2' \cr
    \code{arg-c proteinase} \tab - \tab - \tab - \tab R \tab - \tab - \cr
    \code{asp-n endopeptidase} \tab - \tab - \tab - \tab - \tab D \tab - \cr
    \code{bnps-skatole-c} \tab - \tab - \tab - \tab W \tab - \tab - \cr
    \code{caspase1} \tab F,W,Y,L \tab - \tab H,A,T \tab D \tab not P,E,D,Q,K,R
      \tab - \cr
    \code{caspase2} \tab D \tab V \tab A \tab D \tab not P,E,D,Q,K,R \tab - \cr
    \code{caspase3} \tab D \tab M \tab Q \tab D \tab not P,E,D,Q,K,R \tab - \cr
    \code{caspase4} \tab L \tab E \tab V \tab D \tab not P,E,D,Q,K,R \tab - \cr
    \code{caspase5} \tab L,W \tab E \tab H \tab D \tab - \tab - \cr
    \code{caspase6} \tab V \tab E \tab H,I \tab D
      \tab not P,E,D,Q,K,R \tab - \cr
    \code{caspase7} \tab D \tab E \tab V \tab D \tab not P,E,D,Q,K,R \tab - \cr
    \code{caspase8} \tab I,L \tab E \tab T \tab D \tab not P,E,D,Q,K,R
      \tab - \cr
    \code{caspase9} \tab L \tab E \tab H \tab D \tab - \tab - \cr
    \code{caspase10} \tab I \tab E \tab A \tab D \tab - \tab - \cr
    \code{chymotrypsin-high} \tab - \tab - \tab - \tab F,Y \tab not P \tab - \cr
    \tab - \tab - \tab - \tab W \tab not M,P \tab - \cr
    \code{chymotrypsin-low} \tab - \tab - \tab - \tab F,L,Y \tab not P
      \tab - \cr
    \tab - \tab - \tab - \tab W \tab not M,P \tab - \cr
    \tab - \tab - \tab - \tab M \tab not P,Y \tab - \cr
    \tab - \tab - \tab - \tab H \tab not D,M,P,W \tab - \cr
    \code{clostripain} \tab - \tab - \tab - \tab R \tab - \tab - \cr
    \code{cnbr} \tab - \tab - \tab - \tab M \tab - \tab - \cr
    \code{enterokinase} \tab D,E \tab D,E \tab D,E \tab K \tab - \tab - \cr
    \code{factor xa} \tab A,F,G,I,L,T,V,M \tab D,E \tab G \tab R \tab -
      \tab - \cr
    \code{formic acid} \tab - \tab - \tab - \tab D \tab - \tab - \cr
    \code{glutamyl endopeptidase} \tab - \tab - \tab - \tab E \tab - \tab - \cr
    \code{granzyme-b} \tab I \tab E \tab P \tab D \tab - \tab - \cr
    \code{hydroxylamine} \tab - \tab - \tab - \tab N \tab G \tab - \cr
    \code{iodosobenzoic acid} \tab - \tab - \tab - \tab W \tab - \tab - \cr
    \code{lysc} \tab - \tab - \tab - \tab K \tab - \tab - \cr
    \code{lysn} \tab - \tab - \tab - \tab - \tab K \tab - \cr
    \code{neutrophil elastase} \tab - \tab - \tab - \tab A,V \tab - \tab - \cr
    \code{ntcb} \tab - \tab - \tab - \tab - \tab C \tab - \cr
    \code{pepsin1.3} \tab - \tab not H,K,R \tab not P \tab not R \tab F,L
      \tab not P \cr
    \code{pepsin} \tab - \tab not H,K,R \tab not P \tab not R \tab F,L,W,Y
      \tab not P \cr
    \tab - \tab not H,K,R \tab not P \tab F,L,W,Y \tab - \tab not P \cr
    \tab - \tab not H,K,R \tab not P \tab F,L \tab - \tab not P \cr
    \code{proline endopeptidase} \tab - \tab - \tab not H,K,R \tab P \tab not P
      \tab - \cr
    \code{proteinase k} \tab - \tab - \tab - \tab A,E,F,I,L,T,V,W,Y \tab -
      \tab - \cr
    \code{staphylococcal peptidase i} \tab - \tab - \tab not E \tab E \tab -
      \tab - \cr
    \code{thermolysin} \tab - \tab - \tab - \tab not D,E \tab A,F,I,L,M,V
      \tab - \cr
    \code{thrombin} \tab - \tab - \tab G \tab R \tab G \tab - \cr
    \tab A,F,G,I,L,T,V,M \tab A,F,G,I,L,T,V,W \tab P \tab R \tab not D,E
      \tab not D,E \cr
    \code{trypsin} \tab - \tab - \tab - \tab K,R \tab not P \tab - \cr
    \tab - \tab - \tab W \tab K \tab P \tab - \cr
    \tab - \tab - \tab M \tab R \tab P \tab - \cr
  }

  Exceptions:
  \tabular{llllllll}{
    Rule name \tab Enzyme name \tab P4 \tab P3 \tab P2 \tab P1 \tab P1'
      \tab P2' \cr
    trypsin \tab - \tab - \tab C,D \tab K \tab D \tab - \cr \tab \tab -
      \tab - \tab C \tab K \tab H,Y \tab - \cr
    \tab \tab - \tab - \tab C \tab R \tab K \tab - \cr
    \tab \tab - \tab - \tab R \tab R \tab H,R \tab - \cr
  }

  \tabular{ll}{
    Rule name \tab Enzyme name \cr
    \code{arg-c proteinase} \tab Arg-C proteinase \cr
    \code{asp-n endopeptidase} \tab Asp-N endopeptidase \cr
    \code{bnps-skatole-c} \tab BNPS-Skatole \cr
    \code{caspase1} \tab Caspase 1 \cr
    \code{caspase2} \tab Caspase 2 \cr
    \code{caspase3} \tab Caspase 3 \cr
    \code{caspase4} \tab Caspase 4 \cr
    \code{caspase5} \tab Caspase 5 \cr
    \code{caspase6} \tab Caspase 6 \cr
    \code{caspase7} \tab Caspase 7 \cr
    \code{caspase8} \tab Caspase 8 \cr
    \code{caspase9} \tab Caspase 9 \cr
    \code{caspase10} \tab Caspase 10 \cr
    \code{chymotrypsin-high}
      \tab Chymotrypsin-high specificity (C-term to [FYW], not before P) \cr
    \code{chymotrypsin-low}
      \tab Chymotrypsin-low specificity (C-term to [FYWML], not before P) \cr
    \code{clostripain} \tab Clostripain (Clostridiopeptidase B) \cr
    \code{cnbr} \tab CNBr \cr
    \code{enterokinase} \tab Enterokinase \cr
    \code{factor xa} \tab Factor Xa \cr
    \code{formic acid} \tab Formic acid \cr
    \code{glutamyl endopeptidase} \tab Glutamyl endopeptidase \cr
    \code{granzyme-b} \tab Granzyme B \cr
    \code{hydroxylamine} \tab Hydroxylamine \cr
    \code{iodosobenzoic acid} \tab Iodosobenzoic acid \cr
    \code{lysc} \tab LysC \cr
    \code{lysn} \tab LysN \cr
    \code{neutrophil elastase} \tab Neutrophil elastase \cr
    \code{ntcb} \tab NTCB (2-nitro-5-thiocyanobenzoic acid) \cr
    \code{pepsin1.3} \tab Pepsin (pH == 1.3) \cr
    \code{pepsin} \tab Pepsin (pH > 2) \cr
    \code{proline endopeptidase} \tab Proline-endopeptidase \cr
    \code{proteinase k} \tab Proteinase K \cr
    \code{staphylococcal peptidase i} \tab Staphylococcal Peptidase I \cr
    \code{thermolysin} \tab Thermolysin \cr
    \code{thrombin} \tab Thrombin \cr
    \code{trypsin} \tab Trypsin \cr
  }
}
\examples{
library("cleaver")

## Gastric juice peptide 1 (UniProtKB/Swiss-Prot: GAJU_HUMAN/P01358)
gaju <- "LAAGKVEDSD"

cleave(gaju, "trypsin")
# $LAAGKVEDSD
# [1] "LAAGK" "VEDSD"

cleavageRanges(gaju, "trypsin")
# $LAAGKVEDSD
#      start end
# [1,]     1   5
# [2,]     6  10

cleavageSites(gaju, "trypsin")
# $LAAGKVEDSD
# [1] 5

cleave(gaju, "trypsin", missedCleavages=1)
# $LAAGKVEDSD
# [1] "LAAGKVEDSD"

cleavageRanges(gaju, "trypsin", missedCleavages=1)
# $LAAGKVEDSD
#      start end
# [1,]     1  10

cleave(gaju, "trypsin", missedCleavages=0:1)
# $LAAGKVEDSD
# [1] "LAAGK" "VEDSD" "LAAGKVEDSD"

cleavageRanges(gaju, "trypsin", missedCleavages=0:1)
# $LAAGKVEDSD
#      start end
# [1,]     1   5
# [2,]     6  10
# [3,]     1  10


cleave(gaju, "pepsin")
# $LAAGKVEDSD
# [1] "LAAGKVEDSD"
# (no cleavage)


## use AAStringSet
gaju <- AAStringSet("LAAGKVEDSD")

cleave(gaju)
# AAStringSetList of length 1
# [["LAAGKVEDSD"]] LAAGK VEDSD


## Beta-enolase (UniProtKB/Swiss-Prot: ENOB_THUAL/P86978)
enob <- "SITKIKAREILD"

cleave(enob, "trypsin")
# $SITKIKAREILD
# [1] "SITK" "IK"   "AR"   "EILD"

cleave(enob, "trypsin", missedCleavages=2)
# $SITKIKAREILD
# [1] "SITKIKAR" "IKAREILD"

cleave(enob, "trypsin", missedCleavages=0:2)
# $SITKIKAREILD
# [1] "SITK"     "IK"       "AR"       "EILD"     "SITKIK"   "IKAR"
# [7] "AREILD"   "SITKIKAR" "IKAREILD"

## define own cleavage rule: cleave at K
cleave(enob, custom="K")
# $SITKIKAREILD
# [1] "SITK"   "IK"     "AREILD"

cleavageRanges(enob, custom="K")
# $SITKIKAREILD
#      start end
# [1,]     1   4
# [2,]     5   6
# [3,]     7  12

## define own cleavage rule: cleave at K but not if followed by A
cleave(enob, custom=c("K", "K(?=A)"))
# $SITKIKAREILD
# [1] "SITK"     "IKAREILD"

cleavageRanges(enob, custom=c("K", "K(?=A)"))
# $SITKIKAREILD
#      start end
# [1,]     1   4
# [2,]     5  12

cleavageSites(enob, custom=c("K", "K(?=A)"))
# $SITKIKAREILD
# [1] 4

}
\author{
  Sebastian Gibb <mail@sebastiangibb.de>
}
\references{
  Gasteiger E., Hoogland C., Gattiker A., Duvaud S.,
  Wilkins M.R., Appel R.D., Bairoch A.; "Protein
  Identification and Analysis Tools on the ExPASy Server".
  (In) John M. Walker (ed): The Proteomics Protocols
  Handbook, Humana Press (2005).\cr
  \url{https://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}
}
\seealso{
\code{\linkS4class{AAString}},
\code{\linkS4class{AAStringSet}},
\code{\linkS4class{AAStringSetList}},
\code{\linkS4class{IRanges}},
\code{\linkS4class{IRangesList}}
}
\keyword{methods}
