#' Simulate datasets
#'
#' These functions can be used to generate simulated data for supervised
#' (classification and regression) and unsupervised modeling applications.
#'
#' @param num_samples Number of data points to simulate.
#' @param method A character string for the simulation method. For
#' classification, the single current option is "caret". For regression,
#' values can be `"sapp_2014_1"`, `"sapp_2014_2"`, `"van_der_laan_2007_1"`,
#' `"van_der_laan_2007_2"`, `"hooker_2004"`, or `"worley_1987"`. See Details
#' below.
#' @param intercept The intercept for the linear predictor.
#' @param num_linear Number of diminishing linear effects.
#' @param std_dev Gaussian distribution standard deviation for residuals.
#' Default values are shown below in Details.
#' @param num_vars Number of noise predictors to create.
#' @param cov_type The multivariate normal correlation structure of the
#' predictors. Possible values are "exchangeable" and "toeplitz".
#' @param cov_param A single numeric value for the exchangeable correlation
#' value or the base of the Toeplitz structure. See Details below.
#' @param factors A single logical for whether the binary indicators should be
#' encoded as factors or not.
#' @param outcome A single character string for what type of independent outcome
#' should be simulated (if any). The default value of "none" produces no extra
#' columns. Using "classification" will generate a `class` column with
#' `num_classes` values, equally distributed. A value of "regression" results
#' in an `outcome` column that contains independent standard normal values.
#' @param num_classes When `outcome = "classification"`, the number of classes
#' to simulate.
#' @param keep_truth A logical: should the true outcome value be retained for
#' the data? If so, the column name is `.truth`.
#' @param eqn,eqn_1,eqn_2,eqn_3 An R expression or  (one sided) formula that
#' only involves variables `A` and `B` that is used to compute the linear
#' predictor. External objects should not be used as symbols; see the examples
#' below on how to use external objects in the equations.
#' @param correlation A single numeric value for the correlation between variables
#'  `A` and `B`.
#'
#' @details
#'
#' ## Specific Regression and Classification methods
#'
#' These functions provide several supervised simulation methods (and one
#' unsupervised). Learn more by `method`:
#'
#' ### `method = "caret"`
#'
#' This is a simulated classification problem with two classes, originally
#'  implemented in [caret::twoClassSim()] with all numeric predictors. The
#'  predictors are simulated in different sets. First, two multivariate normal
#'  predictors (denoted here as `two_factor_1` and `two_factor_2`) are created
#'  with a correlation of about 0.65. They change the log-odds using main
#'  effects and an interaction:
#'
#' \preformatted{  intercept - 4 * two_factor_1 + 4 * two_factor_2 + 2 * two_factor_1 * two_factor_2 }
#'
#' The intercept is a parameter for the simulation and can be used to control
#' the amount of class imbalance.
#'
#' The second set of effects are linear with coefficients that alternate signs
#' and have a sequence of values between 2.5 and 0.25. For example, if there
#' were four predictors in this set, their contribution to the log-odds would
#' be
#'
#' \preformatted{  -2.5 * linear_1 + 1.75 * linear_2 -1.00 * linear_3 + 0.25 * linear_4}
#'
#' (Note that these column names may change based on the value of `num_linear`).
#'
#' The third set is a nonlinear function of a single predictor ranging between
#' `[0, 1]` called `non_linear_1` here:
#'
#' \preformatted{  (non_linear_1^3) + 2 * exp(-6 * (non_linear_1 - 0.3)^2) }
#'
#' The fourth set of informative predictors are copied from one of Friedman's
#' systems and use two more predictors (`non_linear_2` and `non_linear_3`):
#'
#' \preformatted{  2 * sin(non_linear_2 * non_linear_3) }
#'
#' All of these effects are added up to model the log-odds.
#'
#' ### `method = "sapp_2014_1"`
#'
#' This regression simulation is from Sapp et al. (2014). There are 20
#' independent Gaussian random predictors with mean zero and a variance of 9.
#' The prediction equation is:
#'
#' \preformatted{
#'   predictor_01 + sin(predictor_02) + log(abs(predictor_03)) +
#'    predictor_04^2 + predictor_05 * predictor_06 +
#'    ifelse(predictor_07 * predictor_08 * predictor_09 < 0, 1, 0) +
#'    ifelse(predictor_10 > 0, 1, 0) + predictor_11 * ifelse(predictor_11 > 0, 1, 0) +
#'    sqrt(abs(predictor_12)) + cos(predictor_13) + 2 * predictor_14 + abs(predictor_15) +
#'    ifelse(predictor_16 < -1, 1, 0) + predictor_17 * ifelse(predictor_17 < -1, 1, 0) -
#'    2 * predictor_18 - predictor_19 * predictor_20
#' }
#'
#' The error is Gaussian with mean zero and variance 9.
#'
#' ### `method = "sapp_2014_2"`
#'
#' This regression simulation is also from Sapp et al. (2014). There are 200
#' independent Gaussian predictors with mean zero and variance 16. The
#' prediction equation has an intercept of one and identical linear effects of
#' `log(abs(predictor))`.
#'
#' The error is Gaussian with mean zero and variance 25.
#'
#' ### `method = "van_der_laan_2007_1"`
#'
#' This is a regression simulation from van der Laan et al. (2007) with ten
#' random Bernoulli variables that have a 40% probability of being a value of
#' one. The true regression equation is:
#'
#' \preformatted{
#'   2 * predictor_01 * predictor_10 + 4 * predictor_02 * predictor_07 +
#'     3 * predictor_04 * predictor_05 - 5 * predictor_06 * predictor_10 +
#'     3 * predictor_08 * predictor_09 + predictor_01 * predictor_02 * predictor_04 -
#'     2 * predictor_07 * (1 - predictor_06) * predictor_02 * predictor_09 -
#'     4 * (1 - predictor_10) * predictor_01 * (1 - predictor_04)
#' }
#'
#' The error term is standard normal.
#'
#' ### `method = "van_der_laan_2007_2"`
#'
#' This is another regression simulation from van der Laan et al. (2007)  with
#' twenty Gaussians with mean zero and variance 16. The prediction equation is:
#'
#' \preformatted{
#'   predictor_01 * predictor_02 + predictor_10^2 - predictor_03 * predictor_17 -
#'     predictor_15 * predictor_04 + predictor_09 * predictor_05 + predictor_19 -
#'     predictor_20^2 + predictor_09 * predictor_08
#' }
#'
#' The error term is also Gaussian with mean zero and variance 16.
#'
#' ### `method = "hooker_2004"`
#'
#' Hooker (2004) and Sorokina _at al_ (2008) used the following:
#'
#' \preformatted{
#'     pi ^ (predictor_01 * predictor_02) * sqrt( 2 * predictor_03 ) -
#'     asin(predictor_04) + log(predictor_03  + predictor_05) -
#'    (predictor_09 / predictor_10) * sqrt (predictor_07 / predictor_08) -
#'     predictor_02 * predictor_07
#' }
#'
#' Predictors 1, 2, 3, 6, 7, and 9 are standard uniform while the others are
#' uniform on `[0.6, 1.0]`. The errors are normal with mean zero and default
#' standard deviation of 0.25.
#'
#' ### `method = "worley_1987"`
#'
#' The simulation system from Worley (1987) is based on a mechanistic model for
#' the flow rate of liquids from two aquifers positioned vertically (i.e.,
#' the "upper" and "lower" aquifers). There are two sets of predictors:
#'
#'  - the borehole radius (`radius_borehole` from 0.05 to 0.15) and length
#'    (`length_borehole` from 1,120 to 1,680) .
#' - The radius of effect that the system has on collecting water
#'    (`radius_influence` from 100 to 50,000)
#'
#' and physical properties:
#'
#' -  `transmissibility_upper_aq`
#' -  `potentiometric_upper_aq`
#' -  `transmissibility_lower_aq`
#' -  `potentiometric_lower_aq`
#' -  `conductivity_borehole`
#'
#' A multiplicative error structure is used; the mechanistic equation is
#' multiplied by an expoentiated Gaussian random error.
#'
#' The references give feasible ranges for each of these variables. See also
#' Morris _et al_ (1993).
#'
#' ## `sim_noise()`
#'
#' This function simulates a number of random normal variables with mean zero.
#' The values can be independent if `cov_param = 0`. Otherwise the values are
#' multivariate normal with non-diagonal covariance matrices. For
#' `cov_type = "exchangeable"`, the structure has unit variances and covariances
#' of `cov_param`. With `cov_type = "toeplitz"`, the covariances have an
#' exponential pattern (see example below).
#'
#' ## Logistic simulation
#'
#' `sim_logistic()` provides a flexible interface to simulating a logistic
#' regression model with two multivariate normal variables `A` and `B` (with
#' zero mean, unit variances and correlation determined by the `correlation`
#' argument).
#'
#' For example, using `eqn = A + B` would specify that the true probability of
#' the event was
#'
#' \preformatted{
#'    prob = 1 / (1 + exp(A + B))
#' }
#'
#' The class levels for the outcome column are `"one"` and `"two"`.
#'
#' ## Multinomial simulation
#'
#' `sim_multinomial()` can generate data with classes `"one"`, `"two"`, and
#' `"three"` based on the values in arguments `eqn_1`, `eqn_2`, and `eqn_3`,
#' respectfully. Like [sim_logistic()] these equations use predictors `A` and
#' `B`.
#'
#' The individual equations are evaluated and exponentiated. After this, their
#' values are, for each row of data, normalized to add up to one. These
#' probabilities are them passed to [stats::rmultinom()] to generate the outcome
#' values.
#'
#' @references
#' Hooker, G. (2004, August). Discovering additive structure in black box
#' functions. In _Proceedings of the tenth ACM SIGKDD international conference
#' on Knowledge discovery and data mining_ (pp. 575-580).
#' DOI: 10.1145/1014052.1014122
#'
#' Morris, M. D., Mitchell, T. J., and Ylvisaker, D. (1993). Bayesian design
#' and analysis of computer experiments: use of derivatives in surface
#' prediction. _Technometrics_, 35(3), 243-255.
#'
#' Sapp, S., van der Laan, M. J., and Canny, J. (2014). Subsemble: an ensemble
#' method for combining subset-specific algorithm fits. _Journal of applied
#' statistics_, 41(6), 1247-1259. DOI: 10.1080/02664763.2013.864263
#'
#' Sorokina, D., Caruana, R., Riedewald, M., and Fink, D. (2008, July). Detecting
#' statistical interactions with additive groves of trees. In _Proceedings of
#' the 25th international conference on Machine learning_ (pp. 1000-1007).
#' DOI: 10.1145/1390156.1390282
#'
#' Van der Laan, M. J., Polley, E. C., and Hubbard, A. E. (2007). Super learner.
#' _Statistical applications in genetics and molecular biology_, 6(1).
#' DOI: 10.2202/1544-6115.1309.
#'
#' Worley, B. A. (1987). Deterministic uncertainty analysis (No. ORNL-6428). Oak
#' Ridge National Lab.(ORNL), Oak Ridge, TN/
#'
#'
#' @examples
#' set.seed(1)
#' sim_regression(100)
#' sim_classification(100)
#'
#' # Flexible logistic regression simulation
#' if (rlang::is_installed("ggplot2")) {
#'   library(dplyr)
#'   library(ggplot2)
#'
#'   sim_logistic(1000, ~ .1 + 2 * A - 3 * B + 1 * A *B, corr = .7) |>
#'     ggplot(aes(A, B, col = class)) +
#'     geom_point(alpha = 1/2) +
#'     coord_equal()
#'
#'   f_xor <- ~ 10 * xor(A > 0, B < 0)
#'   # or
#'   f_xor <- rlang::expr(10 * xor(A > 0, B < 0))
#'
#'   sim_logistic(1000, f_xor, keep_truth = TRUE) |>
#'     ggplot(aes(A, B, col = class)) +
#'     geom_point(alpha = 1/2) +
#'     coord_equal() +
#'     theme_bw()
#' }
#'
#' ## How to use external symbols:
#'
#' a_coef <- 2
#' # splice the value in using rlang's !! operator
#' lp_eqn <- rlang::expr(!!a_coef * A+B)
#' lp_eqn
#' sim_logistic(5, lp_eqn)
#'
#' # Flexible multinomial regression simulation
#' if (rlang::is_installed("ggplot2")) {
#'
#   set.seed(2)
#   three_classes <-
#     sim_multinomial(
#       1000,
#       ~  -0.5    +  0.6 * abs(A),
#       ~ ifelse(A > 0 & B > 0, 1.0 + 0.2 * A / B, - 2),
#       ~ -0.6 * A + 0.50 * B -  A * B)
#
#   three_classes |>
#     ggplot(aes(A, B, col = class, pch = class)) +
#     geom_point(alpha = 3/4) +
#     facet_wrap(~ class) +
#     coord_equal() +
#     theme_bw()
#' }
#' @export
sim_classification <- function(
  num_samples = 100,
  method = "caret",
  intercept = -5,
  num_linear = 10,
  keep_truth = FALSE
) {
  method <- rlang::arg_match0(method, "caret", arg_nm = "method")

  if (method == "caret") {
    # Simulate two correlated normal variates
    var_cov <- matrix(c(2, 1.3, 1.3, 2), 2, 2)
    dat <- MASS::mvrnorm(n = num_samples, c(0, 0), var_cov)

    # Simulate a uniform for the first nonlinear term
    dat <- cbind(dat, stats::runif(num_samples, min = -1))
    # Simulate second two nonlinear terms
    dat <- cbind(dat, matrix(stats::runif(num_samples * 2), ncol = 2))

    # Assign names
    colnames(dat) <- c(paste0("two_factor_", 1:2), paste0("non_linear_", 1:3))

    linear_pred <-
      rlang::expr(
        !!intercept -
          4 * two_factor_1 +
          4 * two_factor_2 +
          2 * two_factor_1 * two_factor_2 +
          (non_linear_1^3) +
          2 * exp(-6 * (non_linear_1 - 0.3)^2) +
          2 * sin(pi * non_linear_2 * non_linear_3)
      )

    # Simulate a series of linear coefficients
    if (num_linear > 0) {
      dat_linear <- matrix(
        stats::rnorm(num_samples * num_linear),
        ncol = num_linear
      )
      lin_names <- names0(num_linear, "linear_")
      colnames(dat_linear) <- lin_names
      lin_symbols <- rlang::syms(lin_names)
      lin_coefs <-
        seq(10, 1, length = num_linear) /
        4 *
        rep_len(c(-1, 1), length.out = num_linear)
      lin_expr <-
        purrr::map2(lin_coefs, lin_symbols, ~ rlang::expr(!!.x * !!.y)) |>
        purrr::reduce(function(l, r) rlang::expr(!!l + !!r))
      .truth <- rlang::expr(!!linear_pred + !!lin_expr)
      dat <- cbind(dat, dat_linear)
    }
  }

  dat <- tibble::as_tibble(dat)

  dat <-
    dat |>
    dplyr::mutate(
      linear_pred = rlang::eval_tidy(linear_pred, data = dat),
      .truth = stats::binomial()$linkinv(linear_pred),
      rand = stats::runif(num_samples),
      class = ifelse(rand <= .truth, "class_1", "class_2"),
      class = factor(class, levels = c("class_1", "class_2"))
    ) |>
    dplyr::select(-linear_pred, -rand) |>
    dplyr::relocate(class)

  if (!keep_truth) {
    dat <- dplyr::select(dat, -.truth)
  }

  dat
}

