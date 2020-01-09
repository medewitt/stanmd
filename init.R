
# Generate Stan File for state space prediction model
file.create(file.path("inst", "stan", "stan_poll_pred.stan"))
file.create(file.path("R", "stan_poll_pred.R"))

pkgbuild::check_build_tools()
pkgbuild::compile_dll() # see note below
roxygen2::roxygenize()


# normal project stuff ----------------------------------------------------
# Set Up
usethis::use_readme_rmd()
usethis::use_lifecycle_badge("experimental")
usethis::use_travis()

usethis::use_vignette(name = "state-space", title = "State Space Modeling")

pkgdown::build_site()



