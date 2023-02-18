z.max <- function(schema = rzodSchema(), value = 1) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to max() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    length = rzodSchema(
      check = function(x) {
        if (schema$base == 'character' | schema$base == 'string') {
          return(nchar(x) <= value)
        }

        if (schema$base == 'number') {
          return(x <= value)
        }

        if (schema$base == 'array') {
          return(length(x) <= value)
        }

        return(F)
      },
      errorMsg = function(x) {
        if (schema$base == 'character' | schema$base == 'string') {
          return(paste0("'", x, "' is greater than ", value, " characters"))
        }

        if (schema$base == 'number') {
          return(paste0(x, " is greater than ", value))
        }

        if (schema$base == 'array') {
          return(paste0(x, " has more than ", value,' element(s)'))
        }

        return(paste0('max() can not be applied to ',schema$base,'()'))
      }
    )
  )))
}

# TODO add max for Dates
