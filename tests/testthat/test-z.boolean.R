test_that("boolean() accepts booleans", {
  expect_equal(z.parse(T,z.boolean()), T)
  expect_equal(z.parse(F,z.boolean()), F)
})

test_that("boolean() rejects not booleans", {
  expect_error(z.parse(44,z.boolean()))
  expect_error(z.parse('123',z.boolean()))
  expect_error(z.parse(Sys.Date(),z.boolean()))
})

test_that("boolean() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.boolean()))
  expect_error(z.parse(c(T,F),z.boolean()))
})

test_that("boolean() rejects NA", {
  expect_error(z.parse(as.logical(NA),z.boolean()))
})

test_that("z.coerce.boolean() coerces to a boolean", {
  expect_equal(z.parse('TRUE',z.coerce.boolean()), T)
  expect_equal(z.parse('FALSE',z.coerce.boolean()), F)
})
