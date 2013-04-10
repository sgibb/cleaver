## Copyright 2013 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## It is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## See <http://www.gnu.org/licenses/>

#' Cleavage of polypeptide sequences
#'
#' This function cleaves polypeptide sequences.
#'
#' @details
#' The cleavage rules are taken from:
#' \url{http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}
#'
#' Cleavage rules (cleavage between P1 and P1'):
#' \tabular{llllllll}{
#' Rule name \tab Enzyme name \tab P4 \tab P3 \tab P2 \tab P1 \tab P1' \tab P2' \cr
#' \code{arg-c} \tab Arg-C proteinase \tab - \tab - \tab - \tab R \tab - \tab - \cr
#' \code{chymotrypsin-high} \tab Chymotrypsin-high specificity (C-term to
#'  [FYW], not before P) \tab - \tab - \tab - \tab F or Y \tab not P \tab - \cr
#'  \tab \tab - \tab - \tab - \tab W \tab not M or P \tab - \cr
#' \code{chymotrypsin-low} \tab Chymotrypsin-low specificity (C-term to
#'  [FYWML], not before P) \tab - \tab - \tab - \tab F,L or Y \tab not P \tab
#'  - \cr
#'  \tab \tab - \tab - \tab - \tab W \tab not M or P \tab - \cr
#'  \tab \tab - \tab - \tab - \tab M \tab not P or Y \tab  - \cr
#'  \tab \tab - \tab - \tab - \tab H \tab not D,M,P or W \tab - \cr
#' \code{pepsin1.3} \tab Pepsin (pH1.3) \tab - \tab not H,K, or R \tab not P
#'  \tab not R \tab F,L,W or Y \tab not P \cr
#'  \tab \tab - \tab not H,K, or R \tab not P \tab F,L,W or Y \tab - \tab not P \cr
#' \code{pepsin} \tab Pepsin (pH>2) \tab - \tab not H,K or R \tab not P \tab
#'  not R \tab F or L \tab not P \cr
#'  \tab \tab - \tab not H,K or R \tab not P \tab F or L \tab - \tab not P \cr
#' \code{trypsin} \tab Trypsin \tab - \tab - \tab - \tab K or R \tab not P
#'  \tab - \cr
#'  \tab \tab - \tab - \tab W \tab K \tab P \tab - \cr
#'  \tab \tab - \tab - \tab M \tab R \tab P \tab - \cr
#' }
#'
#' Exceptions:
#' \tabular{llllllll}{
#' Rule name \tab Enzyme name \tab P4 \tab P3 \tab P2 \tab P1 \tab P1' \tab P2' \cr
#' trypsin \tab Trypsin \tab - \tab - \tab C or D \tab K \tab D \tab - \cr
#'  \tab \tab - \tab - \tab C \tab K \tab H or Y \tab - \cr
#'  \tab \tab - \tab - \tab C \tab R \tab K \tab - \cr
#'  \tab \tab - \tab - \tab R \tab R \tab H or R \tab - \cr
#' }
#'
#' @param x \code{character}, polypeptide sequences.
#' @param enzym \code{character}, cleavage rule.
#'
#' @return a \code{list} of splitted polypeptides.
#' @author Sebastian Gibb
#' @references
#' \url{http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html}
#' @examples
#'
#' library("cleaver")
#'
#' ## Gastic juice peptide 1 (UniProtKB/Swiss-Prot: GAJU_HUMAN/P01358)
#' gaju <- "LAAGKVEDSD"
#'
#' cleave(gaju, "trypsin")
#' # $LAAGKVEDSD
#' # [1] "LAAGK" "VEDSD"
#'
#' cleave(gaju, "pepsin")
#' # $LAAGKVEDSD
#' # [1] "LAAGKVEDSD"
#' # (no cleavage)
#'
#' @rdname cleave-functions
#' @export
cleave <- function(x, enzym="trypsin") {

  enzym <- match.arg(tolower(enzym), names(rules), several.ok=FALSE)

  pos <- .cleavePos(x, pattern=rules[enzym], exception=exceptions[enzym])

  peptides <- mapply(function(y, p) {
    pStart <- c(1, p+1)
    pEnd <- c(pStart[-1]-1, nchar(y))
    return(substring(y, pStart, pEnd))
  }, y=x, p=pos, SIMPLIFY=FALSE)

  return(peptides)
}

