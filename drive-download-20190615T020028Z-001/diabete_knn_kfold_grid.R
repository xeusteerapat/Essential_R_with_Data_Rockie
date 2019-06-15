## split data
set.seed(99)
n <- nrow(PimaIndiansDiabetes)
id <- sample(n, size = n*0.75, replace=FALSE)
train_data <- PimaIndiansDiabetes[id, ]
test_data <- PimaIndiansDiabetes[-id, ]

## grid search
myGrid <- expand.grid(k = 1:10)

## train model with train_data
set.seed(99)
ctrl <- trainControl(method = "cv", number = 5, 
                     verboseIter = TRUE)

enet_model <- train(diabetes ~ ., 
                    data = train_data, 
                    method = "knn",
                    tuneGrid = myGrid,
                    trControl = ctrl)

enet_model

## test model (predict test data)
p <- predict(enet_model, newdata = test_data)
accuracy <- mean(p == test_data$diabetes)
accuracy