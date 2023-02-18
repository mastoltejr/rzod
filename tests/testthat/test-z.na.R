test_that("na() accepts NAs", {
  expect_equal(z.parse(NA,z.na()), NA)
  expect_equal(z.parse(as.logical(NA),z.na()), as.logical(NA))
  expect_equal(z.parse(as.numeric(NA),z.na()), as.numeric(NA))
  expect_equal(z.parse(as.character(NA),z.na()), as.character(NA))
})

test_that("na() rejects not NAs", {
  expect_error(z.parse(44,z.na()))
  expect_error(z.parse(T,z.na()))
  expect_error(z.parse(Sys.Date(),z.na()))
})

test_that("na() rejects vectors", {
  expect_error(z.parse(c(NA,NA),z.na()))
})

test_that("z.coerce.na() coerces to a na", {
  expect_equal(z.parse(123,z.coerce.na()), NA)
  expect_equal(z.parse(F,z.coerce.na()), NA)
})
