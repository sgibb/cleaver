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

setMethod(f="cleavageSites",
          signature=signature(x="character"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(.cleavageSites(x=x, enzym=enzym, custom=custom))
})

setMethod(f="cleavageSites",
          signature=signature(x="AAString"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(cleavageSites(AAStringSet(x), enzym=enzym, custom=custom))
})

setMethod(f="cleave",
          signature=signature(x="AAStringSet"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(Biostrings::AAStringSetList(cleavageSites(as.character(x), enzym=enzym,
                                                   custom=custom)))
})

