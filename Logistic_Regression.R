# Logistic Regression diabete
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

# train model
set.seed(99)
logistic_model <- train(diabetes ~ .,
                        data = train_data,
                        method = "glm")

# test model
predict_value <- predict(logistic_model,
                         newdata = test_data)

# accuracy
mean(predict_value == test_data$diabetes)
