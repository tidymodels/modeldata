# Sacramento CA home prices

This data frame contains house and sale price data for 932 homes in
Sacramento CA. The original data were obtained from the website for the
SpatialKey software. From their website: "The Sacramento real estate
transactions file is a list of 985 real estate transactions in the
Sacramento area reported over a five-day period, as reported by the
Sacramento Bee." Google was used to fill in missing/incorrect data.

## Source

SpatialKey website:
<https://support.spatialkey.com/spatialkey-sample-csv-data/>

## Value

- Sacramento:

  a tibble

## Examples

``` r
data(Sacramento)
str(Sacramento)
#> tibble [932 × 9] (S3: tbl_df/tbl/data.frame)
#>  $ city     : Factor w/ 37 levels "ANTELOPE","AUBURN",..: 34 34 34 34 34 34 34 34 29 31 ...
#>  $ zip      : Factor w/ 68 levels "z95603","z95608",..: 64 52 44 44 53 65 66 49 24 25 ...
#>  $ beds     : int [1:932] 2 3 2 2 2 3 3 3 2 3 ...
#>  $ baths    : num [1:932] 1 1 1 1 1 1 2 1 2 2 ...
#>  $ sqft     : int [1:932] 836 1167 796 852 797 1122 1104 1177 941 1146 ...
#>  $ type     : Factor w/ 3 levels "Condo","Multi_Family",..: 3 3 3 3 3 1 3 3 1 3 ...
#>  $ price    : int [1:932] 59222 68212 68880 69307 81900 89921 90895 91002 94905 98937 ...
#>  $ latitude : num [1:932] 38.6 38.5 38.6 38.6 38.5 ...
#>  $ longitude: num [1:932] -121 -121 -121 -121 -121 ...
```
