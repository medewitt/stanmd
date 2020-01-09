
# Generate Stan File for state space prediction model
file.create(file.path("inst", "stan", "stan_poll_pred.stan"))
file.create(file.path("R", "stan_poll_pred.R"))

pkgbuild::check_build_tools()
pkgbuild::compile_dll() # see note below
roxygen2::roxygenize()

