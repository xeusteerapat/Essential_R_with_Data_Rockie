## regression - we'll use BostonHousing dataset
library(mlbench)
library(dplyr)
library(caret)
data("BostonHousing")

## regression problem
## explore dataset
glimpse(BostonHousing)
mean(complete.cases(BostonHousing))
summary(BostonHousing)

## train test split
set.seed(99)
n <- nrow(BostonHousing)
id <- sample(n, size = n*0.75, replace=FALSE)
train_data <- BostonHousing[id, ]
test_data <- BostonHousing[-id, ]

## train model  
set.seed(99)
knn_model <- train(medv ~ ., data = train_data, method = "knn")
knn_model

## test model
p <- predict(knn_model, newdata = test_data)

## rmse
rmse <- sqrt(mean((p - test_data$medv)**2))