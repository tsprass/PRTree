#' @param fill_type Integer indicating the method to be used to fill the
#'   probability matrix when `X` has NA's. Default is 2.
#'   \itemize{
#'    \item `0`: uniform (same probability for both child nodes).
#'    \item `1`: attributes all probability to the child node that is compatible
#'    with the observed values.
#'    \item `2`: computes the probability restricted to the observed entries.
#'   }
#'
#' @param proxy_crit Character. Default is `"both"`. Criterion used to associate
#'   an observation with missing values to a region:
#'   \itemize{
#'    \item `"mean"`: maximizes the difference in means after a split.
#'    \item `"var"`: maximizes the variability between nodes.
#'    \item `"both"`: combines the `"mean"` and `"var"` criteria.
#'   }
#'
#' @param n_candidates Integer. The number of competing candidates to consider
#'   when searching for the best split. To select the candidates, a proxy
#'   improvement measure is used. Then a full analysis is performed to choose
#'   the best among the `n_candidates` candidates. Higher values increase
#'   accuracy but significantly extend computation time due to the full analysis
#'   being performed on more splits. Default is 3.
#'
#' @param by_node Logical. If `TRUE`, the algorithm selects `n_candidates` for
#'   each node and then makes a full analysis to choose the best among all
#'   nodes. Otherwise the `n_candidates` are selected globally. Default is
#'   `FALSE`.
#'
#' @param dist Character. The distribution to be used in the model. One of
#'   `"norm"` (Gaussian), `"lnorm"` (log-normal), `"t"` (Student's \eqn{t}), or
#'   `"gamma"` (Gamma). Default is `"norm"`.
#'
#' @param iprint Integer. Controls the verbosity of the Fortran backend. Default
#'   is -1 (silent).
#'   \itemize{
#'    \item `iprint < 0`: No printing.
#'    \item `iprint = 0`: Prints basic information.
#'    \item `iprint > 0`: As for `iprint = 0` plus progress reports.
#'   }
#'
#' @param ... Extra parameters to be passed to the chosen distribution.
#' \itemize{
#'  \item `"norm"`: Uses the standard Gaussian distribution. No extra parameters required.
#'  \item `"lnorm"`: Uses the log-normal distribution with `meanlog = 0`. Requires `sdlog`.
#'  \item `"t"`: Uses the \eqn{t} distribution. Requires `df`.
#'  \item `"gamma"`: Uses the gamma distribution with `scale = 1`. Requires `shape`.
#' }
