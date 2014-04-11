context("helper")

test_that(".rxPos", {
  expect_equal(cleaver:::.rxPos(c("foobar", "foobar2"), "\\d"),
               list(integer(), 7))
})

test_that(".substrings", {
  expect_equal(cleaver:::.substrings("foobar", c(3, 5)),
               c("foo", "ba", "r"))
})

