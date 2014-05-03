context("cleave methods")

test_that("cleave character", {
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
  expect_equal(cleave("AKAKBKCK", unique=TRUE)[[1]], c("AK", "BK", "CK"))
})

test_that("cleave AAString", {
  peptides <- list(
    AAString("LAAGKVEDSD"),
    AAString("AGEPKLDAGV"))
  trypsin <- list(
    AAStringSet(c("LAAGK", "VEDSD")),
    AAStringSet(c("AGEPK", "LDAGV")))
  trypsinMissed1 <- list(
    AAStringSet(c("LAAGKVEDSD")),
    AAStringSet(c("AGEPKLDAGV")))
  trypsinMissed01 <- list(
    AAStringSet(c("LAAGK", "VEDSD", "LAAGKVEDSD")),
    AAStringSet(c("AGEPK", "LDAGV", "AGEPKLDAGV")))
  pepsin <- list(
    AAStringSet("LAAGKVEDSD"),
    AAStringSet(c("AGEPKL", "DAGV")))
  for (i in seq(along=peptides)) {
    resultTrypsin <- cleave(peptides[[i]], "trypsin")
    resultTrypsin1 <- cleave(peptides[[i]], "trypsin", missedCleavages=1)
    resultTrypsin01 <- cleave(peptides[[i]], "trypsin", missedCleavages=0:1)
    resultPepsin <- cleave(peptides[[i]], "pepsin")

    expect_true(is(resultTrypsin, "AAStringSet"))
    expect_true(is(resultTrypsin1, "AAStringSet"))
    expect_true(is(resultTrypsin01, "AAStringSet"))
    expect_true(is(resultPepsin, "AAStringSet"))

    expect_equal(as.character(resultTrypsin),
                 as.character(trypsin[[i]]))
    expect_equal(as.character(resultTrypsin1),
                 as.character(trypsinMissed1[[i]]))
    expect_equal(as.character(resultTrypsin01),
                 as.character(trypsinMissed01[[i]]))
    expect_equal(as.character(resultPepsin),
                 as.character(pepsin[[i]]))
  }
})

test_that("cleave AAStringSet", {
  peptides <- AAStringSet(c(
    "gaju"="LAAGKVEDSD",
    "pnm"="AGEPKLDAGV"))
  trypsin <- AAStringSetList(
    "gaju"=c("LAAGK", "VEDSD"),
    "pnm"=c("AGEPK", "LDAGV"))
  trypsinMissed1 <- AAStringSetList(
    "gaju"=c("LAAGKVEDSD"),
    "pnm"=c("AGEPKLDAGV"))
  trypsinMissed01 <- AAStringSetList(
    "gaju"=c("LAAGK", "VEDSD", "LAAGKVEDSD"),
    "pnm"=c("AGEPK", "LDAGV", "AGEPKLDAGV"))
  pepsin <- AAStringSetList(
    "gaju"="LAAGKVEDSD",
    "pnm"=c("AGEPKL", "DAGV"))

  resultTrypsin <- cleave(peptides, "trypsin")
  resultTrypsin1 <- cleave(peptides, "trypsin", missedCleavages=1)
  resultTrypsin01 <- cleave(peptides, "trypsin", missedCleavages=0:1)
  resultPepsin <- cleave(peptides, "pepsin")

  expect_true(is(resultTrypsin, "AAStringSetList"))
  expect_true(is(resultTrypsin1, "AAStringSetList"))
  expect_true(is(resultTrypsin01, "AAStringSetList"))
  expect_true(is(resultPepsin, "AAStringSetList"))

  expect_equal(as.character(unlist(resultTrypsin)),
               as.character(unlist(trypsin)))
  expect_equal(as.character(unlist(resultTrypsin1)),
               as.character(unlist(trypsinMissed1)))
  expect_equal(as.character(unlist(resultTrypsin01)),
               as.character(unlist(trypsinMissed01)))
  expect_equal(as.character(unlist(resultPepsin)),
               as.character(unlist(pepsin)))
})

test_that("cleave missedCleavages > 1", {
  peptides <- c(
    "enob"="SITKIKAREILD")
  trypsinMissed2 <- list(
    "enob"=c("SITKIKAR", "IKAREILD"))
  trypsinMissed02 <- list(
    "enob"=c("SITK", "IK", "AR", "EILD", # 0
             "SITKIK", "IKAR", "AREILD", # 1
             "SITKIKAR", "IKAREILD"))    # 2

  expect_equal(cleave(peptides, "trypsin", missedCleavages=2), trypsinMissed2)
  expect_equal(cleave(peptides, "trypsin", missedCleavages=0:2),
               trypsinMissed02)
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

