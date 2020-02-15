#' Bayesian Regime Switching Model
#'
#' For modeling two possible states
#'
#' @export
#' @param y a vector response values
#' @param stickiness an integer indicating how sticky a given state is
#'     modelled as a beta distribution
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
stan_regime_switch <- function(y,
                           stickiness = 9,
                           ...) {

  y = as.vector(unlist(y))

  standata <- list(
    N = nrow(y),
    y = y,
    sticky = stickiness

  )

  out <- rstan::sampling(stanmodels$stan_regime_switch, data = standata, ...)
  return(out)
}
