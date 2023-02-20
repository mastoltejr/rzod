z.undefined <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'undefined',
    cls = rzodSchema(check = function(x){all(sapply(x,is.na))},
                     errorMsg = 'item is not NA'),
    notNa = NULL
  )))
}

z.coerce.undefined <- function() {
  do.call(rzodSchema, c(z.undefined(), coerce = function(x){NA}))
}
