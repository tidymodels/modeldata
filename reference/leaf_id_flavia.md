# Leaf identification data (Flavia)

Image analysis of leaves to predict species.

## Source

Lakshika, Jayani PG, and Thiyanga S. Talagala. "Computer-aided
interpretable features for leaf image classification." *arXiv preprint*
arXiv:2106.08077 (2021).

<https://github.com/SMART-Research/leaffeatures_paper>

## Value

- leaf_id_flavia:

  a data frame

## Details

From the original manuscript: "The Flavia dataset contains 1907 leaf
images. There are 32 different species and each has 50-77 images.
Scanners and digital cameras are used to acquire the leaf images on a
plain background. The isolated leaf images contain blades only, without
a petiole. These leaf images are collected from the most common plants
in Yangtze, Delta, China. Those leaves were sampled on the campus of the
Nanjing University and the Sun Yat-Sen arboretum, Nanking, China."

The reference below has details information on the features used for
prediction.

Columns:

- `species`: factor (32 levels)

- `apex`: factor (9 levels)

- `base`: factor (6 levels)

- `shape`: factor (5 levels)

- `denate_edge`: factor (levels: 'no' and 'yes')

- `lobed_edge`: factor (levels: 'no' and 'yes')

- `smooth_edge`: factor (levels: 'no' and 'yes')

- `toothed_edge`: factor (levels: 'no' and 'yes')

- `undulate_edge`: factor (levels: 'no' and 'yes')

- `outlying_polar`: numeric

- `skewed_polar`: numeric

- `clumpy_polar`: numeric

- `sparse_polar`: numeric

- `striated_polar`: numeric

- `convex_polar`: numeric

- `skinny_polar`: numeric

- `stringy_polar`: numeric

- `monotonic_polar`: numeric

- `outlying_contour`: numeric

- `skewed_contour`: numeric

- `clumpy_contour`: numeric

- `sparse_contour`: numeric

- `striated_contour`: numeric

- `convex_contour`: numeric

- `skinny_contour`: numeric

- `stringy_contour`: numeric

- `monotonic_contour`: numeric

- `num_max_points`: numeric

- `num_min_points`: numeric

- `diameter`: numeric

- `area`: numeric

- `perimeter`: numeric

- `physiological_length`: numeric

- `physiological_width`: numeric

- `aspect_ratio`: numeric

- `rectangularity`: numeric

- `circularity`: numeric

- `compactness`: numeric

- `narrow_factor`: numeric

- `perimeter_ratio_diameter`: numeric

- `perimeter_ratio_length`: numeric

- `perimeter_ratio_lw`: numeric

- `num_convex_points`: numeric

- `perimeter_convexity`: numeric

- `area_convexity`: numeric

- `area_ratio_convexity`: numeric

- `equivalent_diameter`: numeric

- `eccentricity`: numeric

- `contrast`: numeric

- `correlation_texture`: numeric

- `inverse_difference_moments`: numeric

- `entropy`: numeric

- `mean_red_val`: numeric

- `mean_green_val`: numeric

- `mean_blue_val`: numeric

- `std_red_val`: numeric

- `std_green_val`: numeric

- `std_blue_val`: numeric

- `correlation`: numeric

## Examples

