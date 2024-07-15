#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param ages
#' @return
#' @author njtierney
#' @export
create_age_grid <- function(ages) {
  ## TODO
  ## Wrap this up into a function that generates an age grid data frame
  ## with all the terms needed to fit a conmat model
  ## (from `fit_single_contact_model.R`)
  age_grid <- expand.grid(
    age_from = ages,
    age_to = ages
  ) |>
    as_tibble() |>
    # prepare the age data so it has all the right column names
    # that are used inside of `fit_single_contact_model()`
    conmat::add_symmetrical_features() |>
    # this ^^^ does the same as the commented part below:
    # dplyr::mutate(
    #   gam_age_offdiag = abs(age_from - age_to),
    #   gam_age_offdiag_2 = abs(age_from - age_to)^2,
    #   gam_age_diag_prod = abs(age_from * age_to),
    #   gam_age_diag_sum = abs(age_from + age_to),
    #   gam_age_pmax = pmax(age_from, age_to),
    #   gam_age_pmin = pmin(age_from, age_to)
    # ) |>
    # This is to add the school_probability and work_probability columns
    # that are used inside fit_single_contact_model() when fitting the model.
    conmat::add_modelling_features()


}
