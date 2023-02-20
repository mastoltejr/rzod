z.array <- function(schema = rzodSchema()) {
  if(schema$base == 'empty'){schema <- z.any()}
  schema$length <- NULL
  return(schema)
}

z.coerce.array <- function(schema = rzodSchema()) {
  if(schema$base == 'empty'){schema <- z.array()}
  schema$coerce <- function(x){
    if(length(x) == 0){return(vector())}
    if(is.na(x)){return(vector())}
    return(x)
  }
  return(schema)
}
