z.coerce <- function(schema = rzodSchema(base = 'string')) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to max() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    coerce = function(x){
      if(schema$base == 'boolean' | schema$base == 'logical'){ return(as.logical(x)) }
      if(schema$base == 'character' | schema$base == 'string'){ return(as.character(x)) }
      if(schema$base == 'date'){ return(as.Date(x)) }
      if(schema$base == 'na' | schema$base == 'undefined'){ return(NA) }
      if(schema$base == 'null'){ return(NULL) }
      if(schema$base == 'number'){ return(as.numeric(x)) }
      return(x)
    }
  )))
}
