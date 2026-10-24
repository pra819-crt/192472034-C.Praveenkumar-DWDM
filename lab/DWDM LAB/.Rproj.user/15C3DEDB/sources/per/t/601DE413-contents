# Combined R programs for all 10 Day 2 exercises
# Run individual scripts for best results, especially exercises 7 and 10.



# ========================================================================
# 01_covariance_correlation.R
# ========================================================================
# Exercise 1: Covariance and correlation
# Rows are age groups; columns are photograph preference counts.
# Note: these are aggregated counts, not individual-level observations.
preferences <- data.frame(
  A = c(18, 2, 20),
  B = c(22, 28, 10),
  C = c(20, 40, 40),
  row.names = c("5-6 years", "7-8 years", "9-10 years")
)

cat("Input preference table:\n")
print(preferences)

# The exercise asks for covariance/correlation between columns B and C.
cat("\nSample covariance between B and C:\n")
print(cov(preferences$B, preferences$C))

cat("\nSample covariance matrix:\n")
print(cov(preferences))

cat("\nSample correlation between B and C:\n")
print(cor(preferences$B, preferences$C))

cat("\nSample correlation matrix:\n")
print(cor(preferences))

# Important interpretation:
# The rows are age groups and each entry is a count. Treating three age-group
# counts as three paired observations is not a valid individual-level test of
# association. A chi-squared test of independence on the contingency table is
# more appropriate for the study question.
cat("\nChi-squared test of independence on the count table:\n")
print(chisq.test(as.matrix(preferences)))


# ========================================================================
# 02_binning_smoothing_histogram.R
# ========================================================================
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


# ========================================================================
# 03_class_scores_summary_boxplot.R
# ========================================================================
# Exercise 3: Compare Class A and Class B exam scores
# The PDF appears to duplicate the score sequences due to formatting.
# The intended values are interpreted as 9 scores per class.
class_A <- c(76, 35, 47, 64, 95, 66, 89, 36, 84)
class_B <- c(51, 56, 84, 60, 59, 70, 63, 66, 50)

summary_stats <- function(x) {
  c(Mean = mean(x), Median = median(x), Range = diff(range(x)),
    Minimum = min(x), Maximum = max(x))
}
cat("Class A statistics:\n"); print(summary_stats(class_A))
cat("\nClass B statistics:\n"); print(summary_stats(class_B))

cat("\nHigher mean:", if (mean(class_A) > mean(class_B)) "Class A" else "Class B", "\n")
cat("Higher median:", if (median(class_A) > median(class_B)) "Class A" else
    if (median(class_A) < median(class_B)) "Class B" else "Tie", "\n")
cat("Larger range:", if (diff(range(class_A)) > diff(range(class_B))) "Class A" else
    if (diff(range(class_A)) < diff(range(class_B))) "Class B" else "Tie", "\n")

boxplot(class_A, class_B, names = c("Class A", "Class B"),
        main = "Year 9 Exam Scores by Class",
        ylab = "Exam score", col = c("lightblue", "lightgreen"))
grid(nx = NA, ny = NULL)
cat("\nInference: compare medians, spread (IQR), whiskers, and any outliers in the plot.\n")


# ========================================================================
# 04_normalization.R
# ========================================================================
# Exercise 4: Min-max and z-score normalization
x <- c(200, 300, 400, 600, 1000)

# (a) Min-max normalization to [0, 1]
minmax <- (x - min(x)) / (max(x) - min(x))

# (b) Z-score normalization: (x - mean) / sample standard deviation
zscore <- (x - mean(x)) / sd(x)

results <- data.frame(
  Original = x,
  Min_Max_0_1 = minmax,
  Z_Score = zscore
)
print(results)

# Formula reminder:
# Min-max: (x - minimum) / (maximum - minimum)
# Z-score: (x - mean(x)) / standard deviation


# ========================================================================
# 05_airpassengers_histogram.R
# ========================================================================
# Exercise 5: Histogram of AirPassengers
data("AirPassengers", package = "datasets")
passengers <- as.numeric(AirPassengers)

# The prompt asks to start the x-axis at 100 and use 150-wide bins
# from 200 to 700. Breaks are 100, 200, 350, 500, 650, 700 so the
# first bin starts at 100 and the requested 150-wide bins cover 200-650.
# Use explicit breaks to make the requested intervals visible.
breaks <- c(100, 200, 350, 500, 650, 700)
hist(passengers, breaks = breaks, include.lowest = TRUE,
     main = "AirPassengers Histogram",
     xlab = "Monthly passenger count (thousands)",
     ylab = "Frequency", col = "lightblue", border = "white",
     xlim = c(100, 700))


# ========================================================================
# 06_mtcars_multiple_line_plot.R
# ========================================================================
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


# ========================================================================
# 07_water_hardness_regression.R
# ========================================================================
# Exercise 7: Water hardness vs mortality, linear regression and prediction
# The handout refers to a "water" dataset with columns mortality and hardness.
# Try the MASS package dataset first; if unavailable, load a local CSV file.
water_data <- NULL

