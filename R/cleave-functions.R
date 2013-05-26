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

cleave <- function(x, enzym="trypsin", missedCleavages=0) {

  enzym <- match.arg(tolower(enzym), names(rules), several.ok=FALSE)

  pos <- .cleavePos(x, pattern=rules[enzym], exception=exceptions[enzym])

  peptides <- mapply(function(y, p) {
    pStart <- c(1, p+1)
    pEnd <- c(pStart[-1]-1, nchar(y))
    return(substring(y, pStart, pEnd))
  }, y=x, p=pos, SIMPLIFY=FALSE)

  if (any(missedCleavages != 0)) {
    missedCleavages <- missedCleavages+1
    peptides <- lapply(peptides, function(p) {
      n <- length(p)
      idx <- 1:n
      p <- unlist(lapply(missedCleavages, function(m) {
        if (n >= m) {
          comb <- embed(idx, m)
          return(apply(comb, 1, function(i){paste0(p[rev(i)], collapse="")}))
        }
      }))
    })
  }

  return(peptides)
}

