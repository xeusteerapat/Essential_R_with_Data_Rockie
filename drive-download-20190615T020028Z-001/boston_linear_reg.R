## install.packages("caret")
library(dplyr)
library(caret)
library(mlbench)

## look at built-in dataset
## data()

## regression - we'll use BostonHousing dataset
## classification - we'll use PimaIndiansDiabetes
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

## train model with train_data
## default resampling is BOOTSTRAP
set.seed(99)
lm_model <- train(medv ~ rm + indus + crim, 
                  data = train_data, 
                  method = "lm")
lm_model

## test model (predict test data)
p <- predict(lm_model, newdata = test_data)
(rmse <- sqrt(mean( (p - test_data$medv) ** 2 )))
RMSE(p, test_data$medv)

## see variable importance
varImp(lm_model)