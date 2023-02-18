z.boolean <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'boolean',
    cls = rzodSchema(check = is.logical,
               errorMsg = 'item is not a boolean')
  )))
}

z.coerce.boolean <- function() {
  do.call(rzodSchema, c(z.boolean(), coerce = as.logical))
}

# TODO replace as.logical with something that will convert to TRUTHY
