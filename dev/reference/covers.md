# Raw cover type data

These data are raw data describing different types of forest cover-types
from the UCI Machine Learning Database (see link below). There is one
column in the data that has a few difference pieces of textual
information (of variable lengths).

## Source

https://archive.ics.uci.edu/ml/machine-learning-databases/covtype/covtype.info

## Value

- covers:

  a data frame

## Examples

``` r
data(covers)
str(covers)
#> 'data.frame':    40 obs. of  1 variable:
#>  $ description: chr  "1,cathedral family,rock outcrop complex,extremely stony" "2,vanet,ratake families complex,very stony" "3,haploborolis,rock outcrop complex,rubbly" "4,ratake family,rock outcrop complex,rubbly" ...
```
