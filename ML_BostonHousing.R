# Loading library
library(mlbench)

# Load data sets for regression problem
data("BostonHousing")

## Explorer data sets
# Checking data
str(BostonHousing)

# Checking missing value
complete.cases(BostonHousing)
mean(complete.cases(BostonHousing)) # finding avg of logical (should be equal to 1)

# Delete missing value
BostonHousing <- na.omit(BostonHousing)

# summarize stats
summary(BostonHousing)

# analytical function apply()
apply(BostonHousing, MARGIN = 2, FUN = mean)

help(BostonHousing)

# Train test split data sets
# rows counting
n <- nrow(BostonHousing)

set.seed(99)
# Random features for training set
id <- sample(n, size = n * 0.75)

# train and test data
train_data <- BostonHousing[id, ]
test_data <- BostonHousing[-id, ]

set.seed(99)

# create grid search for k
grid_search <- expand.grid(k = 3:10)

# K-fold cross validation to customize knn model (may I control model)
ctrl <- trainControl(method = "cv", 
                     number = 5, 
                     verboseIter = TRUE)

# KNN Training model
knn_model <- train(medv ~ rm + crim + tax + indus, 
                   data = train_data, 
                   method = "knn",
                   tuneGrid = grid_search,
                   trControl = ctrl)
# KNN Testing model
predict_price <- predict(knn_model, newdata = test_data)

# Evalutae model with root mean squared error
rmse <- sqrt(mean((predict_price - test_data$medv) ** 2))
rmse



