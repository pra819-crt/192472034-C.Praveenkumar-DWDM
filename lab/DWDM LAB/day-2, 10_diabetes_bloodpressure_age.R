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
