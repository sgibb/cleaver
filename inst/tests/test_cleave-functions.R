context("cleave")

test_that("cleave", {
  peptides <- c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV")
  trypsin <- list(
    "gaju"=c("LAAGK", "VEDSD"),
    "pnm"=c("AGEPK", "LDAGV"))
  pepsin <- list(
    "gaju"="LAAGKVEDSD",
    "pnm"=c("AGEPKL", "DAGV"))
  expect_equal(cleave(peptides, "trypsin"), trypsin)
  expect_equal(cleave(peptides, "pepsin"), pepsin)
})

