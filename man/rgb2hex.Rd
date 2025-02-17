% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert.R
\name{rgb2hex}
\alias{rgb2hex}
\title{Convert RGB to HEX}
\usage{
rgb2hex(color, arithmetic = FALSE)
}
\arguments{
\item{color}{A numeric vector of length 3, the color in RGB format.}

\item{arithmetic}{Logical, whether to use arithmetic scaling. See 'Details'.
(default: \code{FALSE})}
}
\value{
A character.
}
\description{
Return a color in HEX format given a color in RGB format as a numeric vector of length 3.
The result is returned as a character.
}
\details{
Two formats for the RGB values are implemented which can be accessed with
the \code{arithmetic} argument.
By default (i.e if \code{arithmetic} is set to \code{FALSE}), the range for every
color goes from 0 to 255.
Otherwise (i.e. if \code{arithmetic} is set to \code{TRUE}), the values are interpreted
as percentages given as numbers between 0 and 1.
}
\examples{
rgb2hex(c(0, 191, 255))
}
