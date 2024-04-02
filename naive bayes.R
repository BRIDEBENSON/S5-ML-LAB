install.packages("mlbench")
install.packages("caret")
install.packages("ggplot2")
install.packages("randomForest")
library(mlbench)
library(caret)
dataset <- read.csv("C:/Users/student.CCF020/Downloads/Soybean.csv")
dataset
sum(is.na(dataset))
soybean <- na.omit(dataset)
preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])
set.seed(123)  # For reproducibility
splitIndex <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[splitIndex, ]
testing_data <- soybean[-splitIndex, ]
# Load required packages
library(e1071)  # For Naive Bayes

# Train a Naive Bayes classifier
model <- naiveBayes(Class ~ ., data = training_data)

# Make predictions on the testing data
predictions <- predict(model, newdata = testing_data)

# Convert predictions and the actual class labels to factors if they are not already
predictions <- as.factor(predictions)
testing_data$Class <- as.factor(testing_data$Class)

# Check the data types of the class labels
typeof(testing_data$Class)
typeof(predictions)


# Evaluate the model's performance
confusionMatrix(predictions, testing_data$Class)