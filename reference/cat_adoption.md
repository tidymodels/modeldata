# Cat Adoption

A subset of the cats at the animal shelter in Long Beach, California,
USA.

## Source

<https://data.longbeach.gov/explore/dataset/animal-shelter-intakes-and-outcomes/information/>
on 2024-06-17

## Value

tibble

## Details

A data frame with 2257 rows and 19 columns:

- time:

  The time the cat spent at the shelter.

- event:

  The event of interest is the cat being homed or returned to its
  original location (i.e., owner or community). The non-event is the cat
  being transferred to another shelter or dying. Zero indicates a
  non-event (censored), and one corresponds to the event occurring.

- sex:

  The sex of the cat.

- neutered:

  Whether the cat is neutered.

- intake_condition:

  The intake condition of the cat.

- intake_type:

  The type of intake.

- latitude:

  Latitude of the intersection/cross street of intake or capture.

- longitude:

  Longitude of the intersection/cross street of intake or capture.

- black,brown,brown_tabby,calico,cream,gray,gray_tabby,orange,orange_tabby,tan,tortie,white:

  Indicators for the color/pattern of the cat's fur.

## Examples

``` r
str(cat_adoption)
#> tibble [2,257 × 20] (S3: tbl_df/tbl/data.frame)
#>  $ time            : num [1:2257] 17 98 15 72 22 66 200 9 45 38 ...
#>  $ event           : num [1:2257] 1 1 0 1 0 1 1 0 1 1 ...
#>  $ sex             : Factor w/ 3 levels "female","male",..: 2 2 2 1 2 2 1 1 2 2 ...
#>  $ neutered        : Factor w/ 3 levels "no","unknown",..: 3 3 3 3 3 3 3 3 3 1 ...
#>  $ intake_condition: Factor w/ 7 levels "feral","fractious",..: 2 5 4 2 5 5 7 5 3 3 ...
#>  $ intake_type     : Factor w/ 3 levels "owner_surrender",..: 1 2 1 1 1 1 3 1 2 2 ...
#>  $ latitude        : num [1:2257] 33.8 33.8 33.8 33.8 33.8 ...
#>  $ longitude       : num [1:2257] -118 -118 -118 -118 -118 ...
#>  $ black           : int [1:2257] 0 0 0 1 0 1 0 1 0 0 ...
#>  $ brown           : int [1:2257] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ brown_tabby     : int [1:2257] 0 0 0 0 1 0 0 0 0 0 ...
#>  $ calico          : int [1:2257] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ cream           : int [1:2257] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ gray            : int [1:2257] 0 0 1 0 0 1 1 0 0 0 ...
#>  $ gray_tabby      : int [1:2257] 0 0 0 0 0 0 0 0 0 1 ...
#>  $ orange          : int [1:2257] 0 1 0 0 0 0 0 0 0 0 ...
#>  $ orange_tabby    : int [1:2257] 0 0 0 0 0 0 0 0 1 0 ...
#>  $ tan             : int [1:2257] 1 0 0 0 0 0 0 0 0 0 ...
#>  $ tortie          : int [1:2257] 0 0 0 1 0 0 0 0 0 0 ...
#>  $ white           : int [1:2257] 1 1 1 0 1 0 1 1 1 1 ...
```
