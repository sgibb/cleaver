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

## helper functions
.cleavePos <- function(x, pattern, exception) {
  pos <- .rxPos(x, pattern=pattern)

  if (!missing(exception) && !is.na(exception)) {
    pos <- mapply(setdiff, x=pos, y=.rxPos(x, pattern=exception),
                  SIMPLIFY=FALSE)
  }

  pos
}

.rxPos <- function(x, pattern) {
  rx <- gregexpr(pattern=pattern, text=x, perl=TRUE)
  lapply(rx, function(x)as.vector(x[x > 0L]))
}

.substring <- function(x, pos) {
  pStart <- c(1L, pos+1L)
  pEnd <- c(pos, nchar(x))
  substring(x, pStart, pEnd)
}

.unlist <- function(x) {
  unlist(x=x, recursive=FALSE, use.names=FALSE)
}

