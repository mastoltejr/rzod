z.null <- function() {
  do.call(rzodSchema,list(
    base = 'null',
    cls = rzodSchema(check = function(x){all(sapply(x,is.null))},
               errorMsg = 'item is not NULL')
  ))
}

z.coerce.null <- function() {
  do.call(rzodSchema, c(z.null(), coerce = function(obj){return(NULL)}))
}
