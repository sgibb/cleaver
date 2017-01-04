if (is.null(getGeneric("cleave"))) {
  setGeneric("cleave", function(x, ...)standardGeneric("cleave"))
}

if (is.null(getGeneric("cleavageRanges"))) {
  setGeneric("cleavageRanges", function(x, ...)standardGeneric("cleavageRanges"))
}

if (is.null(getGeneric("cleavageSites"))) {
  setGeneric("cleavageSites", function(x, ...)standardGeneric("cleavageSites"))
}
