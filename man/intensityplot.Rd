% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intensityplot.R
\name{intensityplot}
\alias{intensityplot}
\title{Plot intensity object}
\usage{
intensityplot(
  it,
  start,
  end,
  tfrom0 = TRUE,
  tgbool = FALSE,
  lines = NULL,
  focusTierColor = "black",
  focusTierLineType = "dotted",
  range = NULL,
  color = "black",
  ind = NULL,
  min_max_only = TRUE,
  highlight = NULL,
  axisLabel = "Intensity (dB)",
  drawSize = 1
)
}
\arguments{
\item{it}{IntensityTier object loaded using \link[rPraat:it.read]{rPraat::it.read} or other object
formatted in a similar way, i.e. a \code{list} object containing the elements
\code{t} (a vector of time values) and \code{i} (a vector of intensity values) of
identical length.}

\item{start}{Start time (in seconds) of desired plotted area.}

\item{end}{End time (in seconds) of desired plotted area.}

\item{tfrom0}{Logical; should time on the x-axis run from 0 or from the
original time? Default is \code{TRUE}.}

\item{tgbool}{Logical; should dotted lines be plotted corresponding to
locations in a TextGrid? Default is \code{FALSE}.}

\item{lines}{Numeric vector giving locations in seconds of locations from
a TextGrid to be plotted with dotted lines. Default is \code{NULL}.}

\item{focusTierColor}{String or vector of strings giving the color(s) to
use for plotting focus tier lines. If multiple tiers are focused, a vector
of the same length can be passed, and the nth tier will be plotted in the
nth color. Default is \code{'black'}.}

\item{focusTierLineType}{String or vector of strings giving the line
type(s) for plotting focus tier lines. If multiple tiers are focused, a
vector of the same length can be passed, and the nth tier will be plotted in
the nth line type. Default is \code{'dotted'}.}

\item{range}{Vector of two integers giving the intensity range to be
used for producing intensity plots. Default is \code{NULL}, in which case the
range is simply the minimum and maximum levels in the curve.}

\item{color}{String giving the name of the color to be used for
plotting intensity. Default is \code{'black'}.}

\item{ind}{Integer indexing current plot frame relative to other plot
components. Default is \code{NULL}.}

\item{min_max_only}{Logical; should only minimum and maximum values be given
on the y-axis? Default is \code{TRUE}. Can also be a logical vector if some but
not all plot components should have minimum and maximum values on the y-axis.
Ignored for TextGrid component.}

\item{highlight}{Named list giving parameters for differential
highlighting of the intensity contour based on the time domain. This list
should contain information about which parts of the plot to highlight, either
done with the \code{start} and \code{end} arguments which must be numbers or numeric
vectors, or using the \code{tier} and \code{label} arguments to highlight based on
information in a plotted TextGrid. Further contains the optional arguments
\code{color} (string or vector of strings, see \code{color}) and
\code{drawSize} (integer), and \code{background}
(a string specifying a background color).}

\item{axisLabel}{String giving the name of the label to print along
the y-axis when plotting intensity. Default is \code{Intensity (dB)}.}

\item{drawSize}{Number indicating the line width of the intensity contour.
Default is \code{1}. Controls the \code{lwd} argument of \link[graphics:lines]{graphics::lines}.}
}
\value{
No return values, called internally by \link{praatpicture} and sibling
functions.
}
\description{
Function for plotting intensity objects called by \link{praatpicture}. Instead of
using this function directly, just use
\code{praatpicture('my_sound_file', frames='intensity')}.
}
\examples{
# Don't use directly
datapath <- system.file('extdata', package='praatpicture')
soundFile <- paste0(datapath, '/1.wav')
praatpicture(soundFile, frames='intensity')
}
