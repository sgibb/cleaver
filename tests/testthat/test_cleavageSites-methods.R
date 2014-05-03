context("cleavageSites methods")

test_that("cleavageSites character", {
  peptides <- c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV")
  trypsin <- list(
    "gaju"=5,
    "pnm"=5)
  pepsin <- list(
    "gaju"=integer(),
    "pnm"=6)
  expect_equal(cleavageSites(peptides, "trypsin"), trypsin)
  expect_equal(cleavageSites(peptides, "pepsin"), pepsin)
})

test_that("cleavageSites AAString", {
  peptides <- list(
    AAString("LAAGKVEDSD"),
    AAString("AGEPKLDAGV"))
  trypsin <- list(
    "LAAGKVEDSD"=5,
    "AGEPKLDAGV"=5)
  pepsin <- list(
    "LAAGKVEDSD"=integer(),
    "AGEPKLDAGV"=6)
  expect_equal(cleavageSites(peptides[[1]], "trypsin"), trypsin[1])
  expect_equal(cleavageSites(peptides[[2]], "trypsin"), trypsin[2])
  expect_equal(cleavageSites(peptides[[1]], "pepsin"), pepsin[1])
  expect_equal(cleavageSites(peptides[[2]], "pepsin"), pepsin[2])
})

test_that("cleavageSites AAStringSet", {
  peptides <- AAStringSet(c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV"))
  trypsin <- list(
    "gaju"=5,
    "pnm"=5)
  pepsin <- list(
    "gaju"=integer(),
    "pnm"=6)
  expect_equal(cleavageSites(peptides, "trypsin"), trypsin)
  expect_equal(cleavageSites(peptides, "pepsin"), pepsin)
})

test_that("cleavageSites custom rules", {
  peptides <- c(
    "enob"="SITKIKAREILD")
  custom1 <- list(
    "enob"=c(4, 6))
  custom2 <- list(
    "enob"=4)
  custom3 <- list(
    "enob"=c(2, 4, 5, 6, 10))

  expect_error(cleavageSites(peptides, custom=LETTERS[1:4]),
               "has to be of length 1 or 2")
  expect_error(cleavageSites(peptides, custom=1:2),
               "has to be of type .*character.*")

  expect_equal(cleavageSites(peptides, custom="K"), custom1)
  expect_equal(cleavageSites(peptides, custom=c("K", "KA")), custom2)
  expect_equal(cleavageSites(peptides, custom="[KI]"), custom3)
})

