# Load the necessary libraries
library(ggplot2)
library(dplyr)
library(stringr)

# Read the dataset
dataset <- read.csv("primate_data.csv")

# View the structure of the dataset
str(dataset)

colnames(dataset) <- str_to_upper(colnames(dataset))

# Summary statistics of numerical variables
summary(dataset[c("NEOCOR.RATIO", "BRAIN.VOL", "BODY.MASS", "BRAIN.MASS", "GROUP.SIZE", "HOME.RANGE", "MAX.LIFESPAN", "R.BRAIN.VOL", "R.BRAIN.MASS")])

# Frequency table for categorical variables
table(dataset$ACTIVITY)
table(dataset$SOCIAL.STRUCTURE)

# Scatter plot of brain volume against body mass
ggplot(dataset, aes(x = BODY.MASS, y = BRAIN.VOL)) +
  geom_point() +
  labs(x = "Body Mass (g)", y = "Brain Volume (ml)",
       title = "Scatter plot of Brain Volume against Body Mass")

# Bar plot of activity pattern
ggplot(dataset, aes(x = ACTIVITY)) +
  geom_bar() +
  labs(x = "Activity Pattern", y = "Count",
       title = "Bar plot of Activity Pattern")

# Box plot of brain volume by social structure
ggplot(dataset, aes(x = SOCIAL.STRUCTURE, y = BRAIN.VOL)) +
  geom_boxplot() +
  labs(x = "Social Structure", y = "Brain Volume (ml)",
       title = "Box plot of Brain Volume by Social Structure")

# Create a log-log scatter plot
plot(log(dataset$BODY.MASS), log(dataset$BRAIN.VOL), 
     xlab = "Log(Body Mass)", ylab = "(Log Brain Volume)", 
     main = "Brain Volume vs Body Mass (Log-Log Scale)",
     pch = 19)

# Add a trendline (optional)
model <- lm(log(BRAIN.VOL) ~ log(BODY.MASS), data = dataset)
abline(model, col = "red")

# Add gridlines (optional)
grid()

# Add a legend (optional)
legend("bottomright", legend = c("Data Points", "Trendline"),
       col = c("black", "red"), pch = c(16, NA), lty = c(NA, 1))

# Extract the coefficients
coefficients <- coef(model)

# Print the coefficients
print(coefficients)

summary(model)
