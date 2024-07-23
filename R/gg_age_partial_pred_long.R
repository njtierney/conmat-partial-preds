#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_predictions_long
#' @return
#' @author njtierney
#' @export
gg_age_partial_pred_long <- function(age_predictions_long) {

  age_predictions_long %>%
    ggplot(
      aes(
        x = age_from,
        y = age_to,
        group = pred,
        fill = value
      )
    ) +
    facet_wrap(~pred,
               scales = "free") +
    geom_tile() +
    scale_fill_viridis_c() +
    theme_minimal()

}
