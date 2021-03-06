% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/use_liblog.R
\name{use_liblog}
\alias{use_liblog}
\title{log calls to loadNamespace}
\usage{
use_liblog(verbose = TRUE)
}
\arguments{
\item{verbose}{wether to display a message, better keep default (\code{TRUE}) to
be reminded that the RProfile has modified the environment.}
}
\description{
This will log the calls to \code{loadNamespace()} to the file whose path is defined by
\code{getOption("liblog.path")}.
}
\details{
By default \code{getOption("liblog.path")} is \code{file.path(R.home(), "loadNamespace.log")}.
Change it using \code{options(liblog.path = your_path)}.

We advise you to insert the instruction \code{liblog::use_liblog()} anywhere in your
RProfile. You can open your RProfile with
\code{file.edit(file.path(R.home(), "etc", "RProfile.site"))}
}
