## train random forests
set.seed(99)
myGrid <- expand.grid(mtry = 2:5)

ctrl <- trainControl(method = "cv", number = 5, 
                     verboseIter = TRUE)

rf_model <- train(diabetes ~ ., 
                  data = train_data, 
                  method = "rf",
                  tuneGrid = myGrid,
                  trControl = ctrl)

## test model 
p <- predict(rf_model, newdata = test_data)
accuracy <- mean(p == test_data$diabetes)
accuracy