#' @param prop_hold A numeric value between 0 (inclusive) and 1 (exclusive) that
#'   specifies the proportion of the data to be held out for model validation or
#'   testing. Default is `0.2`. Ignored if `idx_train` is provided.
#'   
#' @param idx_train Optional integer vector specifying which observations to use
#'   as the training sample. Default is `NULL`. Overrides `prop_hold`.
#'
#' @details
#' \strong{Data Splitting Strategy}
#' The package uses a flexible data splitting strategy controlled by the
#' `prop_hold` and `idx_train` arguments:
#'
#' \itemize{
#'   \item \strong{Automatic Split (`idx_train = NULL`):} The training indices
#'   are computed automatically based on `prop_hold`. The split uses stratified
#'   sampling to ensure that the proportion of observations with missing values
#'   is preserved across the training and validation/test sets.
#'   
#'   \item \strong{Manual Split (`idx_train` provided):} The supplied indices
#'   are used directly, and `prop_hold` is ignored. The vector must be a valid 
#'   subset of `1:nrow(X)`. This approach is useful for reusing specific splits 
#'   from previous analyses, performing custom cross-validation, or ensuring 
#'   identical training sets across different models.
#' }
#' 
#' 
#' \strong{Role of the Hold-out Set}
#' When `prop_hold > 0` and `idx_train` is `NULL`, the exact role of the 
#' held-out data depends on the grid search parameters (`sigma_grid` or `grid_size`):
#' 
#' \itemize{
#'   \item \strong{Multiple candidates (`grid_size > 1`):} The hold-out data acts
#'   as a \strong{validation set} to select the best \eqn{\boldsymbol\sigma}. 
#'   If `prop_hold = 0`, the selection is based on the in-sample MSE of the 
#'   training data.
#'   
#'   \item \strong{Single candidate (`grid_size = 1`):} The hold-out data acts
#'   as a \strong{test set} to evaluate the final model. If `prop_hold = 0`, 
#'   the entire dataset is used for training without an independent test evaluation.
#' }
#' 
