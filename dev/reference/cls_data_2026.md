# Two classes, Two predictors 2026 Edition

Used for the 2026 posit::conf tidymdoels workshop. The data contain two
predictors (`pred_1` and `pred_2`) and a factor colmnn (`class`) with
levels `"class_1"` and `"class_2"`. There are 1,000 rows in the data.

## Value

- cls_data_2026:

  a data frame

## Examples

``` r
data(cls_data_2026)
str(cls_data_2026)
#> tibble [1,000 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ pred_1: num [1:1000] 0.43 -1.298 1.148 1.793 -0.802 ...
#>  $ pred_2: num [1:1000] -0.733 -0.94 1.615 1.23 0.403 ...
#>  $ class : Factor w/ 2 levels "class_1","class_2": 1 1 2 1 2 2 1 1 1 2 ...
```
