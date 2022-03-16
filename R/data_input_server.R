data_input_server <- function(
    id,
    parent_session
  ) {
  moduleServer(
    id = id,

    module = function(input, output, session) {
      # ----read in data----
      # I always add `r_` to all my reactive variables:
      r_flowers <- reactive({
        file <- input$flowers

        # don't proceed if user hasn't chosen a file:
        req(file)

        # read chosen csv file:
        read.csv(file$datapath)
      })

      # ----preview----
      output$preview <- DT::renderDT({
        r_flowers() |>
          datatable_options()
      })

      # ----unhide `go_to_plot` btn----
      observe({
        # Don't unhide if user hasn't yet chosen file:
        req(r_flowers())

        # once file is chosen show btn:
        shinyjs::show(
          id = "go_to_plot"
        )
      })

      # ----switch to `tab_plot`----
      observeEvent(input$go_to_plot, {
        updateNavbarPage(
          session = parent_session,
          inputId = "tab_container", # id of `navbarPage()`
          selected = "tab_plot"
        )
      })
    }
  )
}
