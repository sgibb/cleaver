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

.cleave <- function(x, enzym="trypsin", missedCleavages=0,
                    custom=NULL, unique=FALSE, use.names=TRUE) {

  enzym <- match.arg(tolower(enzym), names(rules), several.ok=FALSE)

  if (is.null(custom)) {
    pattern <- rules[enzym]
    exception <- exceptions[enzym]
  } else {
    if(!length(custom) %in% c(1, 2)) {
      stop(sQuote("custom"), " has to be of length 1 or 2!")
    }
    if (!is.character(custom)) {
      stop(sQuote("custom"), " has to be of type ", sQuote("character"), "!")
    }
    pattern <- custom[1]
    exception <- custom[2]
  }

  pos <- .cleavePos(x, pattern=pattern, exception=exception)

  peptides <- mapply(function(y, p) {
    if (any(missedCleavages > 0)) {
      .pep <- .peptides(x=y, pos=p, missedCleavages=missedCleavages)
    } else {
      .pep <- .substrings(x=y, pos=p)
    }
    if (unique) {
      unique(.pep)
    } else {
      .pep
    }
  }, y=x, p=pos, SIMPLIFY=FALSE)

  if (use.names) {
    if (is.null(names(x))) {
      names(peptides) <- x
    } else {
      names(peptides) <- names(x)
    }
  }

  peptides
}

.peptides <- function(x, pos, missedCleavages) {
  .unlist(lapply(missedCleavages, function(m) {
    if (m == 0) {
      .substrings(x=x, pos=pos)
    } else if (m < length(pos)) {
      .digest(x=x, pos=pos, missedCleavages=m)
    } else {
      x
    }
  }))
}

.digest <- function(x, pos, missedCleavages) {
  n <- length(pos)
  cb <- combn(n, n-missedCleavages)
  cb[] <- pos[cb]
  cb <- t(cb)
  .substrings.matrix(x=x, pos=cb)
}

