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

      # x_var vs y_var:
      output$x_vs_y <- renderPlot({
        r_flowers() |>
          ggplot(
            mapping = aes(
              # use the `.data` pronoun here:
              x = .data[[input$x_var]], y = .data[[input$y_var]],
              # color by `Species`:
              color = Species
            )
          ) +
          geom_point(size = 2) +
          # give some bizarre colors:
          scale_color_manual(values = c("black", "red", "blue")) +
          theme_bw() +
          theme(
            # remove legend title:
            legend.title = element_blank(),
            text = element_text(size = 15),
            aspect.ratio = 0.7
          )
      })
    }
  )
}
