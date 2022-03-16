server <- function(input, output, session) {
  data_input_server(
    id = "data_input",
    parent_session = session
  )
}
