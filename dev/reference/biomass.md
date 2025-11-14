# Biomass data

Ghugare et al (2014) contains a data set where different biomass fuels
are characterized by the amount of certain molecules (carbon, hydrogen,
oxygen, nitrogen, and sulfur) and the corresponding higher heating value
(HHV). These data are from their Table S.2 of the Supplementary
Materials

## Source

Ghugare, S. B., Tiwary, S., Elangovan, V., and Tambe, S. S. (2013).
Prediction of Higher Heating Value of Solid Biomass Fuels Using
Artificial Intelligence Formalisms. *BioEnergy Research*, 1-12.

## Value

- biomass:

  a data frame

## Examples

``` r
data(biomass)
str(biomass)
#> 'data.frame':    536 obs. of  8 variables:
#>  $ sample  : chr  "Akhrot Shell" "Alabama Oak Wood Waste" "Alder" "Alfalfa" ...
#>  $ dataset : chr  "Training" "Training" "Training" "Training" ...
#>  $ carbon  : num  49.8 49.5 47.8 45.1 46.8 ...
#>  $ hydrogen: num  5.64 5.7 5.8 4.97 5.4 5.75 5.99 5.7 5.5 5.9 ...
#>  $ oxygen  : num  42.9 41.3 46.2 35.6 40.7 ...
#>  $ nitrogen: num  0.41 0.2 0.11 3.3 1 2.04 2.68 1.7 0.8 1.2 ...
#>  $ sulfur  : num  0 0 0.02 0.16 0.02 0.1 0.2 0.2 0 0.1 ...
#>  $ HHV     : num  20 19.2 18.3 18.2 18.4 ...
```
