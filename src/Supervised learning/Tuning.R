library(caret)

# Choose the train control as 10-fold cross validation
tc.cv <- trainControl(method="cv")

# tune by 10 the parameters (tuneLength)
modelLookup('knn')
tune.fit <- train(labels~., data=data.class, trControl=tc.cv, method="knn", tuneLength=10)
tune.fit

# tune by values
values <- data.frame(k=c(11, 12, 18))
tune.fit <- train(labels~., data=data.class, trControl=tc.cv, method="knn", tuneGrid=values)
tune.fit
