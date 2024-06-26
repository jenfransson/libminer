#' R library summary
#'
#' Provides a summary of libraries and numbers of packages installed
#'
#' @param sizes Logical: Whether to calculate the size of each library
#'
#' @return A data frame containing the paths and package counts for each library
#' @export
#'
#' @examples
#'
#' lib_summary()
#'
lib_summary <- function(sizes = FALSE) {
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("Library", "n_packages")

  if (sizes) {
    pkg_df$lib_size <- vapply(
      pkg_df$Library,
      function(x) {
        sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
      },
      FUN.VALUE = numeric(1)
    )
  }
  pkg_df
}
