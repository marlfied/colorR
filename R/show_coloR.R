#' Show color
#'
#' Given a color by its R-name as a character, in HEX format as character or RGB format as a vector of length 3,
#' return a rectangular plot of the color with the color written in the middle in the same format as the argument.
#'
#'
#' @param color Character or numeric vector of length 3, the color as R-name, HEX or RGB.
#' @param text_color Character or numeric vector of length 3, the text color as R-name, HEX or RGB.
#' (default: 'black')
#'
#' @return A plot as described above.
#' @export
#'
#' @examples
#' show_colorR("lightblue", text_color = "#AC5798")
show_colorR <- function(color, text_color = "black") {
  name <- ifelse(
    is.character(color),
    color,
    paste("RGB: ", color[1], ", ", color[2], ", ", color[3], sep = "")
  )
  p <- plot(NULL, axes = FALSE, xlab = "", ylab = "", xlim = c(0, 1), ylim = c(0, 1), asp = 1)
  rect_col <- ifelse(is.character(color), color, rgb2hex(color))
  text_col <- ifelse(is.character(text_color), text_color, rgb2hex(text_color))
  rect(0, 0, 1, 1, col = rect_col)
  text(1 / 2, 1 / 2, labels = name, col = text_col)
}
