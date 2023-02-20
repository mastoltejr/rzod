z.string <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'string',
    cls = rzodSchema(check = function(x){all(sapply(x,is.character))},
               errorMsg = 'item is not a string')
  )))
}

z.coerce.string <- function() {
  do.call(rzodSchema, c(z.string(), coerce = as.character))
}
