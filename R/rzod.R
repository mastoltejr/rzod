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

rzodSchema <- function(...){
  s <- list(...)
  class(s) <- 'rzodSchema'
  return(s)
}

z.parse <- function(obj = NA, schema = rzodSchema()){
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  for(n in names(schema)){
    s <- schema[[n]]
    if(!s$check(obj)){
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
    if(!s$check(obj)){
      return(list(success=F,error=ifelse(is.function(s$errorMsg),s$errorMsg(obj),s$errorMsg)))
    }
  }

  return(list(success=T,data=obj))
}



