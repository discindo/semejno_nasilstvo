#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  ##### App #####

  output$page_title <- shiny::renderUI({
    page_title <- switch(input$lang,
                         mk = "Семејно Насилство",
                         en = "Domestic Violence",
                         sq = "Dhuna në familje")
    shiny::h1(page_title)
  })


  output$nav_panel <- shiny::renderUI({

    tab1 <- switch(input$lang, mk = "Криминални случаи", en = "Criminal cases", sq = "Rastet penale")
    tab2 <- switch(input$lang, mk = "Сторители и жртви", en = "Perpetrators and victims", sq = "Autorët dhe viktimat")
    tab3 <- switch(input$lang, mk = "Прекршоци", en = "Misdemeanors", sq = "Kundërvajtjet")
    tab4 <- switch(input$lang, mk = "Поплаки", en = "Complaints", sq = "Ankesat")
    tab5 <- switch(input$lang, mk = "За податоците", en = "About the data", sq = "Rreth të dhënave")
    tab6 <- switch(input$lang, mk = "За Discindo", en = "About Discindo", sq = "Rreth Discindo")

    bslib::navs_pill_card(
      bslib::nav(
        tab1,
        shiny::br(),
        shiny::br(),
        DT::DTOutput("crime_table")
      ),
      bslib::nav(
        tab2,
        shiny::br(),
        shiny::br(),
        DT::DTOutput("victims_table")
      ),
      bslib::nav(
        tab3,
        shiny::br(),
        shiny::br(),
        DT::DTOutput("misdemeanors_table")
      ),
      bslib::nav(
        tab4,
        shiny::br(),
        shiny::br(),
        DT::DTOutput("complaints_table")
      ),
      bslib::nav(
        tab5,
        shiny::br(),
        shiny::br()
      ),
      bslib::nav(
        tab6,
        shiny::br(),
        shiny::br()
      )
    )
  })


  ##### Data #####

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
