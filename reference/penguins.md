# Palmer Station penguin data

A data set from Gorman, Williams, and Fraser (2014) containing
measurements from different types of penguins. This version of the data
was retrieved from Allison Horst's `palmerpenguins` package on
2020-06-22.

## Source

Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism
and Environmental Variability within a Community of Antarctic Penguins
(*Genus Pygoscelis*). PLoS ONE 9(3): e90081.
[doi:10.1371/journal.pone.0090081](https://doi.org/10.1371/journal.pone.0090081)

<https://github.com/allisonhorst/palmerpenguins>

## Value

- penguins:

  a tibble

## Examples

``` r
data(penguins)
str(penguins)
#> tibble [344 × 7] (S3: tbl_df/tbl/data.frame)
#>  $ species          : Factor w/ 3 levels "Adelie","Chinstrap",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ island           : Factor w/ 3 levels "Biscoe","Dream",..: 3 3 3 3 3 3 3 3 3 3 ...
#>  $ bill_length_mm   : num [1:344] 39.1 39.5 40.3 NA 36.7 39.3 38.9 39.2 34.1 42 ...
#>  $ bill_depth_mm    : num [1:344] 18.7 17.4 18 NA 19.3 20.6 17.8 19.6 18.1 20.2 ...
#>  $ flipper_length_mm: int [1:344] 181 186 195 NA 193 190 181 195 193 190 ...
#>  $ body_mass_g      : int [1:344] 3750 3800 3250 NA 3450 3650 3625 4675 3475 4250 ...
#>  $ sex              : Factor w/ 2 levels "female","male": 2 1 1 NA 1 2 1 2 NA NA ...
```
