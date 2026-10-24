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