``` r
data(leaf_id_flavia)
str(leaf_id_flavia)
#> tibble [1,907 × 59] (S3: tbl_df/tbl/data.frame)
#>  $ species                   : Factor w/ 32 levels "anhui_barberry",..: 9 9 9 9 9 9 9 9 9 9 ...
#>  $ apex                      : Factor w/ 9 levels "acuminate","acute",..: 5 5 5 5 5 5 5 5 5 5 ...
#>  $ base                      : Factor w/ 6 levels "acuminate","acute",..: 4 4 4 4 4 4 4 4 4 4 ...
#>  $ shape                     : Factor w/ 5 levels "diamond","heart_shape",..: 2 2 2 2 2 2 2 2 2 2 ...
#>  $ denate_edge               : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
#>  $ lobed_edge                : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
#>  $ smooth_edge               : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
#>  $ toothed_edge              : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
#>  $ undulate_edge             : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
#>  $ outlying_polar            : num [1:1907] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ skewed_polar              : num [1:1907] 0.461 0.475 0.536 0.477 0.491 ...
#>  $ clumpy_polar              : num [1:1907] 0.00648 0.0111 0.01732 0.01327 0.01116 ...
#>  $ sparse_polar              : num [1:1907] 0.0145 0.0145 0.0295 0.0143 0.0142 ...
#>  $ striated_polar            : num [1:1907] 0.979 0.98 0.676 0.99 0.97 ...
#>  $ convex_polar              : num [1:1907] 9.00e-04 1.53e-04 3.52e-02 2.56e-06 8.95e-05 ...
#>  $ skinny_polar              : num [1:1907] 0.118 0.544 0.776 0.707 0.638 ...
#>  $ stringy_polar             : num [1:1907] 1 1 0.854 1 1 ...
#>  $ monotonic_polar           : num [1:1907] 0.02681 0.00555 0.06848 0.09547 0.00961 ...
#>  $ outlying_contour          : num [1:1907] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ skewed_contour            : num [1:1907] 0.495 0.532 0.545 0.468 0.501 ...
#>  $ clumpy_contour            : num [1:1907] 0.0079 0.01085 0.02027 0.0109 0.00788 ...
#>  $ sparse_contour            : num [1:1907] 0.0145 0.0144 0.029 0.0145 0.0145 ...
#>  $ striated_contour          : num [1:1907] 0.974 0.981 0.677 0.978 0.98 ...
#>  $ convex_contour            : num [1:1907] 0.000479 0 0.035908 0.000939 0.000416 ...
#>  $ skinny_contour            : num [1:1907] 0.181 1 0.781 0.135 0.449 ...
#>  $ stringy_contour           : num [1:1907] 1 1 0.886 1 1 ...
#>  $ monotonic_contour         : num [1:1907] 8.16e-04 8.74e-06 1.25e-03 3.22e-01 2.81e-01 ...
#>  $ num_max_points            : num [1:1907] 1 3 4 1 1 1 1 1 1 1 ...
#>  $ num_min_points            : num [1:1907] 2 4 7 1 1 1 1 1 1 1 ...
#>  $ diameter                  : num [1:1907] 1256 1228 1113 1219 1187 ...
#>  $ area                      : num [1:1907] 936626 917300 855376 901303 885691 ...
#>  $ perimeter                 : num [1:1907] 3831 3781 3696 3678 3834 ...
#>  $ physiological_length      : num [1:1907] 1253 1218 1098 1205 1153 ...
#>  $ physiological_width       : num [1:1907] 1088 1091 1083 1053 1078 ...
#>  $ aspect_ratio              : num [1:1907] 0.868 0.896 0.986 0.874 0.935 ...
#>  $ rectangularity            : num [1:1907] 0.687 0.69 0.719 0.71 0.713 ...
#>  $ circularity               : num [1:1907] 0.802 0.806 0.787 0.837 0.757 ...
#>  $ compactness               : num [1:1907] 15.7 15.6 16 15 16.6 ...
#>  $ narrow_factor             : num [1:1907] 1.15 1.13 1.03 1.16 1.1 ...
#>  $ perimeter_ratio_diameter  : num [1:1907] 3.05 3.08 3.32 3.02 3.23 ...
#>  $ perimeter_ratio_length    : num [1:1907] 3.52 3.47 3.41 3.49 3.56 ...
#>  $ perimeter_ratio_lw        : num [1:1907] 1.64 1.64 1.69 1.63 1.72 ...
#>  $ num_convex_points         : num [1:1907] 125 128 114 138 125 125 121 112 115 115 ...
#>  $ perimeter_convexity       : num [1:1907] 0.94 0.939 0.923 0.95 0.913 ...
#>  $ area_convexity            : num [1:1907] 0.0236 0.0318 0.0393 0.0174 0.0495 ...
#>  $ area_ratio_convexity      : num [1:1907] 0.977 0.969 0.962 0.983 0.953 ...
#>  $ equivalent_diameter       : num [1:1907] 1092 1081 1044 1071 1062 ...
#>  $ eccentricity              : num [1:1907] 0.444 0.269 0.32 0.448 0.224 ...
#>  $ contrast                  : num [1:1907] 38.7 32.7 23.2 30.1 23.8 ...
#>  $ correlation_texture       : num [1:1907] 0.996 0.997 0.998 0.997 0.998 ...
#>  $ inverse_difference_moments: num [1:1907] 0.595 0.602 0.636 0.614 0.622 ...
#>  $ entropy                   : num [1:1907] 6.29 6.27 5.76 6.2 5.95 ...
#>  $ mean_red_val              : num [1:1907] 38 34.6 30.9 33.4 33.8 ...
#>  $ mean_green_val            : num [1:1907] 72.4 69.9 69.2 71.3 70.7 ...
#>  $ mean_blue_val             : num [1:1907] 42.8 42.9 40.8 40.7 42.5 ...
#>  $ std_red_val               : num [1:1907] 41.7 40.5 38.6 39.1 40.7 ...
#>  $ std_green_val             : num [1:1907] 74.3 73.1 76.8 75.9 75.7 ...
#>  $ std_blue_val              : num [1:1907] 46.4 48 48.1 46.6 48.5 ...
#>  $ correlation               : num [1:1907] -0.0276 -0.0031 -0.0363 0.5684 0.5311 ...
```
