server <- function(input, output, session) {
  r_flowers <- data_input_server(
    id = "data_input",
    parent_session = session
  )

  xy_vars <- plot_server(
    id = "var_plots",
    r_flowers = r_flowers
  )

  distribution_server(
    id = "dist_plots",
    r_flowers = r_flowers,
    xy_vars = xy_vars
  )
}
