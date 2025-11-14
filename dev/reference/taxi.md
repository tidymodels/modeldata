# Chicago taxi data set

A data set containing information on a subset of taxi trips in the city
of Chicago in 2022.

## Source

<https://data.cityofchicago.org/Transportation/Taxi-Trips/wrvz-psew>

## Value

tibble

## Details

The source data are originally described on the linked City of Chicago
data portal. The data exported here are a pre-processed subset motivated
by the modeling problem of predicting whether a rider will tip or not.

- tip:

  Whether the rider left a tip. A factor with levels "yes" and "no".

- distance:

  The trip distance, in odometer miles.

- company:

  The taxi company, as a factor. Companies that occurred few times were
  binned as "other".

- local:

  Whether the trip's starting and ending locations are in the same
  community. See the source data for community area values.

- dow:

  The day of the week in which the trip began, as a factor.

- month:

  The month in which the trip began, as a factor.

- hour:

  The hour of the day in which the trip began, as a numeric.

## Examples

``` r
# \donttest{
taxi
#> # A tibble: 10,000 × 7
#>    tip   distance company                      local dow   month  hour
#>    <fct>    <dbl> <fct>                        <fct> <fct> <fct> <int>
#>  1 yes      17.2  Chicago Independents         no    Thu   Feb      16
#>  2 yes       0.88 City Service                 yes   Thu   Mar       8
#>  3 yes      18.1  other                        no    Mon   Feb      18
#>  4 yes      20.7  Chicago Independents         no    Mon   Apr       8
#>  5 yes      12.2  Chicago Independents         no    Sun   Mar      21
#>  6 yes       0.94 Sun Taxi                     yes   Sat   Apr      23
#>  7 yes      17.5  Flash Cab                    no    Fri   Mar      12
#>  8 yes      17.7  other                        no    Sun   Jan       6
#>  9 yes       1.85 Taxicab Insurance Agency Llc no    Fri   Apr      12
#> 10 yes       1.47 City Service                 no    Tue   Mar      14
#> # ℹ 9,990 more rows
# }
```
