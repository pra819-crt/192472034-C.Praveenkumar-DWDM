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
