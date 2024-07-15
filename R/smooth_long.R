#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param smooth_home
#' @return
#' @author njtierney
#' @export
smooth_long <- function(smooth_home) {

  smooth_home %>%
  pivot_longer(
    cols = starts_with("gam_age"),
    names_prefix = "gam_age_",
    values_to = "x_value"
  ) %>%
  filter(!is.na(x_value)) %>%
  select(!c(`.type`, `.by`, `.smooth`)) %>%
  rename(estimate = `.estimate`, se = `.se`) %>%
  relocate(name)

}
