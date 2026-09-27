#' @param grid_size Integer. Number of candidate vectors to generate when
#'   `sigma_grid = NULL`. Default is 8. See \sQuote{Details} for how multipliers
#'   are generated. Ignored when a custom grid is provided.
#'
#' @param min_mult Numeric. Minimum multiplier for automatic grid generation.
#'   Default is 0. See \sQuote{Details} for how this defines the multiplier
#'   interval. Ignored when a custom grid is provided.
#'
#' @param max_mult Numeric. Maximum multiplier for automatic grid generation.
#'   Default is 2. Ignored when a custom grid is provided.
#'
#' @param tiny_sigma A single numeric value or `NULL`. If provided, it is added
#'   to the grid as an additional candidate representing a very small
#'   \eqn{\sigma} value (same value for all features). This approximates the
#'   limiting case \eqn{\boldsymbol\sigma \to \boldsymbol{0}}, where the smooth
#'   assignment function \eqn{\Psi} converges to the hard indicator function,
#'   recovering deterministic splits. A typical value is `1e-20`. See
#'   \sQuote{Details} for its role in grid generation. Default is `NULL`.
#'   Ignored when a custom grid is provided.
#'   
#' @details 
#' 
#' \strong{Automatic grid generation}
#' 
#' The automatic grid is generated as follows:
#' \itemize{
#'  \item For each feature \eqn{j}, the base values are the empirical standard deviations
#'  \eqn{\hat\sigma_j} from the training data.
#'
#'  \item If `grid_size = 1`, the grid consists solely of these base values
#'  \eqn{\hat{\boldsymbol\sigma}}.
#'
#'  \item If `grid_size > 1`, the grid is constructed using `grid_size`
#'  multipliers equally spaced in the interval:
#'   \itemize{
#'    \item `(min_mult, max_mult]` when `min_mult = 0` (excludes 0, includes `max_mult`).
#'    \item `[min_mult, max_mult]` when `min_mult > 0` (both inclusive).
#'  }
#'  Each multiplier \eqn{m} generates a candidate vector \eqn{m \times \hat{\boldsymbol\sigma}}.
#'  
#'  \item If `tiny_sigma` is provided, it is added as an extra candidate (first
#'  row) with \eqn{\boldsymbol\sigma = \text{tiny\_sigma} \cdot
#'  \boldsymbol{1}_p}, where \eqn{\boldsymbol{1}_p} is a vector of ones of
#'  length \eqn{p} (the number of features). This results in a final grid of
#'  size `grid_size + 1`.
#' }
