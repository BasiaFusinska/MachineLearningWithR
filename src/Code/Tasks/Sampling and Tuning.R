# Tuning your algorithm is a complex and iterative task.
# In this task you will tune your model and then use it to predict values on the test set.
# Tasks to perform:
# - Split the iris dataset to the training and test data (90% in the training set)
# - Perform repeated 5-fold cross validation (3x)
# - Use Naive Bayes as your algorithm
# - Tune the algorithm providing the grid of 3 distinct sets of parameters values
# - Check how does the model perform on the validation test set (note that the algorithm is predicting the probabilities)
# Additional task:
# - How would you perform k-NN algorithm for k=7 that is trained on the whole training set?

# Spliting the data to train and test sets
data.partition <- createDataPartition(iris$Species, p=.9, list=FALSE)
iris.train <- iris[data.partition,]
iris.test <- iris[-data.partition,]

# 5-fold cross validation (no values provided)
tc.cv <- trainControl(method="repeatedcv", number = 5, repeats = 3)
nb.fit <- train(Species~., data=iris.train, trControl=tc.cv, method="nb")
nb.fit

# Have a look at nb parameters
modelLookup('nb')
# Prepare the grid of values
values <- data.frame(fL=c(0, 1, 1), 
                     usekernel=c(TRUE, FALSE, TRUE), 
                     adjust=c(1, 1, 1))
# Tune the model
tune.fit <- train(Species~., data=iris.train, trControl=tc.cv, method="nb", tuneGrid=values)
tune.fit

# Predict the values
knn.test <- predict(tune.fit, iris.test[,-5], type="prob")
knn.test

# Get the labels from the probabilities
labels <- names(knn.test)[apply(knn.test, 1, which.max)]

# Evaluate the model on test set
confusionMatrix(labels, iris.test$Species)

# kNN for k=7 trained on the whole training set
train(Species~., data=iris.train, trControl=trainControl(method="none"), method="knn", tuneGrid=data.frame(k=7))
