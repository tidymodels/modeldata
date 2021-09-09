#' Ames Housing Data
#'
#' A data set from De Cock (2011) has 82 fields were recorded for 2,930
#' properties in Ames IA. This version is copies from the `AmesHousing` package
#' but does not include a few quality columns that appear to be outcomes
#' rather than predictors.
#'
#' See this links for the sources below for more information as well as
#' `?AmesHousing::make_ames`.
#'
#' @includeRmd man/rmd/ames.md details
#'
#' @name ames
#' @aliases ames
#' @docType data
#' @return \item{ames}{a tibble}
#' @source De Cock, D. (2011). "Ames, Iowa: Alternative to the Boston Housing Data as an End of Semester Regression Project," \emph{Journal of Statistics Education},  Volume 19, Number 3.
#'
#' \url{http://jse.amstat.org/v19n3/decock/DataDocumentation.txt}
#'
#' \url{http://jse.amstat.org/v19n3/decock.pdf}
#' @keywords datasets
#' @examples
#' data(ames)
#' str(ames)
NULL