#' @export
#' @rdname sim_classification
sim_regression <-
  function(
    num_samples = 100,
    method = "sapp_2014_1",
    std_dev = NULL,
    factors = FALSE,
    keep_truth = FALSE
  ) {
    reg_methods <- c(
      "sapp_2014_1",
      "sapp_2014_2",
      "van_der_laan_2007_1",
      "van_der_laan_2007_2",
      "hooker_2004",
      "worley_1987"
    )
    method <- rlang::arg_match0(method, reg_methods, arg_nm = "method")

    dat <-
      switch(
        method,
        sapp_2014_1 = sapp_2014_1(num_samples, std_dev),
        sapp_2014_2 = sapp_2014_2(num_samples, std_dev),
        van_der_laan_2007_1 = van_der_laan_2007_1(
          num_samples,
          std_dev,
          factors = factors
        ),
        van_der_laan_2007_2 = van_der_laan_2007_2(num_samples, std_dev),
        hooker_2004 = hooker_2004(num_samples, std_dev),
        worley_1987 = worley_1987(num_samples, std_dev)
      )

    if (!keep_truth) {
      dat <- dplyr::select(dat, -.truth)
    }

    dat
  }


sapp_2014_1 <- function(num_samples = 100, std_dev = NULL) {
  if (is.null(std_dev)) {
    std_dev <- 3
  }
  dat <- matrix(stats::rnorm(num_samples * 20, sd = 3), ncol = 20)
  colnames(dat) <- names0(20, "predictor_")
  dat <- tibble::as_tibble(dat)

  slc_14 <- rlang::expr(
    predictor_01 +
      sin(predictor_02) +
      log(abs(predictor_03)) +
      predictor_04^2 +
      predictor_05 * predictor_06 +
      ifelse(predictor_07 * predictor_08 * predictor_09 < 0, 1, 0) +
      ifelse(predictor_10 > 0, 1, 0) +
      predictor_11 * ifelse(predictor_11 > 0, 1, 0) +
      sqrt(abs(predictor_12)) +
      cos(predictor_13) +
      2 * predictor_14 +
      abs(predictor_15) +
      ifelse(predictor_16 < -1, 1, 0) +
      predictor_17 * ifelse(predictor_17 < -1, 1, 0) -
      2 * predictor_18 -
      predictor_19 * predictor_20
  )

  dat <-
    dat |>
    dplyr::mutate(
      .truth = rlang::eval_tidy(slc_14, data = dat),
      outcome = .truth + stats::rnorm(num_samples, sd = std_dev)
    ) |>
    dplyr::relocate(outcome)

  dat
}

