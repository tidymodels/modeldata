#' Predicting hepatic injury from chemical information
#'
#' @description
#' A quantitative structure-activity relationship (QSAR) data set to predict
#' when a molecule has risk associated with liver function.
#'
#' @name hepatic_injury_qsar
#' @aliases hepatic_injury_qsar
#' @docType data
#' @return \item{hepatic_injury_qsar}{a tibble}
#'
#' @details
#' This  data set was used to develop a model for predicting compounds'
#' probability of causing hepatic injury (i.e. liver damage). This data set
#' consisted of 281 unique compounds; 376 predictors were measured or computed
#' for each. The response was categorical (either "none", "mild", or "severe"),
#' and was highly unbalanced.
#'
#' This kind of response often occurs in pharmaceutical data because companies
#' steer away from creating molecules that have undesirable characteristics.
#' Therefore, well-behaved molecules often greatly outnumber undesirable
#' molecules. The predictors consisted of measurements from 184 biological
#' screens and 192 chemical feature predictors. The biological predictors
#' represent activity for each screen and take values between 0 and 10 with a
#' mode of 4. The chemical feature predictors represent counts of important
#' sub-structures as well as measures of physical properties that are thought to
#' be associated with hepatic injury.
#'
#' Columns:
#' \itemize{
#'  \item \code{class}:  ordered and factor (levels: 'none', 'mild', and 'severe')
#'  \item \code{bio_assay_001} - \code{bio_assay_184}:  numeric
#'  \item \code{chem_fp_001} - \code{chem_fp_192}:  numeric
#' }
#' @source
#' Kuhn, Max, and Kjell Johnson. _Applied predictive modeling_. New York:
#' Springer, 2013.
#'
#' @examples
#' data(hepatic_injury_qsar)
#' str(hepatic_injury_qsar)
#'
NULL
