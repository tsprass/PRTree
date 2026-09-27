#' @param max_terminal_nodes A non-negative integer. The maximum number of terminal 
#'   nodes (regions/leaves) in the output tree. The default is 15.
#'   
#' @param max_depth A non-negative integer. The maximum depth of the decision
#'   tree. The depth is defined as the length of the longest path from the root
#'   to a leaf. The default is `max_terminal_nodes - 1`.
#'   
#' @param cp A positive numeric value. The complexity parameter. Any split that
#'   does not decrease the MSE (mean square error) by a factor of at least `cp`
#'   will be ignored. The default is 0.01.
#'   
#' @param n_min A positive integer. The minimum number of observations required
#'   in a terminal (final) node. While Probabilistic Regression Trees can
#'   theoretically handle empty regions, this restriction is enforced to ensure
#'   the stable and well-posed calculation of the region's cut points
#'   (thresholds) based on empirical data. The default is 5.
#'   
#' @param prop_x A numeric value between 0 and 1. The minimum proportion of
#'   observations in a region that must have a probability greater than `p_min`
#'   to attempt a split. Default is 0.1. See \sQuote{Details} for more information.
#'   
#' @param p_min A numeric value between 0 and 1. The threshold probability used
#'   in conjunction with `prop_x` to evaluate if a region contains enough
#'   probability mass to be split. Default is 0.05. See \sQuote{Details}.
#'   
#' @details 
#' \strong{Splitting Constraints and Numerical Stability}
#' 
#' The parameters `prop_x` and `p_min` work together to control the splitting 
#' process. A splitting attempt is made in a given region only when at least a 
#' proportion `prop_x` of the training rows have a probability greater than 
#' `p_min` in that region's column of the probability matrix \eqn{P}. The split 
#' will be ignored if any of the resulting child regions do not meet this same 
#' criterion.
#' 
#' \strong{Warning:} Setting either parameter to zero may lead to near-zero 
#' columns in \eqn{P}, making the matrix computationally singular or 
#' ill-conditioned for inversion.
