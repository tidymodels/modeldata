#' Random non-informative columns
#'
#' These functions generate random columns of data. `random_numeric_noise()`
#' creates a set of multivariate normal columns with zero means and a correlation
#' structure of the user's choosing. `random_categorical_noise()` creates columns
#' of factor variables where the user chooses how many levels each column
#' should have.
#' @param num_samples The number of rows in the data set.
#' @param num_var The number of columns.
#' @param cov_val An optional covariance parameter that is used when `cov_type` is
#' not "independent". See Details below.
#' @param cov_type A single character string with possible values "independent",
#' "exchangeable", or "toeplitz". See Details below.
#' @param num_values A single integer for how many levels each factor will have
#' (up to 62 levels are allowed).
#' @param prefix A character string used for naming the columns.
#' @return A tibble.
#' @export
#' @examples
#' library(dplyr)
#' set.seed(983)
#' random_numeric_noise(10, 2)
#'
#' random_numeric_noise(1000, 5, cov_type = "exchangeable") %>%
#'   cor() %>%
#'   round(3)
#' random_numeric_noise(1000, 5, cov_type = "toeplitz", cov_val = 0.9) %>%
#'   cor() %>%
#'   round(3)
#'
#' str(random_categorical_noise(10, 2, num_values = 3))
random_numeric_noise <-
  function(num_samples, num_var, cov_val = 0.5, cov_type = "independent", prefix = "noise_") {
    cov_type <-
      match.arg(cov_type, c("independent", "exchangeable", "toeplitz"))
    means <- rep(0, num_var)

    if (cov_type == "independent") {
      cov_mat <- diag(num_var)
    } else  if (cov_type == "exchangeable") {
      cov_mat <- matrix(cov_val, ncol = num_var,  nrow = num_var)
      diag(cov_mat) <- 1
    } else {
      cov_val <- cov_val ^ (seq(0, num_var - 1, by = 1))
      cov_mat <- toeplitz(cov_val)
    }
    dat <- MASS::mvrnorm(num_samples, mu = means, Sigma = cov_mat)
    colnames(dat) <- names0(num_var, prefix)
    dat <- dplyr::as_tibble(dat)
    dat
  }

#' @export
#' @rdname random_numeric_noise
random_categorical_noise <-
  function(num_samples, num_var, num_values = 3, prefix = "noise_") {
    lvl_list <- c(letters, LETTERS, paste(0:9))
    if (num_values > length(lvl_list)) {
      rlang::abort(paste("'num_values' should be <=", length(lvl_list)))
    }
    nms <- names0(num_var, prefix)
    lvl <- purrr::map(1:num_var, ~ lvl_list[1:num_values])
    vars <- 1:num_var
    names(vars) <- nms
    purrr::map2_dfc(vars, lvl, ~ factor(sample(.y, num_samples, replace = TRUE), levels = .y))
  }

rand_tibble <- function(n, p, prefix = "x", fn = rnorm, ...) {
  x <- matrix(fn(n * p, ...), ncol = p)
  colnames(x) <- names0(p, prefix)
  dplyr::as_tibble(x)
}

#' Simulate a two-class data set.
#'
#'  `two_class_sim()` produces a tibble with numerous informative variables, a
#'  factor outcome column, and a set of optional non-informative numeric
#'  columns. `two_class_sim_expr()` generates an expression for the linear
#'  predictor.
#' @param num_samples The number of rows to simulate.
#' @param intercept The intercept of the linear predictor equation. For default
#' settings, the produces balanced classes.
#' @param linear The number of linear effect columns.
#' @param noise The number of numeric non-informative columns.
#' @param ... Options to pass to [random_numeric_noise()].
#' @return `two_class_sim()` returns a tibble. `two_class_sim_expr()` returns
#' an expression for the linear predictor.
#' @includeRmd man/rmd/two_class_sim.Rmd details
#' @export
#' @examples
#' set.seed(4393)
#' two_class_sim(10)
#' two_class_sim_expr(intercept = 1, linear = 2)
two_class_sim <- function(num_samples, intercept = -2.11, linear = 10, noise = 0, ...) {
  cov_mat <- matrix(c(2.0, 1.3, 1.3, 2.0), 2, 2)

  dat <- MASS::mvrnorm(n = num_samples, c(0, 0), cov_mat)
  colnames(dat) <- paste0("two_factor_", 1:2)
  dat <- dplyr::as_tibble(dat)
  dat <-
    dplyr::bind_cols(
      dat,
      rand_tibble(num_samples, 1, prefix = "exp_", fn = runif, min = -1),
      rand_tibble(num_samples, 2, prefix = "sin_", fn = runif)
    )
  if (linear > 0) {
    dat <- dplyr::bind_cols(dat, rand_tibble(num_samples, linear, prefix = "linear_"))
  }

  lp_eqn <- two_class_sim_expr(intercept, linear)
  lp_val <- rlang::eval_tidy(lp_eqn, dat)
  prob <- binomial()$linkinv(lp_val + rnorm(num_samples, sd = 2))
  dat$class <- ifelse(runif(num_samples) <= prob, "A", "B")
  dat$class <- factor(dat$class, levels = LETTERS[1:2])
  if (noise > 0) {
    dat <- dplyr::bind_cols(dat, random_numeric_noise(num_samples, noise, ...))
  }
  dat
}

#' @export
#' @rdname two_class_sim
two_class_sim_expr <- function(intercept, linear) {
  slopes <- seq(10, 1, length = linear)/4
  slopes <- slopes * rep(c(-1, 1), floor(linear)+1)[1:linear]
  nms <- names0(linear, "linear_")
  lp_expr <- purrr::map2(nms, slopes, ~ rlang::expr((!!rlang::sym(.x) * !!.y)))
  beta_0 <- rlang::expr(!!intercept)
  lp_expr <-
    c(beta_0,
      rlang::expr(4 * two_factor_1),
      rlang::expr(4 * two_factor_2),
      rlang::expr(2 * two_factor_1 * two_factor_2),
      rlang::expr(2 * exp(-6 * (exp_1 - 0.3) ^ 2)),
      rlang::expr(2 * sin(pi * sin_1 * sin_2)),
      lp_expr
    )
  lp_expr <- purrr::reduce(lp_expr, function(l, r) rlang::expr(!!l + !!r))
  lp_expr
}

names0 <- function (num, prefix = "x")  {
  if (num < 1) {
    rlang::abort("`num` should be > 0")
  }
  ind <- format(1:num)
  ind <- gsub(" ", "0", ind)
  paste0(prefix, ind)
}

#' @importFrom stats binomial rnorm runif toeplitz
#' @importFrom utils globalVariables


# ------------------------------------------------------------------------------

utils::globalVariables(
  c("exp_1", "sin_1", "sin_2", "two_factor_1", "two_factor_2")
)
