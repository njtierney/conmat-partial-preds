#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param fit_home
#' @return
#' @author njtierney
#' @export
extract_term_names <- function(fit_home) {

  coef_names <- names(fit_home$coefficients) |>
    str_remove_all("\\.[^.]*$") |>
    unique() |>
    str_subset("^s\\(")

  coef_names

}
