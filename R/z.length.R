z.length <- function(schema = rzodSchema(), value = 1) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to length() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    length = rzodSchema(
      check = function(x) {
        if (schema$base == 'character' | schema$base == 'string') {
          return(nchar(x) == value)
        }

        if (schema$base == 'array') {
          return(length(x) == value)
        }

        return(F)
      },
      errorMsg = function(x) {
        if (schema$base == 'character' | schema$base == 'string') {
          return(paste0("'", x, "' does not have ", value, " characters"))
        }

        if (schema$base == 'array') {
          return(paste0(x, " does not have ", value,' element(s)'))
        }

        return(paste0('length() can not be applied to ',schema$base,'()'))
      }
    )
  )))
}

# TODO add max for Dates
