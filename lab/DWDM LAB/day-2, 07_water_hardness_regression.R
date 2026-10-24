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
