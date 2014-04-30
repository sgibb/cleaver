context("cleavageSites")

test_that("cleavageSites", {
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

test_that("cleave custom rules", {
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
  expect_error(cleavageSites(peptides, custom=1:2), "has to be of type .*character.*")

  expect_equal(cleavageSites(peptides, custom="K"), custom1)
  expect_equal(cleavageSites(peptides, custom=c("K", "KA")), custom2)
  expect_equal(cleavageSites(peptides, custom="[KI]"), custom3)
})

