test_that("date() accepts dates", {
  expect_equal(z.parse(Sys.Date(),z.date()), Sys.Date())
  # expect_equal(z.parse(Sys.time(),z.date()), Sys.time())
})

test_that("date() rejects not dates", {
  expect_error(z.parse(44,z.date()))
  expect_error(z.parse(T,z.date()))
  expect_error(z.parse('123',z.date()))
})

test_that("date() rejects vectors", {
  expect_error(z.parse(c(Sys.Date(), Sys.time()),z.date()))
})

test_that("date() rejects NA", {
  expect_error(z.parse(as.POSIXct(NA),z.date()))
})
