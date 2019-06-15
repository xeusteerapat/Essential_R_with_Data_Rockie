# Decsion Tree diabete not complete yet!!!!!
library(mlbench)

data("PimaIndiansDiabetes")

# train test split
df <- PimaIndiansDiabetes
n <- nrow(df)
set.seed(99)
id <- sample(n, size = n * 0.75)
train_data <- df[id, ]
test_data <- df[-id, ]

# checking data
table(df$diabetes)

# explorer percentage
table(df$diabetes) / nrow(df)

# train tree model
set.seed(99)
tree_model <- train(diabetes ~ .,
                        data = train_data,
                        method = "glm")

# test model
predict_value <- predict(tree_model,
                         newdata = test_data)

# accuracy
accuracy <- mean(predict_value == test_data$diabetes)
accuracy

# confusion matrix
table(predict_value, test_data$diabetes, dnn = c("Predict", "Actual"))

confusionMatrix(data = predict_value,
                reference = test_data$diabetes,
                positive = "pos",
                mode = "everything")
