test_that("liblog works", {
  # tmp <- tempfile()
  # options(liblog.path = tmp)
  expect_message(use_liblog(TRUE), "Tracing function")
  expect_message(use_liblog(FALSE), NA)
  expect_error(.onLoad(), NA)
  tmp <- tempfile()
  options(liblog.path = tmp)
  library(tools)
  expect_true(file.exists(tmp))
  expect_error(
    content <- scan(file = tmp, what = character(), sep = ",", strip.white = TRUE),
    NA)
  expect_length(content, 2)
  expect_identical(content[[2]], "tools")
})
