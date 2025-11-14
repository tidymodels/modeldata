# Changelog

## modeldata (development version)

## modeldata 1.5.1

CRAN release: 2025-08-22

- Small release to fix typos in documentation and column names.

## modeldata 1.5.0

CRAN release: 2025-07-31

- Added a new regression simulation function via
  `method = "worley_1987"`.

- Transition from the magrittr pipe to the base R pipe.

## modeldata 1.4.0

CRAN release: 2024-06-19

- Added the `cat_adoption` data set.

## modeldata 1.3.0

CRAN release: 2024-01-21

- Added the `deliveries` data set.

## modeldata 1.2.0

CRAN release: 2023-08-09

- New data sets

  - `chem_proc_yield` (regression)
  - `hepatic_injury_qsar` (ordinal classification)
  - `hotel_rates` (regression)
  - `ischemic_stroke` (classification)
  - `leaf_id_flavia` (classification)
  - `permeability_qsar` (regression)
  - `steroidogenic_toxicity` (classification)
  - `taxi` (classification)

- The simulation equation for Hooker (2004) was slightly incorrect and
  has been corrected.

## modeldata 1.1.0

CRAN release: 2023-01-25

- Added a `keep_truth` argument to the supervised simulation functions.
  This retains the column that defines the error free simulated value of
  the outcome. This numeric column is called `.truth`.

- A simulation functions were added:

  - [`sim_logistic()`](https://modeldata.tidymodels.org/dev/reference/sim_classification.md)
    and
    [`sim_multinomial()`](https://modeldata.tidymodels.org/dev/reference/sim_classification.md)
    were added.

  - A method for Hooker (2004) was added for
    [`sim_regression()`](https://modeldata.tidymodels.org/dev/reference/sim_classification.md).

## modeldata 1.0.1

CRAN release: 2022-09-06

- Small update to fix HTML for CRAN.

## modeldata 1.0.0

CRAN release: 2022-07-01

- Added a set of regression and classification simulation functions
  ([\#273](https://github.com/tidymodels/modeldata/issues/273)).

- Remove OkCupid data, including text data, because of privacy concerns.

## modeldata 0.1.1

CRAN release: 2021-07-14

- Add Tate Gallery modern artwork metadata.

- Deprecate OkCupid data, including text data, because of concerns
  around such data such as the ability to identify individuals.

## modeldata 0.1.0

CRAN release: 2020-10-22

- Add the grant acceptance data from Kuhn and Johnson (2013) (*Applied
  Predictive Modeling*).

- The `crickets` data from Chapter 3 of
  [`tmwr.org`](https://www.tmwr.org/base-r.html#an-example) were added.

## modeldata 0.0.2

CRAN release: 2020-06-22

- The bivariate dataset was missing, this has been corrected
  ([@mdogucu](https://github.com/mdogucu),
  [\#5](https://github.com/tidymodels/modeldata/issues/5)).

- The [Ames](https://github.com/topepo/AmesHousing) and
  [penguin](https://github.com/allisonhorst/palmerpenguins) data sets
  were added.

## modeldata 0.0.1

CRAN release: 2019-12-06

- Added a `NEWS.md` file to track changes to the package.
