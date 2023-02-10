test_that("string() accepts strings", {
  expect_equal(z.parse('55',z.string()), '55')
})

test_that("string() rejects not strings", {
  expect_error(z.parse(44,z.string()))
  expect_error(z.parse(T,z.string()))
  expect_error(z.parse(Sys.Date(),z.string()))
})

test_that("string() rejects vectors", {
  expect_error(z.parse(c('hello','hi'),z.string()))
})

test_that("string() rejects NA", {
  expect_error(z.parse(as.character(NA),z.string()))
})
