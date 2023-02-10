z.any <- function(schema = rzodSchema()) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    notNa = list(
      check = function(x) {
        !is.na(x[[1]])
      },
      errorMsg = 'item can not be NA'
    ),
    length = list(
      check = function(x) {
        length(x) == 1
      },
      errorMsg = 'item is not a single value'
    )
  )))
}
