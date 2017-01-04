setMethod(f="cleavageSites",
          signature=signature(x="character"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(.cleavageSites(x=x, enzym=enzym, custom=custom))
})

setMethod(f="cleavageSites",
          signature=signature(x="AAString"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(.cleavageSites(x=as.character(x),
                        enzym=enzym,
                        custom=custom))
})

setMethod(f="cleavageSites",
          signature=signature(x="AAStringSet"),
          definition=function(x, enzym="trypsin", custom=NULL) {
  return(.cleavageSites(x=as.character(x),
                        enzym=enzym,
                        custom=custom))
})

