.cleavageSites <- function(x, enzym="trypsin", custom=NULL,
                           missedCleavages=0L) {

  enzym <- match.arg(tolower(enzym), names(rules), several.ok=FALSE)

  if (is.null(custom)) {
    pattern <- rules[enzym]
    exception <- exceptions[enzym]
  } else {
    if(!length(custom) %in% c(1L, 2L)) {
      stop(sQuote("custom"), " has to be of length 1 or 2!")
    }
    if (!is.character(custom)) {
      stop(sQuote("custom"), " has to be of type ", sQuote("character"), "!")
    }
    pattern <- custom[1L]
    exception <- custom[2L]
  }

  nm <- names(x)

  if (!length(nm)) {
    nm <- x
  }
  setNames(.cleavagePos(x, pattern=pattern, exception=exception,
                        missedCleavages=missedCleavages), nm)
}
