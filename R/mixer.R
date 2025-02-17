convert2rgb <- function(color) {
  if (startsWith(color, "#")) {
    return(hex2rgb(color))
  } else {
    c <- c(t(col2rgb(color)))
    return(c)
  }
}

#' Mix to colors
#'
#' Return color in HEX or RGB format given two colors which can be in HEX format
#' as character, R-name also as character or RGB format as a numeric vector of length 3.
#' The result is returned in HEX format as a character or in RGB format as a vector of length 3.
#'
#' Two formats for the RGB values are implemented which can be accessed with
#' the `arithmetic` argument.
#' By default (i.e if `arithmetic` is set to `FALSE`), the range for every
#' color goes from 0 to 255.
#' Otherwise (i.e. if `arithmetic` is set to `TRUE`), the values are interpreted
#' as percentages given as numbers between 0 and 1.
#'
#' @param color1 Character or numeric vector of length 3, the color as R-name, HEX or RGB.
#' @param color2 Character or numeric vector of length 3, the color as R-name, HEX or RGB.
#' @param arithmetic Logical, whether to use arithmetic scaling. See 'Details'.
#' (default: `FALSE`)
#' @param as_HEX Logical, whether to return the result in HEX or RGB format.
#'
#' @return Character if as_HEX=`TRUE`, vector of length 3 if as_HEX=`FALSE`.
#' @export
#'
#' @examples
#' mix("aquamarine4", "#FC6C85")
mix <- function(color1, color2, arithmetic = FALSE, as_HEX = FALSE) {
  color1 <- if (is.character(color1)) convert2rgb(color1) else color1
  color2 <- if (is.character(color2)) convert2rgb(color2) else color2

  result <- (color1 + color2) / 2

  if (as_HEX) {
    return(rgb2hex(result, arithmetic))
  } else {
    return(result)
  }
}
