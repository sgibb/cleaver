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

test_that("cleave missedCleavages > 1", {
  peptides <- c(
    "enob"="SITKIKAREILD")
  trypsinMissed2 <- list(
    "enob"=c("SITK", "SITKIK", "SITKIKAR",
             "IKAREILD","AREILD", "EILD"))
  trypsinMissed02 <- list(
    "enob"=c("SITK", "IK", "AR", "EILD", # 0
             "SITK", "SITK", "SITKIK",   # 1
             "IK", "IKAR",  "AR",
             "AREILD", "EILD", "EILD",
             "SITK", "SITKIK",          # 2
             "SITKIKAR", "IKAREILD",
             "AREILD", "EILD"))
  trypsinUniqueMissed02 <- list(
    "enob"=c("SITK", "IK", "AR", "EILD",
             "SITKIK", "IKAR", "AREILD",
             "SITKIKAR", "IKAREILD"))

  expect_equal(cleave(peptides, "trypsin", missedCleavages=2), trypsinMissed2)
  expect_equal(cleave(peptides, "trypsin", missedCleavages=0:2),
               trypsinMissed02)
  expect_equal(cleave(peptides, "trypsin", missedCleavages=0:2, unique=TRUE),
               trypsinUniqueMissed02)
})

