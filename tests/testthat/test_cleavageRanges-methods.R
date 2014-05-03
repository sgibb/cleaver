context("cleavageRanges methods")

test_that("cleavageRanges character", {
  peptides <- c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV")
  trypsin <- list(
    "gaju"=matrix(c(1, 6, 5, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))),
    "pnm"=matrix(c(1, 6, 5, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))))
  trypsinMissed1 <- list(
    "gaju"=matrix(c(1, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))),
    "pnm"=matrix(c(1, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))))
  trypsinMissed01 <- list(
    "gaju"=matrix(c(1, 6, 1, 5, 10, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))),
    "pnm"=matrix(c(1, 6, 1, 5, 10, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))))
  pepsin <- list(
    "gaju"=matrix(c(1, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))),
    "pnm"=matrix(c(1, 7, 6, 10), ncol=2,
                  dimnames=list(c(), c("start", "end"))))
  expect_equal(cleavageRanges(peptides, "trypsin"), trypsin)
  expect_equal(cleavageRanges(peptides, "trypsin", missedCleavages=1),
               trypsinMissed1)
  expect_equal(cleavageRanges(peptides, "trypsin", missedCleavages=0:1),
               trypsinMissed01)
  expect_equal(cleavageRanges(peptides, "pepsin"), pepsin)
})

test_that("cleavageRanges AAString", {
  peptides <- list(
    AAString("LAAGKVEDSD"),
    AAString("AGEPKLDAGV"))
  trypsin <- list(
    "gaju"=IRanges(start=c(1, 6), end=c(5, 10)),
    "pnm"=IRanges(start=c(1, 6), end=c(5, 10)))
  trypsinMissed1 <- list(
    "gaju"=IRanges(start=1, end=10),
    "pnm"=IRanges(start=1, end=10))
  trypsinMissed01 <- list(
    "gaju"=IRanges(start=c(1, 6, 1), end=c(5, 10, 10)),
    "pnm"=IRanges(start=c(1, 6, 1), end=c(5, 10, 10)))
  pepsin <- list(
    "gaju"=IRanges(start=1, end=10),
    "pnm"=IRanges(start=c(1, 7), end=c(6, 10)))
  for (i in seq(along=peptides)) {
    resultTrypsin <- cleavageRanges(peptides[[i]], "trypsin")
    resultTrypsin1 <- cleavageRanges(peptides[[i]], "trypsin",
                                     missedCleavages=1)
    resultTrypsin01 <- cleavageRanges(peptides[[i]], "trypsin",
                                      missedCleavages=0:1)
    resultPepsin <- cleavageRanges(peptides[[i]], "pepsin")

    expect_true(is(resultTrypsin, "IRanges"))
    expect_true(is(resultTrypsin1, "IRanges"))
    expect_true(is(resultTrypsin01, "IRanges"))
    expect_true(is(resultPepsin, "IRanges"))

    expect_equal(resultTrypsin, trypsin[[i]])
    expect_equal(resultTrypsin1, trypsinMissed1[[i]])
    expect_equal(resultTrypsin01, trypsinMissed01[[i]])
    expect_equal(resultPepsin, pepsin[[i]])
  }
})

test_that("cleavageRanges AAStringSet", {
  peptides <- AAStringSet(c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV"))
  trypsin <- IRangesList(
    "gaju"=IRanges(start=c(1, 6), end=c(5, 10)),
    "pnm"=IRanges(start=c(1, 6), end=c(5, 10)))
  trypsinMissed1 <- IRangesList(
    "gaju"=IRanges(start=1, end=10),
    "pnm"=IRanges(start=1, end=10))
  trypsinMissed01 <- IRangesList(
    "gaju"=IRanges(start=c(1, 6, 1), end=c(5, 10, 10)),
    "pnm"=IRanges(start=c(1, 6, 1), end=c(5, 10, 10)))
  pepsin <- IRangesList(
    "gaju"=IRanges(start=1, end=10),
    "pnm"=IRanges(start=c(1, 7), end=c(6, 10)))

  resultTrypsin <- cleavageRanges(peptides, "trypsin")
  resultTrypsin1 <- cleavageRanges(peptides, "trypsin", missedCleavages=1)
  resultTrypsin01 <- cleavageRanges(peptides, "trypsin", missedCleavages=0:1)
  resultPepsin <- cleavageRanges(peptides, "pepsin")

  expect_true(is(resultTrypsin, "IRangesList"))
  expect_true(is(resultTrypsin1, "IRangesList"))
  expect_true(is(resultTrypsin01, "IRangesList"))
  expect_true(is(resultPepsin, "IRangesList"))

  expect_equal(resultTrypsin, trypsin)
  expect_equal(resultTrypsin1, trypsinMissed1)
  expect_equal(resultTrypsin01, trypsinMissed01)
  expect_equal(resultPepsin, pepsin)
})

