test_that("number() accepts strings", {
  expect_equal(z.parse(55,z.number()), 55)
})

test_that("number() rejects not numbers", {
  expect_error(z.parse('123',z.number()))
  expect_error(z.parse(T,z.number()))
  expect_error(z.parse(Sys.Date(),z.number()))
})

test_that("number() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.number()))
})

test_that("number() rejects NA", {
  expect_error(z.parse(as.character(NA),z.number()))
})

test_that("z.coerce.number() coerces to a number", {
  expect_equal(z.parse('123',z.coerce.number()), 123)
  expect_equal(z.parse(0.54,z.coerce.number()), 0.54)
})
