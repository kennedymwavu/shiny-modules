data_input_ui <- function(id) {
  shiny::tagList(
    fluidRow(
      align = "center",

      column(
        width = 12,

        tags$div(
          class = "upper_row_container",

          tags$div(
            class = "file_input",

            # 1. ----Upload File----
            fileInput(
              inputId = NS(namespace = id, id = "flowers"),
              label = "Upload The Iris Dataset",
              buttonLabel = "+ Select File",
              placeholder = "Drag and Drop File Here (.csv)",
              accept = ".csv",
              width = "90%"
            )
          ),

          tags$div(
            class = "go_to_plot",

            # 3. ----Next Tab Btn----
            shinyjs::hidden(
              actionButton(
                inputId = NS(namespace = id, id = "go_to_plot"),
                label = "Proceed To Plot Tab",
                class = "btn-success",
                style = "font-size: 110%;"
              )
            )
          )
        )
      )
    ),

    tags$br(),
    tags$br(),

    fluidRow(
      column(
        width = 12,
        align = "center",

        # 2. ----Preview----
        tags$div(
          class = "preview",

          DT::DTOutput(
            outputId = NS(namespace = id, id = "preview")
          ) |>
            # Show loading spinner while uploading:
            shinycssloaders::withSpinner(
              type = 2,
              color.background = "white"
            )
        )
      )
    )
  )
}
