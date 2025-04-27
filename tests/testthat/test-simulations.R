test_that("classification simulation", {
  set.seed(1)
  dat_1 <- sim_classification(500, num_linear = 0)
  dat_2 <- sim_classification(10, num_linear = 11)
  dat_3 <- sim_classification(1000, num_linear = 1, intercept = 50)
  dat_4 <- sim_classification(500, num_linear = 0, keep_truth = TRUE)

  expect_equal(
    names(dat_1),
    c(
      "class",
      "two_factor_1",
      "two_factor_2",
      "non_linear_1",
      "non_linear_2",
      "non_linear_3"
    )
  )
  expect_equal(
    names(dat_2),
    c(
      "class",
      "two_factor_1",
      "two_factor_2",
      "non_linear_1",
      "non_linear_2",
      "non_linear_3",
      modeldata:::names0(11, "linear_")
    )
  )
  expect_equal(
    names(dat_3),
    c(
      "class",
      "two_factor_1",
      "two_factor_2",
      "non_linear_1",
      "non_linear_2",
      "non_linear_3",
      "linear_1"
    )
  )
  expect_equal(
    names(dat_4),
    c(
      "class",
      "two_factor_1",
      "two_factor_2",
      "non_linear_1",
      "non_linear_2",
      "non_linear_3",
      ".truth"
    )
  )
  expect_equal(nrow(dat_1), 500)
  expect_equal(nrow(dat_2), 10)
  expect_equal(nrow(dat_3), 1000)
  expect_true(all(vapply(dat_1[, -1], is.numeric, logical(1))))

  expect_equal(sum(dat_3 == "class_2"), 0)
  expect_equal(levels(dat_3$class), paste0("class_", 1:2))
  expect_snapshot(
    error = TRUE,
    sim_classification(5, method = "potato")
  )
})

test_that("sapp_2014_1 simulation", {
  set.seed(1)
  dat_1 <- sim_regression(10, method = "sapp_2014_1")
  dat_2 <- sim_regression(10, method = "sapp_2014_1", keep_truth = TRUE)
  expect_equal(names(dat_1), c("outcome", modeldata:::names0(20, "predictor_")))
  expect_equal(
    names(dat_2),
    c("outcome", modeldata:::names0(20, "predictor_"), ".truth")
  )
  expect_equal(nrow(dat_1), 10)
  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
  expect_snapshot(
    error = TRUE,
    sim_regression(5, method = "potato")
  )
})

test_that("sapp_2014_2 simulation", {
  set.seed(1)
  dat_1 <- sim_regression(10, method = "sapp_2014_2")
  dat_2 <- sim_regression(10, method = "sapp_2014_2", keep_truth = TRUE)
  expect_equal(
    names(dat_1),
    c("outcome", modeldata:::names0(200, "predictor_"))
  )
  expect_equal(
    names(dat_2),
    c("outcome", modeldata:::names0(200, "predictor_"), ".truth")
  )
  expect_equal(nrow(dat_1), 10)
  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
})

test_that("van_der_laan_2007_1 simulation", {
  set.seed(1)
  dat_1 <- sim_regression(10, method = "van_der_laan_2007_1")
  dat_2 <- sim_regression(10, method = "van_der_laan_2007_1", factors = TRUE)
  dat_3 <- sim_regression(10, method = "van_der_laan_2007_1", keep_truth = TRUE)
  expect_equal(names(dat_1), c("outcome", modeldata:::names0(10, "predictor_")))
  expect_equal(
    names(dat_3),
    c("outcome", modeldata:::names0(10, "predictor_"), ".truth")
  )
  expect_equal(nrow(dat_1), 10)
  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
  expect_true(all(vapply(dat_1[, -1], is.integer, logical(1))))
  expect_true(all(vapply(dat_2[, -1], is.factor, logical(1))))
  expect_equal(levels(dat_2$predictor_01), c("yes", "no"))
})

