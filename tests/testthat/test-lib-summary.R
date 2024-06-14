test_that("lib_summary(TRUE) returns expected results", {
  res <- lib_summary(TRUE)
  expect_s3_class(res, "data.frame")
  expect_equal(ncol(res), 3)
  expect_equal(names(res), c("Library", "n_packages", "lib_size"))
  expect_type(res$Library, "character")
  expect_type(res$n_packages, "integer")
  expect_type(res$lib_size, "double")
})

test_that("lib_summary fails appropriately", {
  expect_error(lib_summary(sizes = "foo"), "not interpretable as logical")
})


test_that("lib_summary(FALSE) returns expected results", {
  res <- lib_summary(FALSE)
  expect_s3_class(res, "data.frame")
  expect_equal(ncol(res), 2)
  expect_equal(names(res), c("Library", "n_packages"))
  expect_type(res$Library, "character")
  expect_type(res$n_packages, "integer")
})