sapp_2014_2 <- function(num_samples = 100, std_dev = 4) {
  if (is.null(std_dev)) {
    std_dev <- 5
  }
  dat <- matrix(stats::rnorm(num_samples * 200, sd = 4), ncol = 200)
  colnames(dat) <- names0(200, "predictor_")

  slc_14 <- function(x) sum(log(abs(x)))

  .truth <- apply(dat, 1, slc_14)
  y <- .truth + stats::rnorm(num_samples, sd = std_dev) - 1
  dat <- tibble::as_tibble(dat)
  dat$outcome <- y
  dat$.truth <- .truth
  dplyr::relocate(dat, outcome)
}

van_der_laan_2007_1 <- function(
  num_samples = 100,
  std_dev = NULL,
  factors = FALSE
) {
  if (is.null(std_dev)) {
    std_dev <- 1
  }
  dat <- matrix(stats::rbinom(num_samples * 10, size = 1, prob = .4), ncol = 10)
  colnames(dat) <- names0(10, "predictor_")
  dat <- tibble::as_tibble(dat)

  lph_07 <- rlang::expr(
    2 *
      predictor_01 *
      predictor_10 +
      4 * predictor_02 * predictor_07 +
      3 * predictor_04 * predictor_05 -
      5 * predictor_06 * predictor_10 +
      3 * predictor_08 * predictor_09 +
      predictor_01 * predictor_02 * predictor_04 -
      2 * predictor_07 * (1 - predictor_06) * predictor_02 * predictor_09 -
      4 * (1 - predictor_10) * predictor_01 * (1 - predictor_04)
  )

  dat <-
    dat |>
    dplyr::mutate(
      .truth = rlang::eval_tidy(lph_07, data = dat),
      outcome = .truth + stats::rnorm(num_samples, sd = std_dev)
    ) |>
    dplyr::relocate(outcome)

  if (factors) {
    dat <-
      dat |>
      dplyr::mutate(
        dplyr::across(2:11, ~ ifelse(.x == 1, "yes", "no")),
        dplyr::across(2:11, ~ factor(.x, levels = c("yes", "no")))
      )
  }

  dat
}

