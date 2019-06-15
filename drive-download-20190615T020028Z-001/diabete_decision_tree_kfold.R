## split data
set.seed(99)
n <- nrow(PimaIndiansDiabetes)
id <- sample(n, size = n*0.75, replace=FALSE)
train_data <- PimaIndiansDiabetes[id, ]
test_data <- PimaIndiansDiabetes[-id, ]

## train model with train_data
set.seed(99)
ctrl <- trainControl(method = "cv", number = 5, 
                     verboseIter = TRUE)

tree_model <- train(diabetes ~ ., 
                        data = train_data, 
                        method = "rpart",
                        trControl = ctrl)

tree_model

## test model (predict test data)
p <- predict(tree_model, newdata = test_data)
accuracy <- mean(p == test_data$diabetes)
accuracy