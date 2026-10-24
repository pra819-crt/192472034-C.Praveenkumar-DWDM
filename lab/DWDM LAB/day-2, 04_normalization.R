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
