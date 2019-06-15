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
ctrl <- trainControl(method = "cv", 
                     number = 5, 
                     search = "random",
                     verboseIter = TRUE) ## add ctrl object

tree_model <- train(medv ~ ., 
                  data = train_data, 
                  method = "rpart",
                  tuneLength = 10,
                  trControl = ctrl) ## add new argument
tree_model

## test model (predict test data)
p <- predict(tree_model, newdata = test_data)
RMSE(p, test_data$medv) ## predict, actual

## see variable importance
varImp(tree_model)
