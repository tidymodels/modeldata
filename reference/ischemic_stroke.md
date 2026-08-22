# Clinical data used to predict ischemic stroke

A data set to predict a binary outcome using imaging and patient data.

## Source

Kuhn, Max, and Kjell Johnson. *Feature Engineering and Selection: A
Practical Approach for Predictive Models*. Chapman and Hall/CRC, 2019.

## Value

- ischemic_stroke:

  a tibble

## Details

These data were gathered to predict patient risk for ischemic stroke. A
historical set of patients with a range of carotid artery blockages were
selected. The data consisted of 126 patients, 44 of which had blockages
greater than 70%. All patients had undergone Computed Tomography
Angiography (CTA) to generate a detailed three-dimensional visualization
and characterization of the blockage. These images were then analyzed in
order to compute several features related to the disease, including:
percent stenosis, arterial wall thickness, and tissue characteristics
such as lipid-rich necrotic core and calcification.

The group of patients in this study also had follow-up information on
whether or not a stroke occurred at a subsequent point in time. The data
for each patient also included commonly collected clinical
characteristics for risk of stroke such as whether or not the patient
had atrial fibrillation, coronary artery disease, and a history of
smoking. Demographics of gender and age were included as well. These
readily available risk factors can be thought of as another potentially
useful predictor set that can be evaluated. In fact, this set of
predictors should be evaluated first to assess their ability to predict
stroke since these predictors are easy to collect, are acquired at
patient presentation, and do not require an expensive imaging technique.

Columns:

- `stroke`: factor (levels: 'yes' and 'no')

- `nascet_scale`: numeric

- `calc_vol`: numeric

- `calc_vol_prop`: numeric

- `matx_vol`: numeric

- `matx_vol_prop`: numeric

- `lrnc_vol`: numeric

- `lrnc_vol_prop`: numeric

- `max_calc_area`: numeric

- `max_calc_area_prop`: numeric

- `max_dilation_by_area`: numeric

- `max_matx_area`: numeric

- `max_matx_area_prop`: numeric

- `max_lrnc_area`: numeric

- `max_lrnc_area_prop`: numeric

- `max_max_wall_thickness`: numeric

- `max_remodeling_ratio`: numeric

- `max_stenosis_by_area`: numeric

- `max_wall_area`: numeric

- `wall_vol`: numeric

- `max_stenosis_by_diameter`: numeric

- `age`: integer

- `male`: integer

- `smoking_history`: integer

- `atrial_fibrillation`: integer

- `coronary_artery_disease`: integer

- `diabetes_history`: integer

- `hypercholesterolemia_history`: integer

- `hypertension_history`: integer

## Examples

``` r
data(ischemic_stroke)
str(ischemic_stroke)
#> tibble [126 × 29] (S3: tbl_df/tbl/data.frame)
#>  $ stroke                      : Factor w/ 2 levels "yes","no": 2 2 2 1 2 2 2 2 2 2 ...
#>  $ nascet_scale                : num [1:126] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ calc_vol                    : num [1:126] 235.3 31.4 113.4 780.8 84.1 ...
#>  $ calc_vol_prop               : num [1:126] 0.0704 0.0162 0.0381 0.2134 0.0414 ...
#>  $ matx_vol                    : num [1:126] 3157 3033 3835 3519 2990 ...
#>  $ matx_vol_prop               : num [1:126] 0.76 0.813 0.783 0.761 0.75 ...
#>  $ lrnc_vol                    : num [1:126] 225 369 321 141 293 ...
#>  $ lrnc_vol_prop               : num [1:126] 0.0911 0.134 0.083 0.0321 0.0754 ...
#>  $ max_calc_area               : num [1:126] 12.35 7.13 16.29 63.35 17.58 ...
#>  $ max_calc_area_prop          : num [1:126] 0.366 0.211 0.409 0.576 0.322 ...
#>  $ max_dilation_by_area        : num [1:126] 521 91.7 271 2270.5 95.2 ...
#>  $ max_matx_area               : num [1:126] 71.2 27.2 38.1 341.1 56.6 ...
#>  $ max_matx_area_prop          : num [1:126] 0.952 0.946 0.946 0.969 0.921 ...
#>  $ max_lrnc_area               : num [1:126] 21.69 6.43 5.71 6.05 7.21 ...
#>  $ max_lrnc_area_prop          : num [1:126] 0.43 0.282 0.155 0.187 0.217 ...
#>  $ max_max_wall_thickness      : num [1:126] 2.41 2.54 3.71 6.12 3.98 ...
#>  $ max_remodeling_ratio        : num [1:126] 5.7 1.74 2.83 15.65 1.91 ...
#>  $ max_stenosis_by_area        : num [1:126] 19 30.2 33.9 34.3 36.6 ...
#>  $ max_wall_area               : num [1:126] 106.2 33.4 55.3 426.5 59.8 ...
#>  $ wall_vol                    : num [1:126] 4192 3917 4935 4910 4045 ...
#>  $ max_stenosis_by_diameter    : num [1:126] 10.5 18.6 19.7 20.3 49.3 ...
#>  $ age                         : int [1:126] 72 76 72 61 65 64 82 83 85 56 ...
#>  $ male                        : int [1:126] 1 1 0 1 1 1 0 0 0 0 ...
#>  $ smoking_history             : int [1:126] 1 1 0 1 0 1 1 0 1 1 ...
#>  $ atrial_fibrillation         : int [1:126] 0 0 0 0 0 0 0 1 0 0 ...
#>  $ coronary_artery_disease     : int [1:126] 0 0 0 0 0 1 1 1 1 0 ...
#>  $ diabetes_history            : int [1:126] 0 1 0 1 0 0 0 0 0 0 ...
#>  $ hypercholesterolemia_history: int [1:126] 0 1 0 1 0 1 0 0 1 0 ...
#>  $ hypertension_history        : int [1:126] 1 1 0 1 1 1 1 1 1 0 ...
```
