#' Food Delivery Time Data
#'
#' @details
#' These data are from a study of food delivery times in minutes (i.e., the time from the
#' initial order to receiving the food) for a single restaurant. The data
#' contains 10,012 orders from a specific restaurant. The predictors include:
#' \itemize{
#' \item The time, in decimal hours, of the order.
#' \item The day of the week for the order.
#' \item The approximate distance in miles between the restaurant and the delivery
#'       location.
#' \item A set of 27 predictors that count the number of distinct menu items
#'       in the order.
#' }
#'
#' No times are censored.
#'
#' @name deliveries
#' @aliases deliveries
#' @docType data
#' @return \item{deliveries}{a tibble}
#'
#' @keywords datasets
#' @examples
#' data(deliveries)
#' str(deliveries)
NULL
