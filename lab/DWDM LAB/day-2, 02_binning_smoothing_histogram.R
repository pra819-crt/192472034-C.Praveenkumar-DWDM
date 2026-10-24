# Exercise 2: Equal-frequency binning, smoothing, and histogram
# The PDF's line wrapping makes the list order unclear. The values below are
# reconstructed and sorted from the numbers visible in the handout.
prices <- c(
  1, 1, rep(5, 5), 8, 8, rep(10, 4), 12,
  rep(14, 3), rep(15, 6), rep(18, 5),
  rep(20, 6), rep(21, 4), rep(25, 5), 28, 28, 30
)
prices <- sort(prices)

cat("Sorted prices (check against your handout):\n")
print(prices)
cat("Number of observations:", length(prices), "\n")

# Interpretation: "bin equal to 3" is taken to mean 3 equal-frequency bins.
# Each bin contains approximately the same number of observations.
make_equal_frequency_bins <- function(x, k = 3) {
  x <- sort(x)
  groups <- cut(seq_along(x), breaks = k, labels = FALSE)
  split(x, groups)
}
bins <- make_equal_frequency_bins(prices, 3)
cat("\nEqual-frequency bins (3 bins):\n")
print(bins)

# Smooth each value by its bin mean.
smooth_by_mean <- lapply(bins, function(b) rep(mean(b), length(b)))
cat("\nSmoothing by bin means:\n")
print(smooth_by_mean)

# Smooth by nearest bin boundary (ties go to the lower boundary).
smooth_by_boundary <- lapply(bins, function(b) {
  lo <- min(b); hi <- max(b)
  if (lo == hi) return(rep(lo, length(b)))
  ifelse(abs(b - lo) <= abs(b - hi), lo, hi)
})
cat("\nSmoothing by bin boundaries:\n")
print(smooth_by_boundary)

# Histogram of the original prices.
hist(prices, main = "All Electronics Item Prices",
     xlab = "Price ($)", ylab = "Frequency",
     col = "lightblue", border = "white")
