#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_predictions_all_settings
#' @return
#' @author njtierney
#' @export
gg_age_terms_settings <- function(age_predictions_all_settings) {

  pred_all_setting_longer <- age_predictions_all_settings |>
    pivot_longer(
      starts_with("pred"),
      names_to = "pred",
      values_to = "value",
      names_prefix = "pred_"
    ) |>
    select(age_from,
           age_to,
           value,
           pred,
           setting)

  facet_age_plot <- function(data, place){
    data |>
      filter(setting == place) |>
      ggplot(aes(x = age_from,
                 y = age_to,
                 fill = value)) +
      geom_tile() +
      facet_grid(setting~pred,
                 switch = "y") +
      coord_fixed()

  }

  p_home <- facet_age_plot(pred_all_setting_longer, "home") + scale_fill_viridis_c()
  p_work <- facet_age_plot(pred_all_setting_longer, "work") + scale_fill_viridis_c(option = "rocket")
  p_school <- facet_age_plot(pred_all_setting_longer, "school") + scale_fill_viridis_c(option = "plasma")
  p_other <- facet_age_plot(pred_all_setting_longer, "other") + scale_fill_viridis_c(option = "mako")

  patchwork::wrap_plots(
    p_home,
    p_work,
    p_school,
    p_other,
    nrow = 4
  )






}
