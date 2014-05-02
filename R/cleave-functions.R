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

.cleave <- function(x, enzym="trypsin", missedCleavages=0L,
                    custom=NULL, unique=TRUE) {

  pos <- .cleavageSites(x=x, enzym=enzym, custom=custom, missedCleavages)

  peptides <- mapply(function(xx, pp)substring(xx, pp[,1L], pp[,2L]),
                     xx=x, pp=pos, SIMPLIFY=FALSE, USE.NAMES=FALSE)

  if (unique) {
    peptides <- lapply(peptides, unique)
  }
  return(peptides)
}

