#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  output$crime_table <-
    DT::renderDT(rownames = FALSE,
                 server = TRUE,
                 filter = "top",
                 {
                   getFromNamespace(ns = "SemejnoNasilstvoData", x = sprintf("crimes_%s", input$lang))
                 })

  output$victims_table <-
    DT::renderDT(rownames = FALSE,
                 server = TRUE,
                 filter = "top",
                 {
                   getFromNamespace(ns = "SemejnoNasilstvoData", x = sprintf("victims_%s", input$lang))
                 })

  output$misdemeanors_table <-
    DT::renderDT(rownames = FALSE,
                 server = TRUE,
                 filter = "top",
                 {
                   getFromNamespace(ns = "SemejnoNasilstvoData",
                                    x = sprintf("misdemeanors_%s", input$lang))
                 })

  output$complaints_table <-
    DT::renderDT(rownames = FALSE,
                 server = TRUE,
                 filter = "top",
                 {
                   getFromNamespace(ns = "SemejnoNasilstvoData", x = sprintf("complaints_%s", input$lang))
                 })

}