van_der_laan_2007_2 <- function(num_samples = 100, std_dev = NULL) {
  if (is.null(std_dev)) {
    std_dev <- 4
  }
  dat <- matrix(stats::rnorm(num_samples * 20, sd = 4), ncol = 20)
  colnames(dat) <- names0(20, "predictor_")
  dat <- tibble::as_tibble(dat)

  lph_07 <- rlang::expr(
    predictor_01 *
      predictor_02 +
      predictor_10^2 -
      predictor_03 * predictor_17 -
      predictor_15 * predictor_04 +
      predictor_09 * predictor_05 +
      predictor_19 -
      predictor_20^2 +
      predictor_09 * predictor_08
  )

  dat <-
    dat |>
    dplyr::mutate(
      .truth = rlang::eval_tidy(lph_07, data = dat),
      outcome = .truth + stats::rnorm(num_samples, sd = std_dev)
    ) |>
    dplyr::relocate(outcome)

  dat
}

# TODO see table 1 of Detecting Statistical Interactions from Neural Network Weights for more
hooker_2004 <- function(num_samples = 100, std_dev = NULL) {
  if (is.null(std_dev)) {
    std_dev <- 1 / 4
  }
  uni_1 <- matrix(stats::runif(num_samples * 6), ncol = 6)
  uni_2 <- matrix(stats::runif(num_samples * 4, min = 0.6), ncol = 4)
  all_names <- names0(10, "predictor_")
  colnames(uni_1) <- all_names[c(1, 2, 3, 6, 7, 9)]
  colnames(uni_2) <- all_names[c(4, 5, 8, 10)]
  dat <- cbind(uni_1, uni_2)
  dat <- tibble::as_tibble(dat) |> dplyr::select(dplyr::all_of(all_names))

  hooker_2004 <- rlang::expr(
    pi^(predictor_01 * predictor_02) *
      sqrt(2 * predictor_03) -
      asin(predictor_04) +
      log(predictor_03 + predictor_05) -
      (predictor_09 / predictor_10) * sqrt(predictor_07 / predictor_08) -
      predictor_02 * predictor_07
  )

  dat <-
    dat |>
    dplyr::mutate(
      .truth = rlang::eval_tidy(hooker_2004, data = dat),
      outcome = .truth + stats::rnorm(num_samples, sd = std_dev)
    ) |>
    dplyr::relocate(outcome)

  dat
}

