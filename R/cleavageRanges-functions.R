.cleavageRanges <- function(x, enzym="trypsin", custom=NULL,
                            missedCleavages=0L) {

  sites <- .cleavageSites(x=x, enzym=enzym, custom=custom)

  mapply(.pos, pos=sites, n=nchar(x), MoreArgs=list(m=missedCleavages),
         SIMPLIFY=FALSE, USE.NAMES=TRUE)
}
