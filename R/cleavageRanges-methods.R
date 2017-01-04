setMethod(f="cleavageRanges",
          signature=signature(x="character"),
          definition=function(x, enzym="trypsin", missedCleavages=0L,
                              custom=NULL) {
  return(.cleavageRanges(x=x,
                         enzym=enzym,
                         missedCleavages=missedCleavages,
                         custom=custom))
})

setMethod(f="cleavageRanges",
          signature=signature(x="AAString"),
          definition=function(x, enzym="trypsin", missedCleavages=0L,
                              custom=NULL) {
  sites <- .cleavageRanges(x=as.character(x),
                           enzym=enzym,
                           missedCleavages=missedCleavages,
                           custom=custom)[[1L]]
  return(IRanges(start=sites[, 1L], end=sites[, 2L]))
})

setMethod(f="cleavageRanges",
          signature=signature(x="AAStringSet"),
          definition=function(x, enzym="trypsin", missedCleavages=0L,
                              custom=NULL) {
  sites <- .cleavageRanges(x=as.character(x),
                           enzym=enzym,
                           missedCleavages=missedCleavages,
                           custom=custom)
  nm <- names(x)
  f <- rep.int(seq_along(sites), vapply(sites, nrow, double(1L)))
  sites <- do.call(rbind, sites)
  ir <- IRanges(start = sites[, 1L], end = sites[, 2L])
  return(setNames(split(ir, f), nm))
})

