test_that("z.null() accepts NULL", {
  expect_equal(z.parse(NULL,z.null()), NULL)
  expect_equal(z.parse(c(NULL,NULL),z.null()), NULL)
})

test_that("z.null() errors on not NULL", {
  expect_error(z.parse('hi',z.null()))
  expect_error(z.parse(45,z.null()))
  expect_error(z.parse(c(1,23,3),z.null()))
  expect_error(z.parse(F,z.null()))
})

test_that("z.coerce.null() coerces to NULL", {
  expect_equal(z.parse('123',z.coerce.null()), NULL)
  expect_equal(z.parse(c(T,F),z.coerce.null()), NULL)
})
