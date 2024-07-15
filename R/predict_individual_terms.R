#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param age_grid
#' @param term_names
#' @param term_var_names
#' @return
#' @author njtierney
#' @export
predict_individual_terms <- function(age_grid, fit, term_names, term_var_names) {

  predicted_term <- function(age_grid, fit, term_name, term_var_name){
    predict(object = fit,
            newdata = age_grid,
            type = "terms",
            terms = term_name) |>
      as_tibble() |>
      setNames(glue("pred_{term_var_name}"))
  }

  all_predicted_terms <- map2_dfc(
    .x = term_names,
    .y = term_var_names,
    .f = function(.x, .y){
      predicted_term(age_grid = age_grid,
                     fit = fit,
                     term_name = .x,
                     term_var_name = .y)
    }
  )

  bind_cols(age_grid, all_predicted_terms)

}
