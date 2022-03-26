#' Custom `DT::datatable()` options.

#' This function provides some nice defaults for rendering `DT::datatables()`
#' which are also customizable if need arises.
#'
#' @param given_dataframe An object of class data.frame
#' @param scrollY Visible table height
#' @param scrollX Logical: Do you want to enable horizontal scrolling?
#' @param scroller Logical: Should the scroller extension be used?
#' @inheritParams DT::datatable
#' @return An object of class `datatables` and `htmlwidgets`
#' @examples
#' iris |> datatable_options()

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
    rownames = FALSE,
    extensions = extensions,
    class = class,
    options = list(
      deferRender = TRUE,
      scrollY = scrollY,
      scrollX = scrollX,
      scroller = scroller,
      columnDefs = list(
        list(
          className = 'dt-center',
          targets = "_all"
        )
      )
    )
  )
}
