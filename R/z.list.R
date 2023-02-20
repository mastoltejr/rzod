z.list <- function(...) {
  rzodSchema(
    base = 'list',
    cls = rzodSchema(check = is.list,
                     errorMsg = 'item is not a list'),

    rzodChildren = rzodChildren(...)
  )
}

z.coerce.list <- function(objSchema = list(), defaults = list()) {
  s <- z.list(rzodSchema(objSchema))
  s$coerce <- function(x){
    ret <- lapply(names(objSchema), function(n) {
      x[[n]] %||% defaults[[n]] %||% NA
    })
    names(ret) <- names(objSchema)
    return(ret)
  }
  return(s)
}
