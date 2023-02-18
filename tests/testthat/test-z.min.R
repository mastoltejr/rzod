test_that("min() works", {
  expect_equal(z.parse(100,z.min(z.number(),55)), 100)
  expect_equal(z.parse('123456',z.min(z.string(),3)), '123456')
  expect_error(z.parse(100,z.min(z.number(),150)))
  expect_error(z.parse('123456',z.min(z.string(),13)))
})
