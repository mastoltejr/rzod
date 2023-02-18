z.na <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'na',
    cls = rzodSchema(check = is.na,
                     errorMsg = 'item is not NA'),
    notNa = NULL
  )))
}

z.coerce.na <- function() {
  do.call(rzodSchema, c(z.na(), coerce = function(x){NA}))
}
