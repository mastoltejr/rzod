z.never <- function() {
  do.call(rzodSchema, list(
    reject = rzodSchema(
      check = function(x) {
        F
      },
      errorMsg = 'item should not exist'
    )
  ))
}
