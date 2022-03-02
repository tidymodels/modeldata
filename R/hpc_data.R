#' High-performance computing system data
#'
#' Kuhn and Johnson (2013) describe a data set where characteristics of unix
#' jobs were used to classify there completion times as either very fast
#' (1 min or less, `VF`), fast (1–50 min, `F`), moderate (5–30 min, `M`), or
#' long (greater than 30 min, `L`).
#'
#'
#' @name hpc_data
#' @aliases hpc_data
#' @docType data
#' @return \item{hpc_data}{a tibble}
#' @keywords datasets
#' @source
#' Kuhn, M., Johnson, K. (2013) *Applied Predictive Modeling*, Springer.
#' @examples
#'
#' data(hpc_data)
#' str(hpc_data)
NULL
