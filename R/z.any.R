z.any <- function() {
  rzodSchema(
    notNa = rzodSchema(
      check = function(x) {
        !any(is.na(x))
      },
      errorMsg = 'item can not be NA'
    ),
    length = rzodSchema(
      check = function(x) {
        length(x) == 1
      },
      errorMsg = 'item is not a single value'
    )
  )
}
