setMethod(f="cleave",
          signature=signature(x="character"),
          definition=function(x, enzym="trypsin", missedCleavages=0,
                              custom=NULL, unique=TRUE) {
  return(.cleave(x=x,
                 enzym=enzym,
                 missedCleavages=missedCleavages,
                 custom=custom,
                 unique=unique))
})

setMethod(f="cleave",
          signature=signature(x="AAString"),
          definition=function(x, enzym="trypsin", missedCleavages=0,
                              custom=NULL, unique=TRUE) {
  return(AAStringSet(.unlist(.cleave(x=as.character(x),
                                     enzym=enzym,
                                     missedCleavages=missedCleavages,
                                     custom=custom,
                                     unique=unique))))
})

setMethod(f="cleave",
          signature=signature(x="AAStringSet"),
          definition=function(x, enzym="trypsin", missedCleavages=0,
                              custom=NULL, unique=TRUE) {
  return(AAStringSetList(.cleave(x=as.character(x),
                                 enzym=enzym,
                                 missedCleavages=missedCleavages,
                                 custom=custom,
                                 unique=unique)))
})

