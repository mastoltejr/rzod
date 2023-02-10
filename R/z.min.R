min <- function(schema = rzodSchema(), v = 1) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    length = list(
      check = function(x) {
        if (is.character(x)) {
          return(nchar(x) >= v)
        }

        if (is.numeric(x)) {
          return(x >= v)
        }

        return(T)
      },
      errorMsg = function(x) {
        if (is.character(x)) {
          return(paste0("'", x, "' is fewer than ", v, " characters"))
        }

        if (is.numeric(x)) {
          return(paste0(x, " is less than ", v))
        }

        return(T)
      }
    )
  )))
}
