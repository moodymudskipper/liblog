#' get the table of logged library loading calls
#'
#' By default the duplicates, as defined by instances of package namespace loaded
#' several times at the same timestamp, are removed. Default packages as defined by
#' `getOption("defaultPackages")`, base packages as defined by
#' `rownames(installed.packages(priority="base"))` and recommended packages as
#' defined by `rownames(installed.packages(priority="recommended"))`, are
#' ignored by default.
#'
#' @param duplicates should duplicates be included
#' @param default wether to include default packages
#' @param base wether to include base packages
#' @param recommended wether to include recommended packages
#'
#' @return a data.frame
#' @Import utils
#' @export
#'
#' @examples
#' tail(get_liblog())
get_liblog <- function(duplicates = FALSE, default = base, base = FALSE, recommended = FALSE) {
  out <- utils::read.table(getOption("liblog.path"),
             header = FALSE, sep = ",", strip.white = TRUE)
  names(out) <- c("time","package")
  if (!duplicates) {
    out <- out[!duplicated(out),,drop = FALSE]
  }
  if (!default) {
    out <- out[!out$package %in% getOption("defaultPackages"),, drop = FALSE]
  }
  if (!base) {
    out <- out[
      !out$package %in% rownames(utils::installed.packages(priority = "base")),,
      drop = FALSE]
  }
  if (!recommended) {
    out <- out[
      !out$package %in% rownames(utils::installed.packages(priority = "recommended")),,
      drop = FALSE]
  }
  out$time <- as.POSIXct(out$time)
  out
}
