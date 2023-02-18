test_that("Test that masx() works", {
  expect_equal(z.parse(100,z.max(z.number(),150)), 100)
  expect_equal(z.parse('123456',z.max(z.string(),8)), '123456')
  expect_error(z.parse(100,z.max(z.number(),50)))
  expect_error(z.parse('123456',z.max(z.string(),3)))
  # expect_error(z.parse(c(1,2),z.max(z.array(),3)))
})
