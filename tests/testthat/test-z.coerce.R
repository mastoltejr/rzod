test_that("chaining coercion works", {
  expect_equal(z.parse('123',z.coerce(z.number())), 123)
})
