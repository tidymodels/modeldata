# modeldata (development version)

* Added the `deliveries` data set.  

# modeldata 1.2.0

* New data sets 

  - `chem_proc_yield` (regression)
  - `hepatic_injury_qsar` (ordinal classification)
  - `hotel_rates`  (regression)
  - `ischemic_stroke` (classification)
  - `leaf_id_flavia` (classification)
  - `permeability_qsar` (regression)
  - `steroidogenic_toxicity` (classification)
  - `taxi` (classification)

* The simulation equation for Hooker (2004) was slightly incorrect and has been corrected. 

# modeldata 1.1.0

* Added a `keep_truth` argument to the supervised simulation functions. This retains the column that defines the error free simulated value of the outcome. This numeric column is called `.truth`. 

* A simulation functions were added: 

  * `sim_logistic()` and `sim_multinomial()` were added. 
  
  * A method for Hooker (2004) was added for `sim_regression()`. 

# modeldata 1.0.1

* Small update to fix HTML  for CRAN. 

# modeldata 1.0.0

* Added a set of regression and classification simulation functions (#273).

* Remove OkCupid data, including text data, because of privacy concerns.

# modeldata 0.1.1

* Add Tate Gallery modern artwork metadata.

* Deprecate OkCupid data, including text data, because of concerns around such data such as the ability to identify individuals.

# modeldata 0.1.0

* Add the grant acceptance data from Kuhn and Johnson (2013) (_Applied Predictive Modeling_).

* The `crickets` data from Chapter 3 of [`tmwr.org`](https://www.tmwr.org/base-r.html#an-example) were added. 

# modeldata 0.0.2

* The bivariate dataset was missing, this has been corrected (@mdogucu, #5).

* The [Ames](https://github.com/topepo/AmesHousing) and [penguin](https://github.com/allisonhorst/palmerpenguins) data sets were added. 

# modeldata 0.0.1

* Added a `NEWS.md` file to track changes to the package.
