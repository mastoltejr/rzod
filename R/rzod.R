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

any <- function(schema = rzodSchema()) {
  if (class(schema) != 'rzodSchema') {
    stop('argument to any() is not of class rzodSchema')
  }

  do.call(rzodSchema, modifyList(schema, list(
    notNa = list(
      check = function(x) {
        !is.na(x)
      },
      errorMsg = 'item can not be NA'
    ),
    single = list(
      check = function(x) {
        length(x) == 1
      },
      errorMsg = 'item is not a single value'
    )
  )))
}

string <- function(){
  c(
    any(),
    class =
  )
}

x <- list(a = '1')