datatable_options <- function(
    given_dataframe,
    extensions = "Scroller",
    class = "cell-border",
    scrollY = 400, # Visible table height
    scrollX = TRUE, # Enable horizontal scrolling if table is too wide
    scroller = TRUE # Use the extension "Scroller"
) {
  DT::datatable(
    given_dataframe,
    extensions = extensions,
    class = class,
    options = list(
      deferRender = TRUE,
      scrollY = scrollY,
      scrollX = scrollX,
      scroller = scroller
    )
  )
}
