##' Arbitrary scaling
##'
##' Rescale a vector to a given mean and variance
##' @param x a numeric vector
##' @param .mean the mean of the output
##' @param .sd the sd of the output
##' @return a rescaled numeric vector
##' @export
ascale <- function(x, .mean, .sd) {
  xmean <- mean(x)
  xsd <- sd(x)
  .mean + (x - xmean) * .sd/xsd
}

