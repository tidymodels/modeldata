# Sample time series data

Sample time series data

## Source

The Federal Reserve Bank of St. Louis website
https://fred.stlouisfed.org/series/S4248SM144NCEN

## Value

- drinks:

  a tibble

## Details

Drink sales. The exact name of the series from FRED is: "Merchant
Wholesalers, Except Manufacturers' Sales Branches and Offices Sales:
Nondurable Goods: Beer, Wine, and Distilled Alcoholic Beverages Sales"

## Examples

``` r
data(drinks)
str(drinks)
#> tibble [309 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ date          : Date[1:309], format: "1992-01-01" ...
#>  $ S4248SM144NCEN: num [1:309] 3459 3458 4002 4564 4221 ...
```
