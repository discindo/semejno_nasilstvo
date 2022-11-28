#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  output$crime_table <- DT::renderDT(rownames = FALSE, server = TRUE, filter = "top", {
    SemejnoNasilstvoData:::crimes_mk
  })

  output$victims_table <- DT::renderDT(rownames = FALSE, server = TRUE, filter = "top", {
    SemejnoNasilstvoData:::victims_mk
  })

  output$misdemeanors_table <- DT::renderDT(rownames = FALSE, server = TRUE, filter = "top", {
    SemejnoNasilstvoData:::misdemeanors_mk
  })

  output$complaints_table <- DT::renderDT(rownames = FALSE, server = TRUE, filter = "top", {
    SemejnoNasilstvoData:::complaints_mk
  })

}
