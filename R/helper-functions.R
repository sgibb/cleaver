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
  lapply(rx, function(x)as.vector(x[x > 0]))
}

.substrings <- function(x, pos) {
  pStart <- c(1, pos+1)
  pEnd <- c(pos, nchar(x))
  substring(x, pStart, pEnd)
}

.substrings.matrix <- function(x, pos) {
  pStart <- cbind(1, pos+1)
  pEnd <- cbind(pos, nchar(x))
  substring(x, pStart, pEnd)
}

.unlist <- function(x) {
  unlist(x=x, recursive=FALSE, use.names=FALSE)
}

.formatMemoryUsage <- function(x) {
  iec <- c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB")
  l <- trunc(log(x)/log(1024L))
  i <- pmin(l+1L, 9L)

  return(paste(round(x/(1024L^l), digits=3L), iec[i]))
}

.testMemoryUsage <- function(pos, missedCleavages, memoryThreshold) {
  ## estimate memory usage if missedCleavages >= 1
  if (any(missedCleavages > 0L)) {
    n <- sapply(pos, length)
    ncomb <- sum(sapply(missedCleavages+1L, choose, n=n))

    ## roughly estimate memory size (we know it is not correct; R allocates
    ## memory for characters in chunks
    ## (object.size(character(1L)) == object.size(character(2L))) and
    ## we also ignore the memory usage of the list)
    memory <- ncomb*object.size(character(1L))

    level <- sum(memory > memoryThreshold)

    if (level) {
      msg <- paste0("You ask for ", max(missedCleavages), " missing cleavages.",
                    " That will result in ", ncomb, " peptides and will use ",
                    "nearly ", .formatMemoryUsage(memory), " of your memory. ",
                    "Please look at ", sQuote("?cleave"), ".")
      if (level == 1L) {
        warning(msg, immediate.=TRUE)
      } else {
        stop(msg)
      }
    }
  }
  return(NULL)
}

