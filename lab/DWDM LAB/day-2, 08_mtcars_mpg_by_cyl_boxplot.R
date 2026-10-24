# Exercise 8: Boxplot of mpg grouped by number of cylinders
data("mtcars", package = "datasets")
mtcars$cyl_group <- factor(mtcars$cyl)
boxplot(mpg ~ cyl_group, data = mtcars,
        main = "Fuel Economy by Number of Cylinders",
        xlab = "Number of cylinders", ylab = "Miles per gallon (mpg)",
        col = c("lightblue", "lightgreen", "lightpink"))
grid(nx = NA, ny = NULL)
