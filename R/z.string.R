z.string <- function(schema = rzodSchema()) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(z.any(schema), list(
    cls = list(check = is.character,
               errorMsg = 'item is not a string')
  )))
}
