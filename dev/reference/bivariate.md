# Example bivariate classification data

Example bivariate classification data

## Value

- bivariate_train, bivariate_test, bivariate_val:

  tibbles

## Details

These data are a simplified version of the segmentation data contained
in `caret`. There are three columns: `A` and `B` are predictors and the
column `Class` is a factor with levels "One" and "Two". There are three
data sets: one for training (n = 1009), validation (n = 300), and
testing (n = 710).

## Examples

``` r
data(bivariate)
str(bivariate_train)
#> tibble [1,009 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ A    : num [1:1009] 3279 1727 1195 1027 1036 ...
#>  $ B    : num [1:1009] 154.9 84.6 101.1 68.7 73.4 ...
#>  $ Class: Factor w/ 2 levels "One","Two": 1 2 1 2 1 1 1 2 2 2 ...
str(bivariate_val)
#> tibble [300 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ A    : num [1:300] 1061 1241 939 813 1706 ...
#>  $ B    : num [1:300] 74.5 83.4 71.9 77.1 92.8 ...
#>  $ Class: Factor w/ 2 levels "One","Two": 1 1 1 1 2 1 1 1 1 1 ...
str(bivariate_test)
#> tibble [710 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ A    : num [1:710] 742 709 1006 1983 1698 ...
#>  $ B    : num [1:710] 68.8 50.4 89.9 111.8 81 ...
#>  $ Class: Factor w/ 2 levels "One","Two": 1 2 1 2 2 1 1 2 1 1 ...
```
