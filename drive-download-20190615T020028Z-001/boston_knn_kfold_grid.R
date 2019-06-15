## create grid
myGrid <- expand.grid(k = 1:10); myGrid

## train model  
set.seed(99)
ctrl <- trainControl(method = "cv", number = 5, verboseIter = TRUE)
knn_model <- train(medv ~ ., 
                   data = train_data, 
                   tuneGrid = myGrid,
                   method = "knn",
                   trControl = ctrl)

knn_model

## test model
p <- predict(knn_model, newdata = test_data)

## rmse
rmse <- sqrt(mean((p - test_data$medv)**2))
rmse