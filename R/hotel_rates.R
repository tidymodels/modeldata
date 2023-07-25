#' Daily Hotel Rate Data
#'
#' @description
#' A data set to predict the average daily rate for a hotel in Lisbon Portugal.
#'
#' @name hotel_rates
#' @aliases hotel_rates
#' @docType data
#'
#' @details
#'
#' Data are originally described in Antonio, de Almeida, and Nunes (2019).
#' This version of the data is filtered for one hotel (the "Resort Hotel") and
#' is intended as regression data set for predicting the average daily rate for
#' a room. The data are post-2016; the 2016 data were used to have a predictor
#' for the historical daily rates. See the `hotel_rates.R` file in the
#' `data-raw` directory of the package to understand other filters used when
#' creating this version of the data.
#'
#' The `agent` and `company` fields were changed from random characters to use
#' a set of random names.
#'
#' The outcome column is `avg_price_per_room`.
#'
#' ## License
#'
#' No license was given for the data; See the reference below for source.
#'
#' @source
#' \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-02-11}
#'
#' @references
#' Antonio, N., de Almeida, A., and Nunes, L. (2019). Hotel booking demand
#' datasets. _Data in Brief_, 22, 41-49.
#'
#' @keywords datasets
#' @examples
#' \dontrun{
#' str(hotel_rates)
#' }
NULL
