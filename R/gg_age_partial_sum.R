#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_predictions_long_sum
#' @return
#' @author njtierney
#' @export
gg_age_partial_sum <- function(age_predictions_long_sum) {

    ggplot(
      data = age_predictions_long_sum,
      aes(
        x = age_from,
        y = age_to,
        fill = gam_total_term
      )
    ) +
    geom_tile() +
    scale_fill_viridis_c(
      limits = c(0, 12)
    ) +
    theme_minimal()


}
