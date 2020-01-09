#' Bayesian State-Space Model for Polling Prediction
#'
#' @export
#' @param y a matrix of point estimates
#' @param sigma a matrix of polling standard deviations
#' @param random_walk_sd with default of \code{0.2}
#' @param mu_sigma the average sigma with value of \code{1}
#' @param inflator the factor by which to increase error due to non-statistical
#'     polling error
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
stan_poll_pred <- function(y, sigma,
                           initial_prior = 50,
                           random_walk_sd = 0.2,
                           mu_sigma = 1,
                           inflator = sqrt(2),
                           ...) {

  standata <- list(
    T = nrow(y),
    polls = ncol(sigma),
    Y = y,
    sigma = sigma,
    initial_prior = initial_prior, # Rough ratings
    random_walk_sd = random_walk_sd,
    mu_sigma = mu_sigma,
    inflator =inflator
  )

  out <- rstan::sampling(stanmodels$stan_poll_pred, data = standata, ...)
  return(out)
}
