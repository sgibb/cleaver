## Copyright 2013-2014 Sebastian Gibb
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

.cleave <- function(x, enzym="trypsin", missedCleavages=0L,
                    custom=NULL, unique=TRUE, use.names=TRUE) {

  enzym <- match.arg(tolower(enzym), names(rules), several.ok=FALSE)

  if (is.null(custom)) {
    pattern <- rules[enzym]
    exception <- exceptions[enzym]
  } else {
    if(!length(custom) %in% c(1L, 2L)) {
      stop(sQuote("custom"), " has to be of length 1 or 2!")
    }
    if (!is.character(custom)) {
      stop(sQuote("custom"), " has to be of type ", sQuote("character"), "!")
    }
    pattern <- custom[1L]
    exception <- custom[2L]
  }

  pos <- .cleavePos(x, pattern=pattern, exception=exception)

  peptides <- mapply(.substring, x=x, pos=pos, SIMPLIFY=FALSE)

  if (any(missedCleavages != 0L)) {
    missedCleavages <- missedCleavages+1L
    peptides <- lapply(peptides, function(p) {
      n <- length(p)
      idx <- 1L:n
      p <- .unlist(lapply(missedCleavages, function(m) {
        if (m != 1L && n >= m) {
          comb <- embed(idx, m)
          comb <- comb[, ncol(comb):1L, drop=FALSE]
          p <- apply(comb, 1L, function(i){paste0(p[i], collapse="")})
        } else if (n < m) {
          if (any(missedCleavages < m)) {
            p <- character()
          } else {
            p <- paste0(p, collapse="")
          }
        }
        p
      }))
      if (unique) {
        p <- unique(p)
      }
      p
    })
  } else {
    if (unique) {
      peptides <- lapply(peptides, unique)
    }
  }
  return(peptides)
}

