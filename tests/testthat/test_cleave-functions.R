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

test_that("cleave custom rules", {
  peptides <- c(
    "enob"="SITKIKAREILD")
  custom1 <- list(
    "enob"=c("SITK", "IK", "AREILD"))
  custom2 <- list(
    "enob"=c("SITK", "IKAREILD"))
  custom3 <- list(
    "enob"=c("SI", "TK", "I", "K", "AREI", "LD"))

  expect_error(cleave(peptides, custom=LETTERS[1:4]),
               "has to be of length 1 or 2")
  expect_error(cleave(peptides, custom=1:2), "has to be of type .*character.*")

  expect_equal(cleave(peptides, custom="K"), custom1)
  expect_equal(cleave(peptides, custom=c("K", "KA")), custom2)
  expect_equal(cleave(peptides, custom="[KI]"), custom3)
})

