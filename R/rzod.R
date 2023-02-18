# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

falsy <- function(x) {
  is.null(x) ||
    identical(x, FALSE) ||
    identical(x, 0L) ||
    identical(x, 0.0) ||
    identical(x, 0+0i) ||
    identical(x, "") ||
    identical(x, as.raw(0)) ||
    identical(x, logical()) ||
    identical(x, integer()) ||
    identical(x, double()) ||
    identical(x, complex()) ||
    identical(x, character()) ||
    identical(x, raw()) ||
    identical(x, list()) ||
    inherits(x, "try-error")
}

truthy <- function(x) {!falsy(x)}

`%||%` <- function(lhs,rhs){
  if(truthy(lhs)){ return(lhs) }
  return(rhs)
}

`%?%` <- function(lhs, rhs){
  if(length(rhs) != 2){stop('Right Hand Side must have a length of 2')}
  if(truthy(lhs)){return(rhs[1])}
  return(rhs[2])
}

rzodSchema <- function(...){
  args <- list(...)
  while(length(args) == 1 & is.null(names(args)) & is.list(head(args,1))){args <- args[[1]]}
  if(length(args) > 0 & is.null(names(args))){stop('rzodSchemas must have named values')}
  if(is.null(args$base)){args$base <- 'character'}
  class(args) <- 'rzodSchema'
  return(args)
}

rzodChildren <- function(...){
  args <- list(...)
  while(length(args) == 1 & is.null(names(args)) & is.list(head(args,1))){args <- args[[1]]}
  if(length(args) > 0 & is.null(names(args))){stop('rzodChildren must have named values')}
  if(!is.null(args$base)){args$base <- NULL}
  class(args) <- 'rzodChildren'
  return(args)
}

z.parse <- function(obj = NA, schema = rzodSchema()){
  if (class(schema) != 'rzodSchema') {
    print(class(schema))
    print(names(schema))
    stop('argument to parse() is not of class rzodSchema')
  }

  if(!is.null(schema$coerce)){
    obj <- schema$coerce(obj)
  }

  for(n in names(schema)){
    s <- schema[[n]]
    # print(paste(c(n,class(s)), collapse=" => "))
    if(!class(s) %in% c('rzodSchema','rzodChildren')){ next }

    if(class(s) == 'rzodChildren'){
      # print('vvvvvvvvv')
      for(n2 in names(s)){
        # print(paste(c(n2)))
        z.parse(obj[[n2]], s[[n2]])
        # print('=================')
      }
    } else if(!s$check(obj)){
      stop(ifelse(is.function(s$errorMsg),s$errorMsg(obj),s$errorMsg))
    }


  }

  return(obj)
}

z.safeParse <- function(obj = NA, schema = rzodSchema()){
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  for(n in names(schema)){
    s <- schema[[n]]
    if(class(s) != 'rzodSchema'){ next }
    if(!s$check(obj)){
      return(list(success=F,error=ifelse(is.function(s$errorMsg),s$errorMsg(obj),s$errorMsg)))
    }
  }

  return(list(success=T,data=obj))
}



