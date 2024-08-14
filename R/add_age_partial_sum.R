#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_predictions_long
#' @return
#' @author njtierney
#' @export
add_age_partial_sum <- function(age_predictions_long) {

  age_partial_sum <- age_predictions_long |>
    group_by(age_from,
             age_to) |>
    summarise(
      gam_total_term = exp(sum(value)),
      .groups = "drop"
    )

  age_partial_sum


}
