# Execution time data

These data were collected from the CRAN web page for 13,626 R packages.
The time to complete the standard package checking routine was collected
In some cases, the package checking process is stopped due to errors and
these data are treated as censored. It is less than 1 percent.

## Source

CRAN

## Value

- check_times:

  a data frame

## Details

As predictors, the associated package source code were downloaded and
parsed to create predictors, including

- `authors`: The number of authors in the author field.

- `imports`: The number of imported packages.

- `suggests`: The number of packages suggested.

- `depends`: The number of hard dependencies.

- `Roxygen`: a binary indicator for whether Roxygen was used for
  documentation.

- `gh`: a binary indicator for whether the URL field contained a GitHub
  link.

- `rforge`: a binary indicator for whether the URL field contained a
  link to R-forge.

- `descr`: The number of characters (or, in some cases, bytes) in the
  description field.

- `r_count`: The number of R files in the R directory.

- `r_size`: The total disk size of the R files.

- `ns_import`: Estimated number of imported functions or methods.

- `ns_export`: Estimated number of exported functions or methods.

- `s3_methods`: Estimated number of S3 methods.

- `s4_methods`: Estimated number of S4 methods.

- `doc_count`: How many Rmd or Rnw files in the vignettes directory.

- `doc_size`: The disk size of the Rmd or Rnw files.

- `src_count`: The number of files in the `src` directory.

- `src_size`: The size on disk of files in the `src` directory.

- `data_count` The number of files in the `data` directory.

- `data_size`: The size on disk of files in the `data` directory.

- `testthat_count`: The number of files in the `testthat` directory.

- `testthat_size`: The size on disk of files in the `testthat`
  directory.

- `check_time`: The time (in seconds) to run `R CMD check` using the
  "r-devel-windows-ix86+x86_64\` flavor.

- `status`: An indicator for whether the tests completed.

Data were collected on 2019-01-20.

## Examples

``` r
data(check_times)
str(check_times)
#> tibble [13,626 × 25] (S3: tbl_df/tbl/data.frame)
#>  $ package       : chr [1:13626] "A3" "abbyyR" "abc" "abc.data" ...
#>  $ authors       : int [1:13626] 1 1 1 1 5 3 2 1 4 6 ...
#>  $ imports       : num [1:13626] 0 6 0 0 3 1 0 4 0 7 ...
#>  $ suggests      : num [1:13626] 2 4 0 0 2 0 2 2 0 0 ...
#>  $ depends       : num [1:13626] 3 1 6 1 1 1 5 0 1 1 ...
#>  $ Roxygen       : num [1:13626] 0 1 0 0 1 0 0 1 0 0 ...
#>  $ gh            : num [1:13626] 0 1 0 0 0 0 0 1 0 0 ...
#>  $ rforge        : num [1:13626] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ descr         : int [1:13626] 217 313 269 63 223 1031 135 344 204 335 ...
#>  $ r_count       : int [1:13626] 2 20 8 0 10 10 16 3 6 14 ...
#>  $ r_size        : num [1:13626] 0.0291 0.0463 0.0784 0 0.0191 ...
#>  $ ns_import     : num [1:13626] 3 15 6 0 4 5 0 4 2 10 ...
#>  $ ns_export     : num [1:13626] 0 19 0 0 10 0 0 2 0 9 ...
#>  $ s3_methods    : num [1:13626] 3 0 11 0 0 0 0 2 0 23 ...
#>  $ s4_methods    : num [1:13626] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ doc_count     : int [1:13626] 0 3 1 0 1 0 0 0 0 0 ...
#>  $ doc_size      : num [1:13626] 0 0.01976 0.03828 0 0.00787 ...
#>  $ src_count     : int [1:13626] 0 0 0 0 0 0 0 2 0 5 ...
#>  $ src_size      : num [1:13626] 0 0 0 0 0 ...
#>  $ data_count    : int [1:13626] 2 0 0 3 3 1 10 0 4 2 ...
#>  $ data_size     : num [1:13626] 0.0253 0 0 4.8859 4.5955 ...
#>  $ testthat_count: int [1:13626] 0 8 0 0 0 0 0 1 0 0 ...
#>  $ testthat_size : num [1:13626] 0 0.0025 0 0 0 ...
#>  $ check_time    : num [1:13626] 49 101 292 21 103 46 78 91 47 196 ...
#>  $ status        : num [1:13626] 1 1 1 1 1 1 1 1 1 1 ...
```
