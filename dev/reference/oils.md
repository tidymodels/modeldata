# Fatty acid composition of commercial oils

Fatty acid concentrations of commercial oils were measured using gas
chromatography. The data is used to predict the type of oil. Note that
only the known oils are in the data set. Also, the authors state that
there are 95 samples of known oils. However, we count 96 in Table 1
(pgs. 33-35).

## Source

Brodnjak-Voncina et al. (2005). Multivariate data analysis in
classification of vegetable oils characterized by the content of fatty
acids, *Chemometrics and Intelligent Laboratory Systems*, Vol. 75:31-45.

## Value

- oils:

  a tibble

## Examples

``` r
data(oils)
str(oils)
#> tibble [96 × 8] (S3: tbl_df/tbl/data.frame)
#>  $ palmitic  : num [1:96] 9.7 11.1 11.5 10 12.2 9.8 10.5 10.5 11.5 10 ...
#>  $ stearic   : num [1:96] 5.2 5 5.2 4.8 5 4.2 5 5 5.2 4.8 ...
#>  $ oleic     : num [1:96] 31 32.9 35 30.4 31.1 43 31.8 31.8 35 30.4 ...
#>  $ linoleic  : num [1:96] 52.7 49.8 47.2 53.5 50.5 39.2 51.3 51.3 47.2 53.5 ...
#>  $ linolenic : num [1:96] 0.4 0.3 0.2 0.3 0.3 2.4 0.4 0.4 0.2 0.3 ...
#>  $ eicosanoic: num [1:96] 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 ...
#>  $ eicosenoic: num [1:96] 0.1 0.1 0.1 0.1 0.1 0.5 0.1 0.1 0.1 0.1 ...
#>  $ class     : Factor w/ 7 levels "corn","olive",..: 4 4 4 4 4 4 4 4 4 4 ...
```
