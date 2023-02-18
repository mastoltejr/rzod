test_that("test that object works", {
  expect_equal(z.parse(list(t1 = 123, t2 = 'hello'), z.object(
    t1 = z.max(z.number(),value=200),
    t2 = z.string()
  )), list(t1 = 123, t2 = 'hello'))
  expect_error(z.parse(list(t1 = 123, t2 = 'hello'), z.object(
    t1 = z.string(),
    t2 = z.string()
  )))
})

test_that("test that object.coerce works", {
  expect_equal(z.parse(list(), z.coerce.object(list(
    t1 = z.max(z.number(),value=200),
    t2 = z.string()
  ), defaults = list(
    t1 = 123,
    t2 = 'hello'
  ))), list(t1 = 123, t2 = 'hello'))
  expect_equal(z.parse(list(t1=123), z.coerce.object(list(
    t1 = z.max(z.number(),value=200),
    t2 = z.string()
  ), defaults = list(
    t2 = 'hello'
  ))), list(t1 = 123, t2 = 'hello'))
})
