z.coerce <- function(schema = rzodSchema, ...) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to z.coerce() is not of class rzodSchema')
  }
  args <- list(...)

  schema$coerce <- function(x){
      if(schema$base == 'boolean' | schema$base == 'logical'){ return(as.logical(x)) }
      if(schema$base == 'character' | schema$base == 'string'){ return(as.character(x)) }
      if(schema$base == 'date'){ return(as.Date(x)) }
      if(schema$base == 'na' | schema$base == 'undefined'){ return(NA) }
      if(schema$base == 'null'){ return(NULL) }
      if(schema$base == 'number'){ return(as.numeric(x)) }
      if(schema$baes == 'object' | schema$base == 'list'){
        defaults <- args$default
        if(is.null(schema$rzodChildren)){stop('No children schemas found in z.object()')}
        ret <- lapply(names(schema$rzodChildren), function(n) {
          x[[n]] %||% defaults[[n]] %||% NA
        })
        names(ret) <- names(schema$rzodChildren)
        return(ret)
      }
      return(x)
    }

  return(schema)
}
