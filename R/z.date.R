z.date <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'date',
    cls = rzodSchema(
      check = function(x) {
        class(x) == 'Date' #|  class(Sys.time()) == c('POSIXct','POSIXt')
      },
      errorMsg = 'item is not a date'
    )
  )))
}

# TODO look up how to test for date in R