worley_1987 <- function(num_samples = 100, std_dev = 0.25) {
  if (is.null(std_dev)) {
    std_dev <- 0.25
  }
  radius_borehole <- runif(num_samples, min = 0.05, max = 0.15)
  length_borehole <- runif(num_samples, min = 1120, max = 1680)
  radius_influence <- 10^runif(num_samples, min = 2, max = log10(50000))
  transmissibility_upper_aq <- 10^runif(
    num_samples,
    min = log10(63070),
    max = log10(115600)
  )
  potentiometric_upper_aq <- runif(num_samples, min = 990, max = 1110)
  transmissibility_lower_aq <- runif(num_samples, min = 63.1, max = 116)
  potentiometric_lower_aq <- runif(num_samples, min = 700, max = 820)
  # conductivity_borehole <- runif(num_samples, min = 9855, max = 12045)
  # expanded range from Moriss at al
  conductivity_borehole <- 10^runif(
    num_samples,
    min = log10(1500),
    max = log10(15000)
  )

  numer <- 2 *
    pi *
    transmissibility_upper_aq *
    (potentiometric_upper_aq - potentiometric_lower_aq)

  denom_1 <- log(radius_influence / radius_borehole)

  denom_2 <- 2 *
    length_borehole *
    transmissibility_upper_aq /
    (denom_1 * radius_borehole^2 * conductivity_borehole)

  denom_3 <- transmissibility_upper_aq / transmissibility_lower_aq

  error <- exp(rnorm(num_samples, mean = 0, sd = std_dev))

  tibble::tibble(
    .truth = numer / (denom_1 * (1 + denom_2 + denom_3)),
    outcome = .truth * error,
    radius_borehole = radius_borehole,
    length_borehole = length_borehole,
    radius_influence = radius_influence,
    transmissibility_upper_aq = transmissibility_upper_aq,
    potentiometric_upper_aq = potentiometric_upper_aq,
    transmissibility_lower_aq = transmissibility_lower_aq,
    potentiometric_lower_aq = potentiometric_lower_aq,
    conductivity_borehole = conductivity_borehole
  )
}

