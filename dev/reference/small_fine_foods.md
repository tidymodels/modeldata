# Fine foods example data

Fine foods example data

## Source

https://snap.stanford.edu/data/web-FineFoods.html

## Value

- training_data,testing_data:

  tibbles

## Details

These data are from Amazon, who describe it as "This dataset consists of
reviews of fine foods from amazon. The data span a period of more than
10 years, including all ~500,000 reviews up to October 2012. Reviews
include product and user information, ratings, and a plaintext review."

A subset of the data are contained here and are split into a training
and test set. The training set sampled 10 products and retained all of
their individual reviews. Since the reviews within these products are
correlated, we recommend resampling the data using a
leave-one-product-out approach. The test set sampled 500 products that
were not included in the training set and selected a single review at
random for each.

There is a column for the product, a column for the text of the review,
and a factor column for a class variable. The outcome is whether the
reviewer gave the product a 5-star rating or not.

## Examples

``` r
data(small_fine_foods)
str(training_data)
#> tibble [4,000 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ product: chr [1:4000] "B000J0LSBG" "B000EYLDYE" "B0026LIO9A" "B00473P8SK" ...
#>  $ review : chr [1:4000] "this stuff is  not stuffing  its  not good at all  save your money" "I absolutely LOVE this dried fruit.  LOVE IT.  Whenever I have a craving for something sweet, I can usually rip"| __truncated__ "GREAT DEAL, CONVENIENT TOO.  Much cheaper than WalMart and I don't need to lug it home, it appears on my doorst"| __truncated__ "Great flavor, we go through a ton of this sauce! I discovered it in a local grocery store and then was happy to"| __truncated__ ...
#>  $ score  : Factor w/ 2 levels "great","other": 2 1 1 1 1 1 2 1 1 1 ...
str(testing_data)
#> tibble [1,000 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ product: chr [1:1000] "B005GXFP60" "B000G7V394" "B004WJAULO" "B003D4MBOS" ...
#>  $ review : chr [1:1000] "These are the best tasting gummy fruits I have ever eaten. Can't stop eating them and the flavors are great." "I have been a consumer of Snyders hard sourdough pretzels for over 12 years.  For a while I could find them loc"| __truncated__ "This tastes so bad, I'm considering throwing it away.  But I'll probably punish myself for buying 3 boxes of 18"| __truncated__ "This product is way too pricey to have so little chocolate taste. The predominate flavor is grape which isn't o"| __truncated__ ...
#>  $ score  : Factor w/ 2 levels "great","other": 1 1 2 2 1 2 2 1 1 2 ...
```
