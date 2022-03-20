plot_ui <- function(id) {
  shiny::tagList(
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        # x variable:
        selectInput(
          inputId = NS(namespace = id, id = "x_var"),
          label = "X Variable",
          choices = NULL
        ),

        # y variable:
        selectInput(
          inputId = NS(namespace = id, id = "y_var"),
          label = "Y Variable",
          choices = NULL
        )
      ),

      mainPanel = mainPanel(
        # plot of the two vars against each other:
        plotOutput(
          outputId = NS(namespace = id, id = "x_vs_y")
        )
      )
    ),

    fluidRow(
      column(
        width = 6,

        # boxplot of x variable:
        plotOutput(
          outputId = NS(namespace = id, id = "x_boxplot")
        )
      ),

      column(
        width = 6,

        plotOutput(
          outputId = NS(namespace = id, id = "y_boxplot")
        )
      )
    )
  )
}
