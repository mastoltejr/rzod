test_that("never() rejects everything", {
  expect_error(z.parse(44,z.never()))
  expect_error(z.parse(T,z.never()))
  expect_error(z.parse(Sys.Date(),z.never()))
})

test_that("never() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.never()))
})

test_that("never() rejects NA", {
  expect_error(z.parse(NA,z.never()))
})