# ------------------------------------------------------------------------------

#' @export
#' @rdname sim_classification
sim_noise <- function(
  num_samples,
  num_vars,
  cov_type = "exchangeable",
  outcome = "none",
  num_classes = 2,
  cov_param = 0
) {
  cov_type <- rlang::arg_match0(
    cov_type,
    c("exchangeable", "toeplitz"),
    arg_nm = "cov_type"
  )
  outcome <- rlang::arg_match0(
    outcome,
    c("none", "classification", "regression"),
    arg_nm = "outcome"
  )
  if (cov_type == "exchangeable") {
    var_cov <- matrix(cov_param, ncol = num_vars, nrow = num_vars)
    diag(var_cov) <- 1
  } else {
    var_cov_values <- cov_param^(seq(0, num_vars - 1, by = 1))
    var_cov <- stats::toeplitz(var_cov_values)
  }
  dat <- MASS::mvrnorm(num_samples, mu = rep(0, num_vars), Sigma = var_cov)
  colnames(dat) <- names0(num_vars, "noise_")
  dat <- tibble::as_tibble(dat)

  if (outcome == "classification") {
    if (num_classes <= 0) {
      rlang::abort("'num_classes' should be a positive integer.")
    }
    cls <- names0(num_classes, "class_")
    dat <-
      dat |>
      dplyr::mutate(
        class = sample(cls, num_samples, replace = TRUE),
        class = factor(class, levels = cls)
      ) |>
      dplyr::relocate(class)
  } else if (outcome == "regression") {
    dat <-
      dat |>
      dplyr::mutate(outcome = stats::rnorm(num_samples)) |>
      dplyr::relocate(outcome)
  }
  dat
}

