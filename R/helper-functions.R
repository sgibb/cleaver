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
