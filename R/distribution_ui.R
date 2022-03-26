distribution_ui <- function(id) {
  shiny::tagList(
    fluidRow(
      align = "center",

      column(
        width = 6,

        # Variable name above plot eg. Sepal Length:
        tags$h3(
          textOutput(
            outputId = NS(namespace = id, id = "x_header")
          )
        ),

        # The plot:
        plotOutput(
          outputId = NS(namespace = id, id = "x_distribution")
        )
      ),

      column(
        width = 6,

        tags$h3(
          textOutput(
            outputId = NS(namespace = id, id = "y_header")
          )
        ),

        plotOutput(
          outputId = NS(namespace = id, id = "y_distribution")
        )
      )
    )
  )
}
