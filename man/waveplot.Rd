% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/waveplot.R
\name{waveplot}
\alias{waveplot}
\title{Plot waveform}
\usage{
waveplot(
  sig,
  bit,
  t,
  start,
  tfrom0 = TRUE,
  nchan = 1,
  color = "black",
  pitch_plotOnWave = FALSE,
  pt = NULL,
  pitch_plotType = "draw",
  pitch_scale = "hz",
  pitch_freqRange = NULL,
  pitch_axisLabel = NULL,
  pitch_color = "black",
  pitch_highlight = NULL,
  intensity_plotOnWave = FALSE,
  it = NULL,
  intensity_range = NULL,
  intensity_axisLabel = "Intensity (dB)",
  intensity_color = "black",
  intensity_highlight = NULL,
  tgbool = FALSE,
  lines = NULL,
  focusTierColor = "black",
  focusTierLineType = "dotted",
  ind = NULL,
  line_comp = NULL,
  rect_comp = NULL,
  arr_comp = NULL,
  annot_comp = NULL,
  draw_lines = NULL,
  draw_rectangle = NULL,
  draw_arrow = NULL,
  annotate = NULL,
  channelNames = FALSE,
  axisDigits = 3,
  lineWidth = 1,
  cn = NULL,
  min_max_only = TRUE,
  highlight = NULL,
  drawSize = 1,
  speckleSize = 1
)
}
\arguments{
\item{sig}{Numeric vector corresponding to a sound signal.}

\item{bit}{Numeric; will generally be grabbed from a loaded \code{WaveMC} object.}

\item{t}{Numeric vector giving times corresponding to the signal.}

\item{start}{Start time (in seconds) of desired plotted area.}

\item{tfrom0}{Logical; should time on the x-axis run from 0 or from the
original time? Default is \code{TRUE}.}

\item{nchan}{Numeric; how many channels will be plotted? Default is \code{1}.}

\item{color}{String giving the name of the color to be used for plotting
the waveform. Default is \code{'black'}. Alternatively, a vector of colors, if
different channels should be plotted with different colors.}

\item{pitch_plotOnWave}{Boolean; should pitch be plotted on top of
waveform? Default is \code{FALSE}.}

\item{pt}{Pitch object loaded using \link[rPraat:pt.read]{rPraat::pt.read} or similar object.}

\item{pitch_plotType}{String giving the type of pitch plot to produce; default
is \code{draw} (a line plot), the only other option is \code{speckle} (a point plot).
Alternatively a vector \code{c('draw','speckle')} can be passed, in which case
both are used.}

\item{pitch_scale}{String giving the frequency scale to use when producing
pitch plots. Default is \code{hz}; other options are \code{logarithmic} (also in Hz),
\code{semitones}, \code{erb}, and \code{mel}.}

\item{pitch_freqRange}{Vector of two integers giving the frequency range to be
used for producing pitch plots. Default is \code{NULL}, in which case the pitch
range is automatically reset to \code{c(-12,30)} for the \code{semitones} scale,
\code{c(0,10)} for the \code{erb} scale, and \code{c(50,500)} for the Hz-based scales,
following Praat defaults.}

\item{pitch_axisLabel}{String giving the name of the label to print along the
y-axis when printing a pitch track. Default is \code{NULL}, in which case the
axis label will depend on the scale.}

\item{pitch_color}{String or vector of strings giving the name of the color
to be used for plotting pitch. Default is \code{'black'}. If a vector of two
strings is passed, the second color will be used for background highlighting.}

\item{pitch_highlight}{Named list giving parameters for differential
highlighting of pitch based on the time domain. This list
should contain information about which parts of the plot to highlight, either
done with the \code{start} and \code{end} arguments which must be numbers or numeric
vectors, or using the \code{tier} and \code{label} arguments to highlight based on
information in a plotted TextGrid. Further contains the optional arguments
\code{color} (string or vector of strings, see \code{pitch_color}),
\code{drawSize} or \code{speckleSize} (both numeric).}

\item{intensity_plotOnWave}{Boolean; should intensity be plotted on top of
waveform? Default is \code{FALSE}.}

\item{it}{Intensity object loaded using \link[rPraat:it.read]{rPraat::it.read} or similar object.}

\item{intensity_range}{Vector of two integers giving the intensity range to be
used for producing intensity plots. Default is \code{NULL}, in which case the
range is simply the minimum and maximum levels in the curve.}

\item{intensity_axisLabel}{String giving the name of the label to print along
the y-axis when plotting intensity. Default is \code{Intensity (dB)}.}

\item{intensity_color}{String or vector of strings giving the name of the
color to be used for plotting intensity. Default is \code{'black'}. If a vector of
two strings is passed, the second color will be used for background
highlighting.}

\item{intensity_highlight}{Named list giving parameters for differential
highlighting of the intensity contour based on the time domain. This list
should contain information about which parts of the plot to highlight, either
done with the \code{start} and \code{end} arguments which must be numbers or numeric
vectors, or using the \code{tier} and \code{label} arguments to highlight based on
information in a plotted TextGrid. Further contains the optional arguments
\code{color} (string or vector of strings, see \code{intensity_color}) and
\code{drawSize} (integer).}

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

\item{ind}{Integer indexing waveform relative to other plot components.
Default is \code{NULL}.}

\item{line_comp}{Vector of strings or numbers giving plot components to draw
straight lines on. Default is \code{NULL}.}

\item{rect_comp}{Vector of strings or numbers giving plot components to draw
rectangles on. Default is \code{NULL}.}

\item{arr_comp}{Vector of strings of numbers giving plot components to draw
arrows on. Default is \code{NULL}.}

\item{annot_comp}{Vector of strings of numbers giving plot components to
annotate. Default is \code{NULL}.}

\item{draw_lines}{List of arguments for drawing straight lines passed from
\code{praatpicture()}. Default is \code{NULL}.}

\item{draw_rectangle}{List of arguments for drawing rectangles passed from
\code{praatpicture()}. Default is \code{NULL}.}

\item{draw_arrow}{List of arguments for drawing arrows passed from
\code{praatpicture()}. Default is \code{NULL}.}

\item{annotate}{List of arguments for annotating passed from
\code{praatpicture()}. Default is \code{NULL}.}

\item{channelNames}{Logical; should names of audio channels be printed on
the y-axis? Default is \code{FALSE}.}

\item{axisDigits}{Numeric giving the number of digits to print for
values along the y-axis of the waveform. Default is \code{3}. If \code{0} is passed,
the y-axis is suppressed. Note that this only applies when
\code{min_max_only = TRUE}, as otherwise the look of the y-axis is determined
entirely using \code{grDevices::axisTicks()}.}

\item{lineWidth}{Number giving the line width to use for plotting
the waveform. Default is \code{1}.}

\item{cn}{Vector of strings with channel names to be printed on the y-axis
if \code{channelNames} is \code{TRUE}.}

\item{min_max_only}{Logical; should only minimum and maximum values be given
on the y-axis? Default is \code{TRUE}. Can also be a logical vector if some but
not all plot components should have minimum and maximum values on the y-axis.
Ignored for TextGrid component.}

\item{highlight}{Named list giving parameters for differential
highlighting of the waveform based on the time domain. This list
should contain information about which parts of the plot to highlight, either
done with the \code{start} and \code{end} arguments which must be numbers or numeric
vectors, or using the \code{tier} and \code{label} arguments to highlight based on
information in a plotted TextGrid. Further contains the argument
\code{color} (string, see \code{color}), and \code{background}
(a string specifying a background color).}

\item{drawSize}{Number indicating the line width of plot components where
the \verb{_plotType} is \code{'draw'} (i.e., pitch, formants, or intensity rendered as
line plots). Default is \code{1}. Controls the \code{lwd} argument of
\link[graphics:lines]{graphics::lines}.}

\item{speckleSize}{Number indicating the point size of plot components where
the \verb{_plotType} is \code{'speckle'} (i.e. pitch or formants rendered as point
plots). Default is \code{1}. Controls the \code{cex} arguments of \link[graphics:points]{graphics::points}.}
}
\value{
No return values, called internally by \link{praatpicture} and sibling
functions.
}
\description{
Function for plotting waveforms called by \link{praatpicture}. Instead of using
this function directly, just use
\code{praatpicture('my_sound_file', frames='sound')}.
}
\examples{
# Don't use directly
datapath <- system.file('extdata', package='praatpicture')
soundFile <- paste0(datapath, '/1.wav')
praatpicture(soundFile, frames='sound')
}
