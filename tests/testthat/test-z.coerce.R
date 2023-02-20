test_that("chaining coercion works", {
  expect_equal(z.parse('123',z.coerce(z.number())), 123)
  expect_equal(z.parse(c(1,2,3),z.coerce(z.array(z.number()))), c(1,2,3))
})
