.cleave <- function(x, enzym="trypsin", missedCleavages=0L,
                    custom=NULL, unique=TRUE) {

  pos <- .cleavageRanges(x=x, enzym=enzym, custom=custom, missedCleavages)

  peptides <- mapply(function(xx, r)substring(xx, r[,1L], r[,2L]),
                     xx=x, r=pos, SIMPLIFY=FALSE, USE.NAMES=TRUE)

  if (unique) {
    peptides <- lapply(peptides, unique)
  }
  return(peptides)
}

