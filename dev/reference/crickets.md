# Rates of Cricket Chirps

These data are from from McDonald (2009), by way of Mangiafico (2015),
on the relationship between the ambient temperature and the rate of
cricket chirps per minute. Data were collected for two species of the
genus *Oecanthus*: *O. exclamationis* and *O. niveus*. The data are
contained in a data frame called `crickets` with a total of 31 data
points.

## Source

Mangiafico, S. 2015. "An R Companion for the Handbook of Biological
Statistics." <https://rcompanion.org/handbook/>.

McDonald, J. 2009. *Handbook of Biological Statistics*. Sparky House
Publishing.

## Value

- crickets:

  a tibble

## Examples

``` r
data(crickets)
str(crickets)
#> tibble [31 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ species: Factor w/ 2 levels "O. exclamationis",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ temp   : num [1:31] 20.8 20.8 24 24 24 24 26.2 26.2 26.2 26.2 ...
#>  $ rate   : num [1:31] 67.9 65.1 77.3 78.7 79.4 80.4 85.8 86.6 87.5 89.1 ...
```
