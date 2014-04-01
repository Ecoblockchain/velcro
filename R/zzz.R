.onAttach <- function(...) {
  os <- oblique()
  os <- paste("\n\t\t%%%%%%\n", os, "\n\t\t%%%%%%\n")
  packageStartupMessage(os)
}