if (requireNamespace("MASS", quietly = TRUE)) {
  possible <- try(data("water", package = "MASS", envir = environment()), silent = TRUE)
  if (exists("water", inherits = FALSE)) water_data <- get("water")
}
if (is.null(water_data) || !all(c("mortality", "hardness") %in% names(water_data))) {
  cat("Could not find MASS::water with columns mortality and hardness.\n")
  cat("Please place a CSV named water.csv in the working directory with columns mortality, hardness.\n")
  if (file.exists("water.csv")) water_data <- read.csv("water.csv")
}
if (is.null(water_data) || !all(c("mortality", "hardness") %in% names(water_data))) {
  stop("Dataset unavailable or missing required columns. See README for setup.")
}

water_data <- na.omit(water_data[, c("mortality", "hardness")])
plot(water_data$hardness, water_data$mortality,
     xlab = "Water hardness", ylab = "Mortality",
     main = "Mortality vs Water Hardness", pch = 19, col = "steelblue")
model <- lm(mortality ~ hardness, data = water_data)
abline(model, col = "red", lwd = 2)
cat("Linear regression model:\n")
print(summary(model))
cat("\nPrediction for hardness = 88:\n")
print(predict(model, newdata = data.frame(hardness = 88)))
cat("\nCorrelation coefficient:\n")
print(cor(water_data$hardness, water_data$mortality))


# ========================================================================
# 08_mtcars_mpg_by_cyl_boxplot.R
# ========================================================================
# Exercise 8: Boxplot of mpg grouped by number of cylinders
data("mtcars", package = "datasets")
mtcars$cyl_group <- factor(mtcars$cyl)
boxplot(mpg ~ cyl_group, data = mtcars,
        main = "Fuel Economy by Number of Cylinders",
        xlab = "Number of cylinders", ylab = "Miles per gallon (mpg)",
        col = c("lightblue", "lightgreen", "lightpink"))
grid(nx = NA, ny = NULL)


# ========================================================================
# 09_tennis_outlier_boxplot.R
# ========================================================================
# Exercise 9: Identify possible tennis scoring outliers with a boxplot
# Example: points scored by 12 players in a practice scoring drill.
player_points <- c(8, 10, 11, 12, 12, 13, 14, 15, 15, 16, 18, 35)

boxplot(player_points, horizontal = TRUE, col = "lightblue",
        main = "Tennis Players' Points: Outlier Check",
        xlab = "Points scored", outline = TRUE)
stripchart(player_points, method = "jitter", add = TRUE,
           pch = 19, col = "darkblue", vertical = FALSE)

# R's boxplot rule: points beyond 1.5 * IQR from Q1/Q3 are plotted as
# possible outliers. An outlier should be checked, not automatically deleted.
q1 <- unname(quantile(player_points, 0.25))
q3 <- unname(quantile(player_points, 0.75))
iqr_value <- IQR(player_points)
lower_fence <- q1 - 1.5 * iqr_value
upper_fence <- q3 + 1.5 * iqr_value
outliers <- player_points[player_points < lower_fence | player_points > upper_fence]

cat("Q1:", q1, "\nQ3:", q3, "\nIQR:", iqr_value,
    "\nLower fence:", lower_fence, "\nUpper fence:", upper_fence, "\n")
cat("Possible outlier scores:\n")
print(outliers)


# ========================================================================
# 10_diabetes_bloodpressure_age.R
# ========================================================================
# Exercise 10: BloodPressure vs Age from diabetes.csv
# Put diabetes.csv in the working directory. Required columns: Age, BloodPressure.
# Column matching is case-insensitive and ignores spaces/underscores.
file_path <- "diabetes.csv"
if (!file.exists(file_path)) {
  stop("diabetes.csv not found. Put it in the current working directory; see README.")
}
diabetes <- read.csv(file_path, stringsAsFactors = FALSE, check.names = FALSE)
normalize_name <- function(x) tolower(gsub("[ _.-]", "", x))
names_norm <- normalize_name(names(diabetes))
age_col <- which(names_norm == "age")[1]
bp_col <- which(names_norm %in% c("bloodpressure", "bloodpress"))[1]
if (is.na(age_col) || is.na(bp_col)) {
  stop(paste("Required Age and BloodPressure columns not found. Columns are:",
             paste(names(diabetes), collapse = ", ")))
}
age <- suppressWarnings(as.numeric(diabetes[[age_col]]))
bp <- suppressWarnings(as.numeric(diabetes[[bp_col]]))
df <- na.omit(data.frame(Age = age, BloodPressure = bp))

# Scatterplot
plot(df$Age, df$BloodPressure, pch = 19, col = "steelblue",
     xlab = "Age", ylab = "Blood pressure",
     main = "Blood Pressure vs Age")
if (nrow(df) >= 2) abline(lm(BloodPressure ~ Age, data = df), col = "red", lwd = 2)

# Bar chart: mean blood pressure for age groups (decade-wide groups).
df$AgeGroup <- cut(df$Age,
                   breaks = seq(floor(min(df$Age) / 10) * 10,
                                ceiling(max(df$Age) / 10) * 10 + 10, by = 10),
                   right = FALSE, include.lowest = TRUE)
mean_bp <- aggregate(BloodPressure ~ AgeGroup, data = df, FUN = mean)
barplot(mean_bp$BloodPressure, names.arg = mean_bp$AgeGroup,
        las = 2, col = "lightgreen",
        xlab = "Age group", ylab = "Mean blood pressure",
        main = "Mean Blood Pressure by Age Group")

cat("Correlation between age and blood pressure:\n")
print(cor(df$Age, df$BloodPressure))
cat("\nMean blood pressure by age group:\n")
print(mean_bp)
