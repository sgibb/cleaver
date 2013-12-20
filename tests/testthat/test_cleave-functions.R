context("cleave")

test_that("cleave", {
  peptides <- c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV")
  trypsin <- list(
    "gaju"=c("LAAGK", "VEDSD"),
    "pnm"=c("AGEPK", "LDAGV"))
  trypsinMissed1 <- list(
    "gaju"=c("LAAGKVEDSD"),
    "pnm"=c("AGEPKLDAGV"))
  trypsinMissed01 <- list(
    "gaju"=c("LAAGK", "VEDSD", "LAAGKVEDSD"),
    "pnm"=c("AGEPK", "LDAGV", "AGEPKLDAGV"))
  pepsin <- list(
    "gaju"="LAAGKVEDSD",
    "pnm"=c("AGEPKL", "DAGV"))
  expect_equal(cleave(peptides, "trypsin"), trypsin)
  expect_equal(cleave(peptides, "trypsin", missedCleavages=1), trypsinMissed1)
  expect_equal(cleave(peptides, "trypsin", missedCleavages=0:1),
               trypsinMissed01)
  expect_equal(cleave(peptides, "pepsin"), pepsin)
})

