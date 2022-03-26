ui <- navbarPage(
  title = "Shiny Modules",
  id = "tab_container",
  theme = shinytheme(theme = "flatly"),
  footer = tags$div(
    tags$br(),
    tags$br()
  ),

  tabPanel(
    title = "Data Input",
    value = "tab_input",

    shinyjs::useShinyjs(),

    includeCSS(path = "www/styles.css"),

    data_input_ui(id = "data_input")
  ),

  tabPanel(
    title = "Plot",
    value = "tab_plot",

    plot_ui(id = "var_plots")
  ),

  tabPanel(
    title = "Distributions",
    value = "tab_distributions",

    distribution_ui(id = "dist_plots")
  )
)

