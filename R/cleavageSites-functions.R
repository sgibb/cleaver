## Copyright 2014 Sebastian Gibb
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

.cleavageSites <- function(x, enzym="trypsin", custom=NULL) {

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

  nm <- names(x)

  if (!length(nm)) {
    nm <- x
  }
  return(setNames(.cleavePos(x, pattern=pattern, exception=exception), nm))
}

