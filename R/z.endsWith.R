z.endsWith <- function(schema = rzodSchema(), pattern,...) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to endsWith() is not of class rzodSchema')
  }

  schema$regex <- rzodSchema(
    check = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(grepl(paste0(pattern,'$'), x, ...))
      }

      return(F)
    },
    errorMsg = function(x) {
      if (schema$base == 'character' | schema$base == 'string') {
        return(paste0("'", x, "' does not end with '",pattern,"'"))
      }

      return(paste0('endsWith() can not be applied to ',schema$base,'()'))
    }
  )

  return(schema)
}
