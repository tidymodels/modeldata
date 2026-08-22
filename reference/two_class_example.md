# Two class predictions

Two class predictions

## Value

- two_class_example:

  a data frame

## Details

These data are a test set form a model built for two classes ("Class1"
and "Class2"). There are columns for the true and predicted classes and
column for the probabilities for each class.

## Examples

``` r
data(two_class_example)
str(two_class_example)
#> 'data.frame':    500 obs. of  4 variables:
#>  $ truth    : Factor w/ 2 levels "Class1","Class2": 2 1 2 1 2 1 1 1 2 2 ...
#>  $ Class1   : num  0.00359 0.67862 0.11089 0.73516 0.01624 ...
#>  $ Class2   : num  0.996 0.321 0.889 0.265 0.984 ...
#>  $ predicted: Factor w/ 2 levels "Class1","Class2": 2 1 2 1 2 1 1 1 2 2 ...
```
