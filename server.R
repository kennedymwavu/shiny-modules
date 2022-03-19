server <- function(input, output, session) {
  r_flowers <- data_input_server(
    id = "data_input",
    parent_session = session
  )
}
