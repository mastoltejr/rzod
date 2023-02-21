z.regex <- function(schema = rzodSchema(), pattern, ...) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to regex() is not of class rzodSchema')
  }

  schema$regex <- rzodSchema(
    check = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(grepl(pattern, x, ...))
      }

      return(F)
    },
    errorMsg = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(paste0("'", x, "' does not match pattern: '", pattern, "'"))
      }

      return(paste0('regex() can not be applied to ',schema$base,'()'))
    }
  )

  return(schema)
}
