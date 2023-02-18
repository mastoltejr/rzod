test_that("undefined() accepts NAs", {
  expect_equal(z.parse(NA,z.undefined()), NA)
  expect_equal(z.parse(as.logical(NA),z.undefined()), as.logical(NA))
  expect_equal(z.parse(as.numeric(NA),z.undefined()), as.numeric(NA))
  expect_equal(z.parse(as.character(NA),z.undefined()), as.character(NA))
})

test_that("undefined() rejects not NAs", {
  expect_error(z.parse(44,z.undefined()))
  expect_error(z.parse(T,z.undefined()))
  expect_error(z.parse(Sys.Date(),z.undefined()))
})

test_that("undefined() rejects vectors", {
  expect_error(z.parse(c(NA,NA),z.undefined()))
})

test_that("z.coerce.undefined() coerces to a undefined", {
  expect_equal(z.parse(123,z.coerce.undefined()), NA)
  expect_equal(z.parse(F,z.coerce.undefined()), NA)
})
