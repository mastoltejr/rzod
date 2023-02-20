z.na <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'na',
    cls = rzodSchema(
      check = function(x) {
        all(sapply(x, is.na)) & !any(sapply(x, is.null))
      },
      errorMsg = 'item is not NA'
    ),
    notNa = NULL
  )))
}

z.coerce.na <- function() {
  do.call(rzodSchema, c(
    z.na(),
    coerce = function(x) {
      NA
    }
  ))
}
