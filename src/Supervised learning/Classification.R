library(caret)
library(e1071)

# Split data to train & test

data.partition <- createDataPartition(data.class$labels, p=.75, list=FALSE)

data.train <- data.class[data.partition,]
data.test <- data.class[-data.partition,]

# Train classficator

# k Nearest Neighbours
knn.fit <- knn3(labels~., data=data.train, k=5)
knn.fit

# Naive Bayes
nb.fit <- naiveBayes(labels~., data=data.train)
nb.fit

# Logistic Regression
lr.fit <- glm(labels~., family="binomial", data=data.train)
lr.fit

# Predictions for the training and test data
pred.train <- predict(knn.fit, data.train[,1:2], type="class")
pred.test <- predict(knn.fit, data.test[,1:2], type="class")

# Evaluate classifier
confusionMatrix(pred.train, data.train$labels)
confusionMatrix(pred.test, data.test$labels)
