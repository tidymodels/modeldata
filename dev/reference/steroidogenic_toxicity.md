# Predicting steroidogenic toxicity with assay data

A set of *in vitro* assays are used to quantify the risk of reproductive
toxicity via the disruption of steroidogenic pathways.

## Source

Maglich, J. M., Kuhn, M., Chapin, R. E., & Pletcher, M. T. (2014). More
than just hormones: H295R cells as predictors of reproductive toxicity.
*Reproductive Toxicology*, 45, 77-86.

## Value

A tibble with columns

- `class`: factor(levels: toxic and nontoxic)

- `cyp_11a1`: numeric

- `cyp_11b1`: numeric

- `cyp_11b2`: numeric

- `cyp_17a1`: numeric

- `cyp_19a1`: numeric

- `cyp_21a1`: numeric

- `hsd3b2`: numeric

- `star`: numeric

- `progesterone`: numeric

- `testosterone`: numeric

- `dhea`: numeric

- `cortisol`: numeric

## Details

H295R cells were used to measure the effect with two sets of assay
results. The first includes a set of protein measurements on: cytochrome
P450 enzymes ("cyp"s), STAR, and 3BHSD2. The second include hormone
measurements for DHEA, progesterone, testosterone, and cortisol.

Columns:

- `class`: factor (levels: 'toxic' and 'nontoxic')

- `cyp_11a1`: numeric

- `cyp_11b1`: numeric

- `cyp_11b2`: numeric

- `cyp_17a1`: numeric

- `cyp_19a1`: numeric

- `cyp_21a1`: numeric

- `hsd3b2`: numeric

- `star`: numeric

- `progesterone`: numeric

- `testosterone`: numeric

- `dhea`: numeric

- `cortisol`: numeric

## Examples

``` r
data(steroidogenic_toxicity)
str(steroidogenic_toxicity)
#> tibble [162 × 13] (S3: tbl_df/tbl/data.frame)
#>  $ class       : Factor w/ 2 levels "toxic","nontoxic": 2 1 2 1 2 2 1 2 1 1 ...
#>  $ cyp_11a1    : num [1:162] 0.716 0.827 1.258 1.717 1.039 ...
#>  $ cyp_11b1    : num [1:162] 0.954 5.011 1.005 NA 1.328 ...
#>  $ cyp_11b2    : num [1:162] 1.239 2.307 0.919 NA 0.841 ...
#>  $ cyp_17a1    : num [1:162] 0.907 1.591 1.296 2.439 0.999 ...
#>  $ cyp_19a1    : num [1:162] 1.21 11.68 1.52 479.25 1.34 ...
#>  $ cyp_21a1    : num [1:162] 0.876 5.447 1.67 8 1.643 ...
#>  $ hsd3b2      : num [1:162] 0.984 0.514 2.017 3.898 1.799 ...
#>  $ star        : num [1:162] 0.908 1.385 1.669 4.051 1.188 ...
#>  $ progesterone: num [1:162] 61.53 6.42 48.63 90.8 60.02 ...
#>  $ testosterone: num [1:162] 80.4 35.5 83 48.1 87.3 ...
#>  $ dhea        : num [1:162] 75.6 21.9 71.2 30.3 80.9 ...
#>  $ cortisol    : num [1:162] NA NA 83.81 4.87 89.91 ...
```
