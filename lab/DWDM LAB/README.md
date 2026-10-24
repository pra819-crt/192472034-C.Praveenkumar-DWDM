# R Programs — Day 2 Exercises

This folder contains one R script for each of the 10 exercises in `day2_excerises.docx.pdf`.

## How to run
1. Install R (and optionally RStudio).
2. Open an `.R` file in RStudio.
3. Set the working directory to the folder containing the script and any input CSV files.
4. Run the script.

Most exercises use base R datasets and require no extra packages. Exercise 7 tries `MASS::water` if MASS is installed. If that dataset is not available in your R setup, place `water.csv` in the working directory with columns named `mortality` and `hardness`. Exercise 10 requires `diabetes.csv` in the working directory with columns `Age` and `BloodPressure` (case-insensitive; spaces and underscores are tolerated).

## Important notes about the source PDF
- Exercise 2's list is broken across lines and appears out of order in the extracted PDF. The script reconstructs and sorts the visible values; compare the `prices` vector against your original printed sheet before submission. It interprets “bin equal to 3” as **3 equal-frequency bins**.
- Exercise 3's class scores appear duplicated by PDF formatting. The scripts use the apparent intended 9 values per class, not the repeated concatenated text.
- Exercise 4 normalizes the listed data `200, 300, 400, 600, 1000`; it does not use the separate $50,000–$100,000 example.
- Exercise 5 uses explicit histogram breaks to show the requested range. The interval 100–200 is 100 wide, while intervals 200–350, 350–500, and 500–650 are 150 wide; the final 650–700 interval is 50 wide so the plot ends at 700.

## Files
- `01_covariance_correlation.R`
- `02_binning_smoothing_histogram.R`
- `03_class_scores_summary_boxplot.R`
- `04_normalization.R`
- `05_airpassengers_histogram.R`
- `06_mtcars_multiple_line_plot.R`
- `07_water_hardness_regression.R`
- `08_mtcars_mpg_by_cyl_boxplot.R`
- `09_tennis_outlier_boxplot.R`
- `10_diabetes_bloodpressure_age.R`
