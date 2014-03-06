##' Convert pdf to png
##'
##' Save a previously created pdf file also as png in the same
##' directory. Requires imagemagick to be installed on the system and
##' to be in the $PATH. On Windows, the system command "convert.exe"
##' is found before ImageMagick's convert.exe, that's why we have to
##' hardcode it.
##' @param fname the name of the pdf file to convert 
##' @param basedir the directory the pdf file is in, if NULL, the
##' "figures" folder in the current working directory is taken
##' @param dens sets the resolution of the resulting png
##' @return nothing, invoked for side effects (png creation)
##' @export
pngalso <- function(fname, basedir = NULL, dens = 150) {
  system <- Sys.info()["sysname"]
  if (system == "Windows") {
    convert <- shQuote("c:/Program Files (x86)/ImageMagick-6.8.7-Q16/convert.exe")
  } else {
    convert <- "convert"
  }
  if (is.null(basedir)) {
    basedir <- file.path(getwd(), "figures")
  }
  if (length(grep(".pdf", fname)) == 1) {
    pdffile <- fname
    pngfile <- paste(gsub(".pdf", "", fname), ".png", sep = "")
  } else {
    pdffile <- shQuote(paste(fname, ".pdf", sep = ""))
    pngfile <- shQuote(paste(fname, ".png", sep = ""))
  }
  pdfpath <- file.path(basedir, pdffile)
  pngpath <- file.path(basedir, pngfile)
  if (!file.exists(pdfpath)) {
    stop("no such pdf file!")
  }
  convert_cmd <- paste(convert, "-density", dens, pdfpath, pngpath)
  system(convert_cmd)
}
