#' Class probability predictions
#'
#' @details This data frame contains the predicted classes and
#'  class probabilities for a linear discriminant analysis model fit
#'  to the HPC data set from Kuhn and Johnson (2013). These data are
#'  the assessment sets from a 10-fold cross-validation scheme. The
#'  data column columns for the true class (`obs`), the class
#'  prediction (`pred`) and columns for each class probability
#'  (columns `VF`, `F`, `M`, and `L`). Additionally, a column for
#'  the resample indicator is included.
#'
#' @name hpc_cv
#' @aliases hpc_cv
#' @docType data
#' @return \item{hpc_cv}{a data frame}
#'
#' @source Kuhn, M., Johnson, K. (2013) *Applied Predictive
#'  Modeling*, Springer
#'
#' @keywords datasets
#' @examples
#' data(hpc_cv)
#' str(hpc_cv)
NULL
