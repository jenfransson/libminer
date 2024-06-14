#' R library summary
#'
#' Provides a summary of libraries and numbers of packages installed
#'
#' @return A data frame containing the paths and package counts for each library
#' @export
#'
#' @examples
#'
#' lib_summary()
#'
lib_summary <- function() {
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("Library", "n_packages")
  pkg_df
}
