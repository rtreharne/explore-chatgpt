# Load the necessary libraries
library(ggplot2)
library(dplyr)
library(stringr)

# Read the dataset
dataset <- read.csv("primate_data.csv")

# Make column headers fully capitalised
colnames(dataset) <- str_to_upper(colnames(dataset))

# Perform correlation analysis
cor_result <- cor.test(dataset$MAX.LIFESPAN, dataset$BRAIN.VOL)

# Print the correlation coefficient and p-value
cat("Pearson Correlation Coefficient:", cor_result$estimate, "\n")
cat("p-value:", cor_result$p.value, "\n")


# Create a scatter plot
plot(dataset$BRAIN.VOL, dataset$MAX.LIFESPAN, xlab = "Brain Volume (ml)", ylab = "Maximum Observed Longevity (yrs)",
     main = "Relationship between Brain Volume and Maximum Observed Longevity",
     pch=19)

# Add a linear regression line
abline(lm(MAX.LIFESPAN ~ BRAIN.VOL, data = dataset), col = "red")

