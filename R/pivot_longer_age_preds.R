#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_predictions
#' @return
#' @author njtierney
#' @export
pivot_longer_age_preds <- function(age_predictions) {
  age_predictions |>
    pivot_longer(
      starts_with("pred"),
      names_to = "pred",
      values_to = "value",
      names_prefix = "pred_"
    )
}
