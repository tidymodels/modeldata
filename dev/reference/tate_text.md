# Tate Gallery modern artwork metadata

Metadata such as artist, title, and year created for recent artworks
owned by the Tate Gallery. Only artworks created during or after 1990
are included, and the metadata source was last updated in 2014. The Tate
Gallery provides these data but requests users to be respectful of their
[guidelines for
use](https://github.com/tategallery/collection#usage-guidelines-for-open-data).

## Source

- <https://github.com/tategallery/collection>

- <https://www.tate.org.uk/>

## Value

- tate_text:

  a tibble

## Examples

``` r
data(tate_text)
str(tate_text)
#> tibble [4,284 × 5] (S3: tbl_df/tbl/data.frame)
#>  $ id    : num [1:4284] 21926 20472 20474 20473 20513 ...
#>  $ artist: Factor w/ 701 levels "Absalon","Abts, Tomma",..: 1 29 29 29 29 32 41 49 53 57 ...
#>  $ title : chr [1:4284] "Proposals for a Habitat" "Michael" "Geoffrey" "Jake" ...
#>  $ medium: Factor w/ 1033 levels "100 digital prints on paper, ink on paper and wall text",..: 921 288 288 288 567 567 135 1018 561 740 ...
#>  $ year  : num [1:4284] 1990 1990 1990 1990 1990 1990 1990 1990 1990 1990 ...
```
