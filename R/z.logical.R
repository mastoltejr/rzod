z.logical <- function() {
  do.call(rzodSchema, modifyList(z.any(), list(
    base = 'logical',
    cls = rzodSchema(check = is.logical,
                     errorMsg = 'item is not a logical')
  )))
}

z.coerce.logical <- function() {
  do.call(rzodSchema, c(z.logical(), coerce = as.logical))
}

# TODO replace as.logical with something that will convert to TRUTHY
