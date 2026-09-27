#' @param sigma_grid Optional. Custom grid of candidate \eqn{\boldsymbol\sigma}
#'   vectors. See \sQuote{Details} for accepted formats and behavior. Default is
#'   `NULL` (automatic generation).
#'
#'   **Note:** The dimensions of `sigma_grid` are not validated inside [pr_tree_control].
#'   Dimension checking against the number of features is performed internally
#'   during the execution of `pr_tree` or `pr_tree_cv`.
#'
#' @details 
#' 
#' \strong{Custom grid specification}
#' 
#' When a custom grid is provided via `sigma_grid`, it must follow these rules:
#' \itemize{
#'   \item A \strong{single number} is expanded to a constant vector (same value
#'   for all features).
#'   
#'   \item A \strong{numeric vector} of length \eqn{p} (the number of features)
#'   is used directly as one candidate vector.
#'   
#'   \item A \strong{\eqn{k \times p} numeric matrix} provides \eqn{k} candidates,
#'   one per row.
#' }
#' In all custom grid cases, the automatic grid parameters (`grid_size`,
#' `min_mult`, `max_mult`, `tiny_sigma`) are ignored.
