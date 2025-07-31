# classification simulation

    Code
      sim_classification(5, method = "potato")
    Condition
      Error in `sim_classification()`:
      ! `method` must be one of "caret", not "potato".

---

    Code
      sim_classification(500, num_linear = -1)
    Condition
      Error in `sim_classification()`:
      ! `num_linear` must be a whole number larger than or equal to 0, not the number -1.

---

    Code
      sim_classification(-1)
    Condition
      Error in `sim_classification()`:
      ! `num_samples` must be a whole number larger than or equal to 1, not the number -1.

---

    Code
      sim_classification(1, intercept = NA)
    Condition
      Error in `sim_classification()`:
      ! `intercept` must be a number, not `NA`.

---

    Code
      sim_classification(1, keep_truth = NA)
    Condition
      Error in `sim_classification()`:
      ! `keep_truth` should be a single logical value, not `NA`.

---

    Code
      sim_classification(5, method = "potato")
    Condition
      Error in `sim_classification()`:
      ! `method` must be one of "caret", not "potato".

# sapp_2014_1 simulation

    Code
      sim_regression(5, method = "potato")
    Condition
      Error in `sim_regression()`:
      ! `method` must be one of "sapp_2014_1", "sapp_2014_2", "van_der_laan_2007_1", "van_der_laan_2007_2", "hooker_2004", or "worley_1987", not "potato".

# noise simulation

    Code
      sim_noise(5, cov_type = "potato")
    Condition
      Error in `sim_noise()`:
      ! `cov_type` must be one of "exchangeable" or "toeplitz", not "potato".

---

    Code
      sim_noise(5, outcome = "potato")
    Condition
      Error in `sim_noise()`:
      ! `outcome` must be one of "none", "classification", or "regression", not "potato".

---

    Code
      sim_noise(num_vars, num_linear = -1)
    Condition
      Error in `sim_noise()`:
      ! unused argument (num_linear = -1)

---

    Code
      sim_noise(-1)
    Condition
      Error in `sim_noise()`:
      ! `num_samples` must be a whole number larger than or equal to 1, not the number -1.

---

    Code
      sim_noise(1, num_classes = 1)
    Condition
      Error in `sim_noise()`:
      ! `num_vars` must be a whole number, not absent.

---

    Code
      sim_noise(1, cov_param = NA)
    Condition
      Error in `sim_noise()`:
      ! `num_vars` must be a whole number, not absent.

# logistic simulation

    Code
      sim_logistic(10, ~A, correlation = NA)
    Condition
      Error in `sim_logistic()`:
      ! `correlation` must be a number, not `NA`.

---

    Code
      sim_logistic(-1)
    Condition
      Error in `sim_logistic()`:
      ! `num_samples` must be a whole number larger than or equal to 1, not the number -1.

---

    Code
      sim_logistic(10, ~A, keep_truth = 1)
    Condition
      Error in `sim_logistic()`:
      ! `keep_truth` should be a single logical value, not the number 1.

# multinomial simulation

    i In index: 1.
    Caused by error in `.f()`:
    ! The model equations should only use variables/objects `A` and `B`.

---

    Code
      sim_multinomial(10, ~A, correlation = NA)
    Condition
      Error in `sim_multinomial()`:
      ! `correlation` must be a number, not `NA`.

---

    Code
      sim_multinomial(-1)
    Condition
      Error in `sim_multinomial()`:
      ! `num_samples` must be a whole number larger than or equal to 1, not the number -1.

---

    Code
      sim_multinomial(10, ~A, keep_truth = 1)
    Condition
      Error in `sim_multinomial()`:
      ! `keep_truth` should be a single logical value, not the number 1.

