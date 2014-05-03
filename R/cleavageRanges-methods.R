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
  return(IRangesList(lapply(sites, function(s) {
    IRanges(start=s[, 1L], end=s[, 2L])
  })))
})

