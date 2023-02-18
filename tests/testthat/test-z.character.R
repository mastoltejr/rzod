test_that("character() accepts characters", {
  expect_equal(z.parse('55',z.character()), '55')
})

test_that("character() rejects not characters", {
  expect_error(z.parse(44,z.character()))
  expect_error(z.parse(T,z.character()))
  expect_error(z.parse(Sys.Date(),z.character()))
})

test_that("character() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.character()))
})

test_that("character() rejects NA", {
  expect_error(z.parse(as.character(NA),z.character()))
})

test_that("z.coerce.character() coerces to a character", {
  expect_equal(z.parse(123,z.coerce.character()), '123')
  expect_equal(z.parse(F,z.coerce.character()), 'FALSE')
})
