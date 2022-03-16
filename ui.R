ui <- navbarPage(
  title = "Shiny Modules",
  id = "tab_container",
  theme = shinytheme(theme = "flatly"),

  tabPanel(
    title = "Data Input",
    value = "tab_input",

    shinyjs::useShinyjs(),

    data_input_ui(id = "data_input")
  ),

  tabPanel(
    title = "Plot",
    value = "tab_plot"
  ),

  tabPanel(
    title = "Distributions",
    value = "tab_distributions"
  )
)

