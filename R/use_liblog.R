
#' log calls to loadNamespace
#'
#' This will log the calls to `loadNamespace()` to the file whose path is defined by
#' `getOption("liblog.path")`.
#'
#' By default `getOption("liblog.path")` is `file.path(R.home(), "loadNamespace.log")`.
#' Change it using `options(liblog.path = your_path)`.
#'
#' We advise you to insert the instruction `liblog::use_liblog()` anywhere in your
#' RProfile. You can open your RProfile with
#' `file.edit(file.path(R.home(), "etc", "RProfile.site"))`
#'
#' @param verbose wether to display a message, better keep default (`TRUE`) to
#'   be reminded that the RProfile has modified the environment.
#' @export
use_liblog <- function(verbose = TRUE){
  # trace loadNamespace to print one more line in path
  # if path doesn't exist it's created automatically by cat
  if (!verbose) {
    suppressMessages(
      trace(
        base::loadNamespace,
        quote(
          cat(
            append = TRUE,
            file = getOption("liblog.path"),
            paste(sep = ", ", as.character(Sys.time()), package),
            "\n")
        ),
        print = FALSE
      )
    )
    return(invisible())
  }

  trace(
    base::loadNamespace,
    quote(
      cat(
        append = TRUE,
        file = getOption("liblog.path"),
        paste(sep = ", ", as.character(Sys.time()), package),
        "\n")
    ),
    print = FALSE
  )
  # complete message printed by trace
  message("to log loaded namespaces in '", getOption("liblog.path"), "'")
  invisible()
}
