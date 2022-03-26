#' Histogram overlaid with kernel density curve.
#'
#' @param flowers dataset to use, of course it *must* be iris in
#' our case
#' @param col_name Length 1 character vector of the column to plot
#'
#' @return `ggplot2` object
#' @export
#'
#' @examples
#' histogram(iris, "Sepal.Length")
#' histogram(iris, "Petal.Length")

histogram <- function(flowers, col_name) {
  flowers |>
  ggplot2::ggplot(
    mapping = ggplot2::aes( x = .data[[col_name]] )
  ) +
    # Histogram with density instead of count on y-axis:
    ggplot2::geom_histogram(
      mapping = ggplot2::aes(y = ..density..),
      binwidth = 0.5,
      colour = "white",
      fill = "orange"
    ) +
    # Overlay with density plot:
    ggplot2::geom_density(color = "#223843") +
    ggplot2::theme_bw()

}
