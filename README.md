
<!-- README.md is generated from README.Rmd. Please edit that file -->

# praatpicture

If you’ve ever had to fiddle around with getting a Praat Picture to look
and export just right in order to insert it in an R markdown file or
slide deck, then this package is for you! Even if this isn’t the case,
the package offers some very useful flexibility. It’s a simple set of
functions designed to emulate some common plots made in Praat Picture
with base R plotting. It allows for flexibly combining waveforms,
spectrograms, TextGrids, pitch tracks, formant tracks, and intensity
tracks in a single plot. The derived acoustic plots can all be generated
directly in R, or (except in the case of spectrograms) generated in
Praat.

TextGrids can be plotted as long as there is a file with the `.TextGrid`
extension in the same directory and with the same base name as the sound
file. If there are files with the `.PitchTier`, `.Formant`, and
`.IntensityTier` extensions generated in Praat, these are loaded in
using the `rPraat` package and used for plotting. Otherwise, signal
processing functions from the `wrassp` package are used in a way that
emulates Praat default settings as closely as possible. Spectrograms are
generated with the `phonTools` package.

If you are an `emuR` user, the `emupicture` function will help make
Praat Picture style plots of sound files, annotations, and possibly SSFF
files from an EMU-database.

For more information on how to use the package, see the
[manual](https://rpuggaardrode.github.io/praatpicture_manual/).

If you run into bugs or have suggested changes, please let me know!

## Installation

`praatpicture` is on CRAN and can be installed in the usual way:

``` r
install.packages('praatpicture')
```

You can install the latest development version of `praatpicture` like
so:

``` r
#install.packages('devtools')
devtools::install_github('rpuggaardrode/praatpicture')
```

New features will be available from Github before they are available on
CRAN.
