test_that("does array() work standalone", {
  expect_equal(z.parse(c(1,2,3),z.array()),c(1,2,3))
  expect_equal(z.parse(c(c(1,2,3),c('1','2','3')),z.array(z.array())),c(c(1,2,3),c('1','2','3')))
  expect_error(z.parse(NULL,z.array()))
})

test_that("does array() work as a wrapper", {
  expect_equal(z.parse(c(1,2,3),z.array(z.number())),c(1,2,3))
  expect_equal(z.parse(c(1,'2',3),z.array(z.any())),c(1,'2',3))
  expect_equal(z.parse(c(c(1,2,3),c('1','2','3')),z.array(z.array(z.any()))),c(c(1,2,3),c('1','2','3')))
})

test_that("does z.coerce.array() work", {
  expect_equal(z.parse(NULL,z.coerce.array()), vector())
})
