test_that("z.any() accepts anything", {
  expect_equal(z.parse(45,z.any()), 45)
  expect_equal(z.parse('hello',z.any()), 'hello')
  expect_equal(z.parse(F,z.any()), F)
})

test_that("z.any() rejects vectors", {
  expect_error(z.parse(c(1,2,3),z.any()))
})

test_that("z.any() rejects NA", {
  expect_error(z.parse(NA,z.any()))
})
