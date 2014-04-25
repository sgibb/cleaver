context("helper")

test_that(".rxPos", {
  expect_equal(cleaver:::.rxPos(c("foobar", "foobar2"), "\\d"),
               list(integer(), 7))
})

test_that(".substrings", {
  expect_equal(cleaver:::.substrings("foobar", c(3, 5)),
               c("foo", "ba", "r"))
})

test_that(".formatMemoryUsage", {
  expect_equal(
    cleaver:::.formatMemoryUsage(object.size(character(1L))*1024L^(0:8)),
    c("96 B", "96 KiB", "96 MiB", "96 GiB", "96 TiB", "96 PiB", "96 EiB",
      "96 ZiB", "96 YiB"))
})

test_that(".testMemoryUsage", {
  msg <- paste0("You ask for 2 missing cleavages. ",
                "That will result in 4 peptides and will use nearly 384 B")
  expect_null(cleaver:::.testMemoryUsage(list(1:2), 1:2, c(100, 200)))
  expect_null(cleaver:::.testMemoryUsage(list(1:1000), 0, c(100, 200)))
  expect_error(cleaver:::.testMemoryUsage(list(1:3), 1:2, c(100, 200)), msg)
  expect_warning(cleaver:::.testMemoryUsage(list(1:3), 1:2, c(300, 400)), msg)
})

