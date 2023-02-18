z.character <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'string',
    cls = rzodSchema(check = is.character,
                     errorMsg = 'item is not a character')
  )))
}

z.coerce.character <- function() {
  do.call(rzodSchema, c(z.character(), coerce = as.character))
}
