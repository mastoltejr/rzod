test_that("logical() accepts logicals", {
  expect_equal(z.parse(T,z.logical()), T)
  expect_equal(z.parse(F,z.logical()), F)
})

test_that("logical() rejects not logicals", {
  expect_error(z.parse(44,z.logical()))
  expect_error(z.parse('123',z.logical()))
  expect_error(z.parse(Sys.Date(),z.logical()))
})

test_that("logical() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.logical()))
  expect_error(z.parse(c(T,F),z.logical()))
})

test_that("logical() rejects NA", {
  expect_error(z.parse(as.logical(NA),z.logical()))
})

test_that("z.coerce.logical() coerces to a logical", {
  expect_equal(z.parse('TRUE',z.coerce.logical()), T)
  expect_equal(z.parse('FALSE',z.coerce.logical()), F)
})
