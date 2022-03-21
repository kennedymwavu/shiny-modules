plot_server <- function(id, r_flowers) {
  # Just to be 💯% sure that `r_flowers` is a reactive:
  stopifnot(is.reactive(r_flowers))

  moduleServer(
    id = id,

    module = function(input, output, session) {
      observe({
        # choices will be the numeric cols of `r_flowers()`:
        numeric_cols <- purrr::map_lgl(
          .x = r_flowers(),  # *Note this*
          .f = is.numeric
        )

        choices <- colnames(r_flowers())[numeric_cols]

        # update the `selectInput()`s:
        updateSelectInput(
          session = session,
          inputId = "x_var",
          choices = choices
        )

        updateSelectInput(
          session = session,
          inputId = "y_var",
          choices = choices
        )
      })

      # ----plots----
      plots <- reactive({
        xy_plots(
          flowers = r_flowers(),
          x = input$x_var,
          y = input$y_var
        )
      })

      # x_var vs y_var:
      output$x_vs_y <- renderPlot({
        plots()$scatterplot
      })

      output$x_boxplot <- renderPlot({
        plots()$x_boxplot
      })

      output$y_boxplot <- renderPlot({
        plots()$y_boxplot
      })
    }
  )
}
