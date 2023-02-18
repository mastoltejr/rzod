z.number <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'number',
    cls = rzodSchema(check = is.numeric,
               errorMsg = 'item is not a number')
  )))
}

z.coerce.number <- function() {
  do.call(rzodSchema, c(z.number(), coerce = as.numeric))
}
