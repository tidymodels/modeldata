#' Leaf identification data (Flavia)
#'
#' @description
#' Image analysis of leaves to predict species.
#'
#' @name leaf_id_flavia
#' @aliases leaf_id_flavia
#' @docType data
#' @return \item{leaf_id_flavia}{a data frame}
#'
#' @details
#' From the original manuscript: "The Flavia dataset contains 1907 leaf images.
#' There are 32 different species and each has 50-77 images. Scanners and
#' digital cameras are used to acquire the leaf images on a plain background.
#' The isolated leaf images contain blades only, without a petiole. These leaf
#' images are collected from the most common plants in Yangtze, Delta,
#' China. Those leaves were sampled on the campus of the Nanjing University and
#' the Sun Yat-Sen arboretum, Nanking, China."
#'
#' The reference below has details information on the features used for
#' prediction.
#'
#' Columns:
#' \itemize{
#'  \item \code{species}:  factor (32 levels)
#'  \item \code{apex}:  factor (9 levels)
#'  \item \code{base}:  factor (6 levels)
#'  \item \code{shape}:  factor (5 levels)
#'  \item \code{denate_edge}:  factor (levels: 'no' and 'yes')
#'  \item \code{lobed_edge}:  factor (levels: 'no' and 'yes')
#'  \item \code{smooth_edge}:  factor (levels: 'no' and 'yes')
#'  \item \code{toothed_edge}:  factor (levels: 'no' and 'yes')
#'  \item \code{undulate_edge}:  factor (levels: 'no' and 'yes')
#'  \item \code{outlying_polar}:  numeric
#'  \item \code{skewed_polar}:  numeric
#'  \item \code{clumpy_polar}:  numeric
#'  \item \code{sparse_polar}:  numeric
#'  \item \code{striated_polar}:  numeric
#'  \item \code{convex_polar}:  numeric
#'  \item \code{skinny_polar}:  numeric
#'  \item \code{stringy_polar}:  numeric
#'  \item \code{monotonic_polar}:  numeric
#'  \item \code{outlying_contour}:  numeric
#'  \item \code{skewed_contour}:  numeric
#'  \item \code{clumpy_contour}:  numeric
#'  \item \code{sparse_contour}:  numeric
#'  \item \code{striated_contour}:  numeric
#'  \item \code{convex_contour}:  numeric
#'  \item \code{skinny_contour}:  numeric
#'  \item \code{stringy_contour}:  numeric
#'  \item \code{monotonic_contour}:  numeric
#'  \item \code{num_max_ponits}:  numeric
#'  \item \code{num_min_points}:  numeric
#'  \item \code{diameter}:  numeric
#'  \item \code{area}:  numeric
#'  \item \code{perimeter}:  numeric
#'  \item \code{physiological_length}:  numeric
#'  \item \code{physiological_width}:  numeric
#'  \item \code{aspect_ratio}:  numeric
#'  \item \code{rectangularity}:  numeric
#'  \item \code{circularity}:  numeric
#'  \item \code{compactness}:  numeric
#'  \item \code{narrow_factor}:  numeric
#'  \item \code{perimeter_ratio_diameter}:  numeric
#'  \item \code{perimeter_ratio_length}:  numeric
#'  \item \code{perimeter_ratio_lw}:  numeric
#'  \item \code{num_convex_points}:  numeric
#'  \item \code{perimeter_convexity}:  numeric
#'  \item \code{area_convexity}:  numeric
#'  \item \code{area_ratio_convexity}:  numeric
#'  \item \code{equivalent_diameter}:  numeric
#'  \item \code{eccentriciry}:  numeric
#'  \item \code{contrast}:  numeric
#'  \item \code{correlation_texture}:  numeric
#'  \item \code{inverse_difference_moments}:  numeric
#'  \item \code{entropy}:  numeric
#'  \item \code{mean_red_val}:  numeric
#'  \item \code{mean_green_val}:  numeric
#'  \item \code{mean_blue_val}:  numeric
#'  \item \code{std_red_val}:  numeric
#'  \item \code{std_green_val}:  numeric
#'  \item \code{std_blue_val}:  numeric
#'  \item \code{correlation}:  numeric
#' }
#' @source
#' Lakshika, Jayani PG, and Thiyanga S. Talagala. "Computer-aided interpretable
#' features for leaf image classification." _arXiv preprint_ arXiv:2106.08077
#' (2021).
#'
#' \url{https://github.com/SMART-Research/leaffeatures_paper}
#'
#' @examples
#' data(leaf_id_flavia)
#' str(leaf_id_flavia)
#'
NULL
