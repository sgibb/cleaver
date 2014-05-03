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
.cleavagePos <- function(x, pattern, exception, missedCleavages) {
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

.pos <- function(pos, n, m) {
  pStart <- c(1L, pos+1L)
  pEnd <- c(pos, n)

  if (any(m > 0)) {
    mn <- length(pos)-m+1L

    i <- which(mn > 0)

    if (length(i)) {
      mn <- mn[i]
      m <- m[i]
      pStart <- pStart[.sequence(mn)]
      pEnd <-  pEnd[m[1L]+.revsequence(mn)]
    } else {
      pStart <- 1L
      pEnd <- n
    }
  }
  matrix(c(pStart, pEnd), ncol=2L, dimnames=list(c(), c("start", "end")))
}

.sequence <- function(nvec) {
  .unlist(lapply(nvec, seq_len))
}

.revsequence <- function(nvec) {
  m <- max(nvec)
  .unlist(lapply(nvec, function(x)seq.int(to=m, length.out=x)))
}

.unlist <- function(x) {
  unlist(x=x, recursive=FALSE, use.names=FALSE)
}

