# Compressive strength of concrete mixtures

Yeh (2006) describes an aggregated data set for experimental designs
used to test the compressive strength of concrete mixtures. The data are
used by Kuhn and Johnson (2013).

## Source

Yeh I (2006). "Analysis of Strength of Concrete Using Design of
Experiments and Neural Networks." *Journal of Materials in Civil
Engineering*, 18, 597-604.

Kuhn, M., Johnson, K. (2013) *Applied Predictive Modeling*, Springer.

## Value

- concrete:

  a tibble

## Examples

``` r
data(concrete)
str(concrete)
#> tibble [1,030 × 9] (S3: tbl_df/tbl/data.frame)
#>  $ cement              : num [1:1030] 540 540 332 332 199 ...
#>  $ blast_furnace_slag  : num [1:1030] 0 0 142 142 132 ...
#>  $ fly_ash             : num [1:1030] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ water               : num [1:1030] 162 162 228 228 192 228 228 228 228 228 ...
#>  $ superplasticizer    : num [1:1030] 2.5 2.5 0 0 0 0 0 0 0 0 ...
#>  $ coarse_aggregate    : num [1:1030] 1040 1055 932 932 978 ...
#>  $ fine_aggregate      : num [1:1030] 676 676 594 594 826 ...
#>  $ age                 : int [1:1030] 28 28 270 365 360 90 365 28 28 28 ...
#>  $ compressive_strength: num [1:1030] 80 61.9 40.3 41 44.3 ...
```
