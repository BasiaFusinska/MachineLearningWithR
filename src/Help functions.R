library('Metrics')

# Relative Squared Error
rse <- function (actual, predicted) {
  sum(se(actual, predicted)) / sum(se(actual, mean(actual)))
}
