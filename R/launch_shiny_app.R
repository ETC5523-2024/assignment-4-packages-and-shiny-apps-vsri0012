# R/launch_shiny_app.R

#' Launch the WWEAnalytics Shiny App
#'
#' This function launches the Shiny app for exploring WWE Championship reign data.
#' It assumes that shiny-app.R is located in the 'inst' folder of the package.
#'
#' @export
launch_shiny_app <- function() {
  app_file <- system.file("shiny-app.R", package = "WWEAnalytics")

  if (app_file == "") {
    stop("Could not find shiny-app.R file. Please ensure shiny-app.R is in the 'inst' folder of the WWEAnalytics package.")
  }

  shiny::runApp(app_file)
}