# ------------------------------------------------------------------------------

#' @export
#' @rdname sim_classification
sim_logistic <- function(
  num_samples,
  eqn,
  correlation = 0,
  keep_truth = FALSE
) {
  sigma <- matrix(c(1, correlation, correlation, 1), 2, 2)
  eqn <- rlang::get_expr(eqn)
  check_equations(eqn)
  dat <-
    data.frame(MASS::mvrnorm(n = num_samples, c(0, 0), sigma)) |>
    stats::setNames(LETTERS[1:2]) |>
    tibble::as_tibble()

  dat <-
    dat |>
    dplyr::mutate(
      .linear_pred = rlang::eval_tidy(eqn, data = dat),
      .linear_pred = as.numeric(.linear_pred),
      .truth = stats::binomial()$linkinv(.linear_pred),
      .rand = stats::runif(num_samples),
      class = ifelse(.rand <= .truth, "one", "two"),
      class = factor(class, levels = c("one", "two"))
    ) |>
    dplyr::select(-.rand) |>
    tibble::as_tibble()

  if (!keep_truth) {
    dat <- dat |> dplyr::select(-.truth, -.linear_pred)
  }
  dat
}

# ------------------------------------------------------------------------------

#' @export
#' @rdname sim_classification
sim_multinomial <- function(
  num_samples,
  eqn_1,
  eqn_2,
  eqn_3,
  correlation = 0,
  keep_truth = FALSE
) {
  sigma <- matrix(c(1, correlation, correlation, 1), 2, 2)
  eqn_1 <- rlang::get_expr(eqn_1)
  eqn_2 <- rlang::get_expr(eqn_2)
  eqn_3 <- rlang::get_expr(eqn_3)
  purrr::map_lgl(list(eqn_1, eqn_2, eqn_3), check_equations)

  dat <- data.frame(MASS::mvrnorm(n = num_samples, c(0, 0), sigma)) |>
    stats::setNames(LETTERS[1:2]) |>
    tibble::as_tibble()

  dat <-
    dat |>
    dplyr::mutate(
      .formula_1 = rlang::eval_tidy(eqn_1, data = dat),
      .formula_2 = rlang::eval_tidy(eqn_2, data = dat),
      .formula_3 = rlang::eval_tidy(eqn_3, data = dat),
      dplyr::across(c(dplyr::starts_with(".formula_")), ~ exp(.x))
    )
  probs <- as.matrix(dplyr::select(dat, dplyr::starts_with(".formula_")))
  probs <- t(apply(probs, 1, function(x) x / sum(x)))
  which_class <- function(x) which.max(stats::rmultinom(1, 1, x))
  index <- apply(probs, 1, which_class)
  lvls <- c("one", "two", "three")
  dat$class <- factor(lvls[index], levels = lvls)
  dat <- dat |> dplyr::select(-dplyr::starts_with(".formula_"))
  if (keep_truth) {
    colnames(probs) <- paste0(".truth_", lvls)
    probs <- tibble::as_tibble(probs)
    dat <- dplyr::bind_cols(dat, probs)
  }
  tibble::as_tibble(dat)
}

# ------------------------------------------------------------------------------

check_equations <- function(x, expected = LETTERS[1:2]) {
  used <- sort(all.vars(x))
  its_fine <- length(setdiff(used, expected)) == 0
  if (!its_fine) {
    rlang::abort(
      "The model equations should only use variables/objects `A` and `B`"
    )
  }
  invisible(its_fine)
}

names0 <- function(num, prefix = "x") {
  if (num < 1) {
    rlang::abort("`num` should be > 0")
  }
  ind <- format(1:num)
  ind <- gsub(" ", "0", ind)
  paste0(prefix, ind)
}
