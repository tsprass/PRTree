#' @param method Character. Cross-validation method: either `"kfold"` or
#'   `"montecarlo"`. Default is `"montecarlo"`.
#'
#' @param n_rep Integer. Number of folds for \eqn{k}-fold CV or number of
#'   iterations for Monte Carlo CV. Default is 10.
#'
#' @param fold_idx Integer. Optional. A numeric vector with fold numbers (from 1
#'   to `n_rep`) for each observation, allowing for pre-defined folds. If
#'   provided, `method` is ignored and k-fold CV is used.
#'
#' @param only_sigma Logical. If `TRUE`, performs only \eqn{\boldsymbol\sigma}
#'   estimation without estimating test error. Default is `FALSE`.
#'   \itemize{
#'    \item When `sigma_grid` has multiple rows (or is `NULL`):
#'    `only_sigma = TRUE` selects \eqn{\boldsymbol\sigma} but does not use a
#'    test set. `only_sigma = FALSE` performs both \eqn{\boldsymbol\sigma}
#'    selection and test error estimation.
#'
#'    \item When `sigma_grid` has a single row (fixed sigma):
#'    `only_sigma` is automatically set to `FALSE`, as only test error
#'    estimation is meaningful.
#'   }
#'
#' @param prop_test Numeric between 0 and 1. Proportion of data for the test
#'   set in Monte Carlo CV. Default is 0.2.
#' \itemize{
#'  \item For `method = "montecarlo"`: Defines the proportion for the test set.
#'   If `0`, no test set is used (useful for \eqn{\boldsymbol\sigma} estimation
#'   only). Ignored if `only_sigma = TRUE`.
#'
#'  \item For `method = "kfold"`: This parameter is ignored. The test set is
#'   defined by the folds. To perform only \eqn{\boldsymbol\sigma} estimation
#'   with \eqn{k}-fold, set `only_sigma = TRUE`.
#'  }
#'
#' @param prop_valid Numeric between 0 and 1. Proportion of the training set to
#'   use for validation (\eqn{\boldsymbol\sigma} selection). Default is 0.2.
#'   \itemize{
#'    \item If `> 0`: the training set is split into training (`1 - prop_valid`)
#'    and validation (`prop_valid`) sets. The optimal \eqn{\boldsymbol\sigma} is
#'    chosen based on validation MSE.
#'
#'    \item If `0`: No validation split is created. The algorithm still
#'    evaluates all \eqn{\boldsymbol\sigma} candidates in the grid, but selects
#'    the optimal one based on the in-sample (training) MSE. This can lead to
#'    overfitting.
#'   }
#'
#' @param stratify Logical. If `TRUE`, performs stratified sampling based on
#'   missing values in `X`. Default is `FALSE`.
#'
#' @param update_final Logical. If `TRUE`, updates the final model with the optimal
#'   \eqn{\boldsymbol\sigma} after cross-validation. Default is `TRUE`. When `TRUE`
#'   (and `prop_valid > 0`), after selecting the optimal \eqn{\boldsymbol\sigma}
#'   on a validation set, the model is **re-fitted** using the entire training
#'   set of the current fold/iteration before evaluating on the test set. If
#'   `FALSE`, the model fitted on the smaller training subset (used for sigma
#'   selection) is used for evaluation, which can be faster but may yield higher
#'   test error estimates.
