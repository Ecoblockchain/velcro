##' Convert all pdf files to pngs
##'
##' Convert all pdf files in figures folder of current working
##' directory to png files.
##' @return nothing, invoked for side effects
##' @param dens set the resolution of the resulting png files
##' @export
all2png <- function(dens = 150) {
  all_pdf <- list.files(file.path(getwd(), "figures"), pattern =
                        ".*\\.pdf")

  n <- length(all_pdf)
  for (i in 1:n) {
    pngalso(all_pdf[i], dens = dens)
  }
}
