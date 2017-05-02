library(caret)

# Choose the train control as 10-fold cross validation
tc.cv <- trainControl(method="cv")

# Get the available models for the train function
names(getModelInfo())
getModelInfo('knn')

# tune by 10 the parameters (tuneLength)
modelLookup('knn')
tune.fit <- train(labels~., data=myData, trControl=tc.cv, method="knn", tuneLength=10)
tune.fit

# tune by values
values <- data.frame(k=c(11, 12, 18))
tune.fit <- train(labels~., data=myData, trControl=tc.cv, method="knn", tuneGrid=values)
tune.fit

modelLookup('nb')
values <- data.frame(fL=c(0, 0, 1, 1), 
                     usekernel=c(TRUE, FALSE, TRUE, FALSE), 
                     adjust=c(1, 1, 1, 1))
tune.fit <- train(labels~., data=myData, trControl=tc.cv, method="nb", tuneGrid=values)
tune.fit
