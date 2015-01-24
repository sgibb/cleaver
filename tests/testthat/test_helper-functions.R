context("helper")

test_that(".rxPos", {
  expect_equal(cleaver:::.rxPos(c("foobar", "foobar2"), "\\d"),
               list(integer(), 7))
})

test_that(".pos", {
  m0 <- matrix(c(1, 3, 6, 8, 2, 5, 7, 10), ncol=2L,
               dimnames=list(c(), c("start", "end")))
  m2 <- matrix(c(1, 3, 7, 10), ncol=2L,
               dimnames=list(c(), c("start", "end")))
  m02 <- matrix(c(1, 3, 6, 8, 1, 3, 6, 1, 3, 2, 5, 7, 10, 5, 7, 10, 7, 10),
                ncol=2L, dimnames=list(c(), c("start", "end")))
  m5 <- matrix(c(1, 10), ncol=2L,
               dimnames=list(c(), c("start", "end")))
  expect_equal(cleaver:::.pos(c(2, 5, 7), 10, 0), m0)
  expect_equal(cleaver:::.pos(c(2, 5, 7), 10, 2), m2)
  expect_equal(cleaver:::.pos(c(2, 5, 7), 10, 5), m5)
  expect_equal(cleaver:::.pos(c(2, 5, 7), 10, 0:2), m02)
})

test_that(".sequence", {
  expect_identical(cleaver:::.sequence(1:5), sequence(1:5))
})

test_that(".revsequence", {
  expect_identical(cleaver:::.revsequence(1:5), c(5, 4:5, 3:5, 2:5, 1:5))
})

test_that(".unlist", {
  l <- list(a=1:3, b=1:5, c=LETTERS[1:7])
  nl <- list(a=list(d=1:3, e=LETTERS[1:2]), b=1:5, c=LETTERS[1:7])
  expect_identical(unname(unlist(l)), cleaver:::.unlist(l))
  expect_identical(unlist(nl, use.names=FALSE, recursive=FALSE),
                   cleaver:::.unlist(nl))
})

