# Exercise 6: Plot mpg and qsec as multiple lines using one plot() call
data("mtcars", package = "datasets")
df <- mtcars

# The two attributes have different scales. Standardize them for a meaningful
# shared-axis comparison, then draw both lines with one plot() call.
scaled <- scale(df[, c("mpg", "qsec")])
plot(scaled[, "mpg"], type = "l", lwd = 2, col = "blue",
     xlab = "Car index", ylab = "Standardized value",
     main = "mtcars: mpg and qsec (standardized)",
     ylim = range(scaled), xaxt = "n")
lines(scaled[, "qsec"], type = "l", lwd = 2, col = "red")
axis(1, at = seq_len(nrow(df)), labels = rownames(df), las = 2, cex.axis = 0.6)
legend("topright", legend = c("mpg", "qsec"),
       col = c("blue", "red"), lty = 1, lwd = 2, bty = "n")
