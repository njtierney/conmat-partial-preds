#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param term_names
#' @return
#' @author njtierney
#' @export
clean_term_names <- function(term_names) {

  term_names |>
    str_remove_all("^s\\(gam_age_") |>
    str_remove_all("\\)")

}
