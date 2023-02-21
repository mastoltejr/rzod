z.email <- function(schema = rzodSchema()) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to email() is not of class rzodSchema')
  }

  schema$regex <- rzodSchema(
    check = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(grepl('^[[:alnum:].-_]+@[[:alnum:].-]+$', x, ignore.case = T))
      }

      return(F)
    },
    errorMsg = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(paste0("'", x, "' is not an email"))
      }

      return(paste0('email() can not be applied to ',schema$base,'()'))
    }
  )

  return(schema)
}
