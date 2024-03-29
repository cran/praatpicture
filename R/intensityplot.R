#' Plot intensity object
#'
#' Function for plotting intensity objects called by [praatpicture]. Instead of
#' using this function directly, just use
#' `praatpicture('my_sound_file', frames='intensity')`.
#'
#' @param it IntensityTier object loaded using [rPraat::it.read]
#' @param start Start time (in seconds) of desired plotted area.
#' @param end End time (in seconds) of desired plotted area.
#' @param tfrom0 Logical; should time on the x-axis run from 0 or from the
#' original time? Default is `TRUE`.
#' @param tgbool Logical; should dotted lines be plotted corresponding to
#' locations in a TextGrid? Default is `FALSE`.
#' @param lines Numeric vector giving locations in seconds of locations from
#' a TextGrid to be plotted with dotted lines. Default is `NULL`.
#' @param focusTierColor String or vector of strings giving the color(s) to
#' use for plotting focus tier lines. If multiple tiers are focused, a vector
#' of the same length can be passed, and the nth tier will be plotted in the
#' nth color. Default is `'black'`.
#' @param focusTierLineType String or vector of strings giving the line
#' type(s) for plotting focus tier lines. If multiple tiers are focused, a
#' vector of the same length can be passed, and the nth tier will be plotted in
#' the nth line type. Default is `'dotted'`.
#' @param range Vector of two integers giving the intensity range to be
#' used for producing intensity plots. Default is `NULL`, in which case the
#' range is simply the minimum and maximum levels in the curve.
#' @param color String giving the name of the color to be used for
#' plotting intensity. Default is `'black'`.
#' @param ind Integer indexing waveform relative to other plot components.
#' Default is `NULL`.
#' @param min_max_only Logical; should only minimum and maximum values be given
#' on the y-axis? Default is `TRUE`. Can also be a logical vector if some but
#' not all plot components should have minimum and maximum values on the y-axis.
#' Ignored for TextGrid component.
#' @param axisLabel String giving the name of the label to print along
#' the y-axis when plotting intensity. Default is `Intensity (dB)`.
#'
#' @return No return values, called internally by [praatpicture] and sibling
#' functions.
#' @export
#'
#' @examples
#' # Don't use directly
#' datapath <- system.file('extdata', package='praatpicture')
#' soundFile <- paste0(datapath, '/1.wav')
#' praatpicture(soundFile, frames='intensity')
intensityplot <- function(it, start, end, tfrom0=TRUE, tgbool=FALSE, lines=NULL,
                          focusTierColor='black', focusTierLineType='dotted',
                          range=NULL, color='black', ind=NULL, min_max_only=TRUE,
                          axisLabel='Intensity (dB)') {

  if (!min_max_only[ind]) {
    if (ind == 1) {
      yax <- 's'
    } else {
      ytix <- grDevices::axisTicks(range, log=F)
      ytix <- ytix[-length(ytix)]
      yax <- 'n'
    }
  } else {
    yax <- 'n'
    ytix <- round(range, 0)
  }

  if (tfrom0) {
    it$t <- it$t - start
    start <- 0
  }

  plot(it$t, it$i, xlim=c(start, end+start), xaxt='n',
       ylim=range, yaxt=yax, type='l', col=color)
  if (!min_max_only[ind] & ind != 1) graphics::axis(2, at=ytix)
  if (min_max_only[ind]) graphics::axis(2, at=ytix, padj=c(0,1), las=2,
                                        tick=F)
  if (tgbool) {
    for (i in 1:length(lines)) {
      graphics::abline(v=lines[[i]], col=focusTierColor[i],
                       lty=focusTierLineType[i])
    }
  }
  graphics::mtext(axisLabel, side=2, line=3.5, cex=0.8)

}
