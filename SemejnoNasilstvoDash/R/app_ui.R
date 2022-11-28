#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    shiny::div(
      class = "container-xl",
      bslib::page_fluid(
        theme = bslib::bs_theme(version = 5, bootswatch = "lux"),
        shiny::div(
          class = "text-center",
          shiny::uiOutput("page_title"),
          shiny::br(),
          shiny::div(
            class = "d-flex justify-content-end",
            shiny::radioButtons(
              inputId = "lang",
              label = NULL,
              choices = c("mk", "sq", "en"),
              selected = "mk",
              inline = TRUE
            )
          ),
          shiny::br(),
          shiny::div(
            class = "container-xl",
            shiny::uiOutput("nav_panel")

          )
        )
      )
    )
  )
}
#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "SemejnoNasilstvoDash"
    )
  )
}
