z.min <- function(schema = rzodSchema(), value = 1) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to min() is not of class rzodSchema')
  }

  schema$length <- rzodSchema(
    check = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(nchar(x) >= value)
      }

      if (schema$base == 'number') {
        return(x >= value)
      }

      if (schema$base == 'array') {
        return(length(x) >= value)
      }

      return(F)
    },
    errorMsg = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(paste0("'", x, "' is fewer than ", value, " characters"))
      }

      if (schema$base == 'number') {
        return(paste0(x, " is less than ", value))
      }

      if (schema$base == 'array') {
        return(paste0(x, " has less than ", value,' element(s)'))
      }

      return(paste0('max() can not be applied to ',schema$base,'()'))
    }
  )

  return(schema)
}

# TODO add min for Dates
