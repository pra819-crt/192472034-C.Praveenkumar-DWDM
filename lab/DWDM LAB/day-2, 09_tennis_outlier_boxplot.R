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
