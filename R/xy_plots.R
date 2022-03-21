#' Scatter plot of var `x` against `y` plus their boxplots.
#'
#' @param flowers dataset to use, of course it *must* be iris in
#' our case
#' @param x `x` variable. Length one character vector.
#' @param y `y` variable. Length one character vector.
#'
#' @return Named list of three: scatterplot, x_boxplot, y_boxplot
#' @export
#'
#' @examples
#' xy_plots(iris, "Sepal.Length", "Sepal.Width")
#' xy_plots(iris, "Petal.Length", "Sepal.Width")

xy_plots <- function(flowers, x, y) {
  # theming:
  tm <- ggplot2::theme_bw() +
    ggplot2::theme(
      # remove legend title:
      legend.title = ggplot2::element_blank(),
      text = ggplot2::element_text(size = 15),
      aspect.ratio = 0.7
    )

  colors <- ggplot2::scale_color_manual(
    values = c("black", "red", "blue")
  )

  scatterplot <- flowers |>
    ggplot2::ggplot(
      mapping = ggplot2::aes(
        x = .data[[x]], y = .data[[y]], color = Species
      )
    ) +
    ggplot2::geom_point(size = 2) +
    colors +
    tm

  x_boxplot <- flowers |>
    ggplot2::ggplot(
      mapping = ggplot2::aes(
        x = Species, y = .data[[x]], color = Species
      )
    ) +
    ggplot2::geom_boxplot() +
    ggplot2::xlab("") +
    colors +
    tm

  # damn I still gotta repeat myself here!
  y_boxplot <- flowers |>
    ggplot2::ggplot(
      mapping = ggplot2::aes(
        x = Species, y = .data[[y]], color = Species
      )
    ) +
    ggplot2::geom_boxplot() +
    ggplot2::xlab("") +
    colors +
    tm

  # ----return----
  res <- list(
    scatterplot = scatterplot,
    x_boxplot = x_boxplot,
    y_boxplot = y_boxplot
  )

  return(res)
}