test_that("van_der_laan_2007_2 simulation", {
  set.seed(1)
  dat_1 <- sim_regression(10, method = "van_der_laan_2007_2")
  dat_2 <- sim_regression(10, method = "van_der_laan_2007_2", keep_truth = TRUE)
  expect_equal(names(dat_1), c("outcome", modeldata:::names0(20, "predictor_")))
  expect_equal(
    names(dat_2),
    c("outcome", modeldata:::names0(20, "predictor_"), ".truth")
  )
  expect_equal(nrow(dat_1), 10)
  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
})

test_that("hooker_2004 simulation", {
  set.seed(1)
  dat_1 <- sim_regression(10, method = "hooker_2004")
  dat_2 <- sim_regression(10, method = "hooker_2004", keep_truth = TRUE)
  expect_equal(names(dat_1), c("outcome", modeldata:::names0(10, "predictor_")))
  expect_equal(
    names(dat_2),
    c("outcome", modeldata:::names0(10, "predictor_"), ".truth")
  )
  expect_equal(nrow(dat_1), 10)
  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
})


test_that("noise simulation", {
  set.seed(1)
  dat_1 <- sim_noise(1000, num_vars = 10)
  dat_2 <- sim_noise(1000, num_vars = 3, cov_param = .5)
  dat_3 <- sim_noise(1000, num_vars = 3, cov_type = "toeplitz", cov_param = .99)
  dat_4 <- sim_noise(10, num_vars = 3, outcome = "classification")
  dat_5 <- sim_noise(
    10,
    num_vars = 3,
    outcome = "classification",
    num_classes = 10
  )
  dat_6 <- sim_noise(10, num_vars = 3, outcome = "regression")

  expect_equal(names(dat_1), modeldata:::names0(10, "noise_"))
  expect_equal(names(dat_2), modeldata:::names0(3, "noise_"))
  expect_equal(nrow(dat_1), 1000)
  expect_equal(nrow(dat_4), 10)

  expect_true(all(vapply(dat_1, is.numeric, logical(1))))
  expect_true(all(vapply(dat_1[, -1], is.numeric, logical(1))))
  expect_true(is.factor(dat_5$class))
  expect_true(all(vapply(dat_6, is.numeric, logical(1))))

  cor_1 <- cor(dat_1)[upper.tri(cor(dat_1))]
  expect_true(all(cor_1 <= 0.1 & cor_1 >= -0.1))

  cor_2 <- cor(dat_2)[upper.tri(cor(dat_2))]
  expect_true(all(cor_2 <= 0.6 & cor_2 >= 0.4))

  cor_3 <- cor(dat_3)[upper.tri(cor(dat_3))]
  expect_true(all(cor_3 >= 0.95))

  expect_equal(levels(dat_4$class), paste0("class_", 1:2))
  expect_equal(levels(dat_5$class), modeldata:::names0(10, "class_"))
})


test_that("logistic simulation", {
  set.seed(1)
  dat_1 <- sim_logistic(10, ~A)
  dat_2 <- sim_logistic(10, rlang::expr(~B), keep_truth = TRUE)
  expect_equal(names(dat_1), c(LETTERS[1:2], "class"))
  expect_equal(names(dat_2), c(LETTERS[1:2], ".linear_pred", ".truth", "class"))
  expect_equal(nrow(dat_1), 10)
})


test_that("multinomial simulation", {
  expect_snapshot_error(sim_multinomial(10, ~ A + C, ~B, ~ A + B))
  set.seed(1)
  dat_1 <- sim_multinomial(10, ~A, ~B, ~ A + B)
  dat_2 <- sim_multinomial(10, ~A, ~B, ~ A + B, keep_truth = TRUE)
  expect_equal(names(dat_1), c(LETTERS[1:2], "class"))
  expect_equal(
    names(dat_2),
    c(LETTERS[1:2], "class", ".truth_one", ".truth_two", ".truth_three")
  )
  expect_equal(nrow(dat_1), 10)
})
