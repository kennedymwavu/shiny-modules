data_input_ui <- function(id) {
  shiny::tagList(
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        # 1. ----Upload File----
        fileInput(
          inputId = NS(namespace = id, id = "flowers"),
          label = "Choose File (.csv)",
          accept = ".csv"
        )
      ),

      mainPanel = mainPanel(
        fluidRow(
          # center contents:
          align = "center",

          column(
            width = 12,

            # 2. ----Preview----
            DT::DTOutput(
              outputId = NS(namespace = id, id = "preview")
            ) |>
              # Show loading spinner while uploading:
              shinycssloaders::withSpinner(
                type = 2,
                color.background = "white"
              ),

            tags$br(),

            # 3. ----Next Tab Btn----
            shinyjs::hidden(
              actionButton(
                inputId = NS(namespace = id, id = "go_to_plot"),
                label = "Proceed To Plot Tab",
                class = "btn-success"
              )
            )
          )
        )
      )
    )
  )
}
