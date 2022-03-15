ui <- navbarPage(
  title = "Shiny Modules",
  id = "three_tabs",

  tabPanel(
    title = "Tab 1",
    value = "tab1"
  ),

  tabPanel(
    title = "Tab 2",
    value = "tab2"
  ),

  tabPanel(
    title = "Tab 3",
    value = "tab3"
  )
)
