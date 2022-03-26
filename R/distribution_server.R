distribution_server <- function(
    id,
    r_flowers,
    xy_vars
  ) {
  stopifnot(is.reactive(r_flowers))
  stopifnot(is.reactive(xy_vars))

  moduleServer(
    id = id,

    module = function(input, output, session) {
      # ----text----
      output$x_header <- renderText({
        xy_vars()$x_var() # *Note this*
      })

      output$y_header <- renderText({
        xy_vars()$y_var() # *Again, Note this*
      })

      # ----plots----
      output$x_distribution <- renderPlot({
        hist_density(
          flowers = r_flowers(),
          col_name = xy_vars()$x_var()
        )
      })

      output$y_distribution <- renderPlot({
        hist_density(
          flowers = r_flowers(),
          col_name = xy_vars()$y_var()
        )
      })
    }
  )
}
