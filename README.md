
[![Travis build
status](https://travis-ci.org/moodymudskipper/liblog.svg?branch=master)](https://travis-ci.org/moodymudskipper/liblog)
[![Codecov test
coverage](https://codecov.io/gh/moodymudskipper/liblog/branch/master/graph/badge.svg)](https://codecov.io/gh/moodymudskipper/liblog?branch=master)

# liblog

This package logs calls to loadNamespace, so one can track thei use of
packages.

Install with:

``` r
remotes::install_github("moodymudskipper/liblog")
```

## Suggested use

Edit your R profile, (you can run `file.edit(file.path(R.home(), "etc",
"RProfile.site"))`) and add the following line at the end :

``` r
liblog::use_liblog()
```

It will display the following message each time you start R:

> Tracing function “loadNamespace” in package “base” to log loaded
> namespaces in ‘C:/PROGRA<sub>1/R/R-36</sub>1.2/loadNamespace.log’

The actual path will change depending on your system.

If you’d rather do it silently, use `liblog::use_liblog(verbose =
FALSE)` instead.

From there on, each time a package has its namespace loaded (not only
attached\!), a new line will be added to the file mentionned in the
message, you can get this path by calling `getOption("liblog.path")` and
you can choose another path by adding a call to `options()` before
`use_liblog()` call in your RProfile so you’ll have:

``` r
options(liblog.path = your_path)
liblog::use_liblog()
```

## Test it\!

Apply the steps above, restart R (in RStudio : ctrl + shift + F10), then
see what’s been logged already by calling :

``` r
file.edit(getOption("liblog.path"))
```

Duplicates are present because `loadNamespace()` is really called
several times on some packages.

More conveniently, you can call `liblog::get_liblog()`, which by default
removes duplicate records and ignores base and recommended packages.

## Is that it ?

For now it is, after I’ve used it for some time I think I’ll implement
some visualization functions wrapped on `get_liblog()`. Maybe I’ll also
need some options or utilisties to flush or archive the log, or warn
about it getting too big, but I need data first\! (or feedback, wink
wink =\> POST ISSUES AND HELP ME HELP YOU\!).
