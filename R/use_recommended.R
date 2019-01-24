#' Add recommended dependencies
#' 
#' `shiny`, `DT`, `attempt`, `glue`
#'
#' @inheritParams add_module
#'
#' @export
use_recommended_dep <- function(pkg = "."){
  old <- setwd(normalizePath(pkg))
  on.exit(setwd(old))
  usethis::use_package("shiny")
  usethis::use_package("DT")
  usethis::use_package("attempt")
  usethis::use_package("glue")
}

use_recommended_tests <- function(pkg = "."){
  old <- setwd(normalizePath(pkg))
  on.exit(setwd(old))
  if (!dir.exists(
    file.path(normalizePath(pkg), "tests")
  )){
    usethis::use_testthat()
  }
  file.copy(
    system.file("utils", "test-golem-recommended.R", package = "golem"), 
    file.path(normalizePath(pkg), "tests", "testthat")
  )
} 