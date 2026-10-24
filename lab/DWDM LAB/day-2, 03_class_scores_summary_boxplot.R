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
