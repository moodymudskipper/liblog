.onLoad <- function(libname, pkgname) {
  op <- options()
  op.liblog <- list(
    liblog.path = file.path(R.home(), "loadNamespace.log"),
    liblog.name = "",
    liblog.name = "Antoine Fabri",
    liblog.desc.author = "Antoine Fabri <antoine.fabri@gmail.com> [aut, cre]",
    liblog.desc.license = "GPL-3",
    liblog.desc.suggests = NULL,
    liblog.desc = list()
  )
  toset <- !(names(op.liblog) %in% names(op))
  if (any(toset)) options(op.liblog[toset])
  invisible()
}
