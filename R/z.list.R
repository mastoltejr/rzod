z.list <- function(...) {
  objSchema <- rzodChildren(...)
  do.call(rzodSchema, list(
    base = 'list',
    cls = rzodSchema(check = is.list,
                     errorMsg = 'item is not a list'),

    rzodChildren = objSchema
  ))
}

z.coerce.list <- function(objSchema = list(), defaults = list()) {
  do.call(rzodSchema, c(z.list(objSchema), coerce = function(x) {
    lapply(names(objSchema), function(n) {
      x[[n]] %||% defaults[[n]] %||% NA
    })
  }))
}
