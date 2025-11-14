# High-performance computing system data

Kuhn and Johnson (2013) describe a data set where characteristics of
unix jobs were used to classify there completion times as either very
fast (1 min or less, `VF`), fast (1–50 min, `F`), moderate (5–30 min,
`M`), or long (greater than 30 min, `L`).

## Source

Kuhn, M., Johnson, K. (2013) *Applied Predictive Modeling*, Springer.

## Value

- hpc_data:

  a tibble

## Examples

``` r
data(hpc_data)
str(hpc_data)
#> tibble [4,331 × 8] (S3: tbl_df/tbl/data.frame)
#>  $ protocol    : Factor w/ 14 levels "A","C","D","E",..: 4 4 4 4 4 4 4 4 4 4 ...
#>  $ compounds   : num [1:4331] 997 97 101 93 100 100 105 98 101 95 ...
#>  $ input_fields: num [1:4331] 137 103 75 76 82 82 88 95 91 92 ...
#>  $ iterations  : num [1:4331] 20 20 10 20 20 20 20 20 20 20 ...
#>  $ num_pending : num [1:4331] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ hour        : num [1:4331] 14 13.8 13.8 10.1 10.4 ...
#>  $ day         : Factor w/ 7 levels "Mon","Tue","Wed",..: 2 2 4 5 5 3 5 5 5 3 ...
#>  $ class       : Factor w/ 4 levels "VF","F","M","L": 2 1 1 1 1 1 1 1 1 1 ...
```
