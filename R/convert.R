hex <- function(x) {
  return(format(as.hexmode(ceiling(x)), width = 2))
}

#' Convert RGB to HEX
#'
#' Return a color in HEX format given a color in RGB format as a numeric vector of length 3.
#' The result is returned as a character.
#'
#' Two formats for the RGB values are implemented which can be accessed with
#' the `arithmetic` argument.
#' By default (i.e if `arithmetic` is set to `FALSE`), the range for every
#' color goes from 0 to 255.
#' Otherwise (i.e. if `arithmetic` is set to `TRUE`), the values are interpreted
#' as percentages given as numbers between 0 and 1.
#'
#' @param color A numeric vector of length 3, the color in RGB format.
#' @param arithmetic Logical, whether to use arithmetic scaling. See 'Details'.
#' (default: `FALSE`)
#'
#' @return A character.
#' @export
#'
#' @examples
#' rgb2hex(c(0, 191, 255))
rgb2hex <- function(color, arithmetic = FALSE) {
  if (!(is(color, "numeric") & length(color) == 3 & all(color >= 0))) {
    stop(paste(
      "Argument `color` must be a numeric vector of length 3.\n",
      " All entries have to be non-negative."
    ))
  }
  if (arithmetic) {
    color <- ceiling(color * 255)
  }
  return(paste("#", hex(color[1]), hex(color[2]), hex(color[3]), sep = ""))
}


#' Convert HEX to RGB
#'
#' Return a color in RGB format given its representation in HEX format as a character.
#'
#' Two formats for the RGB values are implemented which can be accessed with
#' the `arithmetic` argument.
#' By default (i.e if `arithmetic` is set to `FALSE`), the range for every
#' color goes from 0 to 255.
#' Otherwise (i.e. if `arithmetic` is set to `TRUE`), the values are interpreted
#' as percentages given as numbers between 0 and 1.
#'
#' @param color A character, color formatted as '#______' in HEX code
#' @param arithmetic Logical, whether to use arithmetic scaling for the result.
#' See 'Details'.(default: `FALSE`)
#'
#' @return Numeric vector of length 3.
#' @export
#'
#' @examples
#' hex2rgb("#82AC85")
hex2rgb <- function(color, arithmetic = FALSE) {
  mat <- col2rgb(color)
  if (arithmetic) {
    mat <- mat / 255
  }
  return(c(mat[1], mat[2], mat[3]))
}


#' Convert color name to HEX
#'
#' Get the HEX format of a color given its R-color name as a character.
#'
#' @param color Vector with R-color names.
#'
#' @return A character.
#' @export
#'
#' @examples
#' col2hex(c("lightblue", "aquamarine4"))
col2hex <- function(color) {
  rgb_val <- as.data.frame(t(col2rgb(color)))
  return(mapply(
    function(r, g, b) rgb2hex(c(r, g, b)),
    rgb_val$red, rgb_val$green, rgb_val$blue
  ))
}


#' Convert HEX to color name
#'
#' Return a R-color name given a color in HEX format as character.
#'
#' In R one color can have multiple names, e.g. 'white' and 'grey100'.
#' By setting distinct to `FALSE`, the function returns all possible names.
#'
#' @param color A character, color formatted as '#______' in HEX code
#' @param distinct Logical, whether the result should be one distinct name or all available ones.
#' See 'Details'. (default: `TRUE`)
#'
#' @return A character.
#' @export
#'
#' @examples
#' hex2col("#458b74")
hex2col <- function(color, distinct = TRUE) {
  result <- colors(distinct)[
    tolower(col2hex(colors(distinct))) == tolower(color)
  ]
  if (identical(result, character(0))) {
    return(NULL)
  } else {
    return(result)
  }
}


#' Convert RGB to R color name
#'
#' Return the R color name of a color given in RGB format.
#'
#' Two formats for the RGB values are implemented which can be accessed with
#' the `arithmetic` argument.
#' By default (i.e if `arithmetic` is set to `FALSE`), the range for every
#' color goes from 0 to 255.
#' Otherwise (i.e. if `arithmetic` is set to `TRUE`), the values are interpreted
#' as percentages given as numbers between 0 and 1.
#'
#' @param color A numeric vector of length 3, the color in RGB format.
#' @param arithmetic Logical, whether to use arithmetic scaling. See 'Details'.
#' (default: `FALSE`)
#'
#' @return A character.
#' @export
#'
#' @examples
#' rgb2col(c(0, 139, 139))
rgb2col <- function(color, arithmetic = FALSE) {
  return(hex2col(rgb2hex(color, arithmetic)))
}
