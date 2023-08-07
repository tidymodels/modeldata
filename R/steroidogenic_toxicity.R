#' Predicting steroidogenic toxicity with assay data
#'
#' @description
#' A set of _in vitro_ assays are used to quantify the risk of reproductive
#' toxicity via the disruption of steroidogenic pathways.
#'
#' @name steroidogenic_toxicity
#' @aliases steroidogenic_toxicity
#' @docType data
#' @return A tibble with columns
#'  - `class`: factor(levels: toxic and nontoxic)
#'  - `cyp_11a1`: numeric
#'  - `cyp_11b1`: numeric
#'  - `cyp_11b2`: numeric
#'  - `cyp_17a1`: numeric
#'  - `cyp_19a1`: numeric
#'  - `cyp_21a1`: numeric
#'  - `hsd3b2`: numeric
#'  - `star`: numeric
#'  - `progesterone`: numeric
#'  - `testosterone`: numeric
#'  - `dhea`: numeric
#'  - `cortisol`: numeric

#' @details
#' H295R cells were used to measure the effect with two sets of assay results.
#' The first includes a set of protein measurements on: cytochrome P450 enzymes
#' ("cyp"s), STAR, and 3BHSD2. The second include hormone measurements for
#' DHEA, progesterone, testosterone, and cortisol.
#'
#' Columns:
#' \itemize{
#'  \item \code{class}: factor (levels: 'toxic' and 'nontoxic')
#'  \item \code{cyp_11a1}: numeric
#'  \item \code{cyp_11b1}: numeric
#'  \item \code{cyp_11b2}: numeric
#'  \item \code{cyp_17a1}: numeric
#'  \item \code{cyp_19a1}: numeric
#'  \item \code{cyp_21a1}: numeric
#'  \item \code{hsd3b2}: numeric
#'  \item \code{star}: numeric
#'  \item \code{progesterone}: numeric
#'  \item \code{testosterone}: numeric
#'  \item \code{dhea}: numeric
#'  \item \code{cortisol}: numeric
#' }
#'
#' @source
#' Maglich, J. M., Kuhn, M., Chapin, R. E., & Pletcher, M. T. (2014). More than
#' just hormones: H295R cells as predictors of reproductive toxicity.
#' _Reproductive Toxicology_, 45, 77-86.
#'
#' @examples
#' data(steroidogenic_toxicity)
#' str(steroidogenic_toxicity)
#'
NULL
