# You can use the subset of Iris to perform binary classification.
iris.two <- iris[iris$Species != 'setosa',]
iris.two$Species <- factor(iris.two$Species)
summary(iris.two)

# Your task is now to perform binary classification using logistic regression.
# Keep in mind that predictions will now held scored probabilities instead of the class labels.

# Spliting the data to train and test sets
data.partition <- createDataPartition(iris.two$Species, p=.75, list=FALSE)
iris.train <- iris.two[data.partition,]
iris.test <- iris.two[-data.partition,]

# Logistic regression
lr.fit <- glm(Species~., family="binomial", data=iris.train)
lr.fit

# Score the training and test sets
knn.train.prob <- predict(lr.fit, iris.train[,-5], type="response")
knn.test.prob <- predict(lr.fit, iris.test[,-5], type="response")
knn.train

# Get classes from probabilities
getLabel <- function(x) {ifelse(x > 0.5, 'virginica', 'versicolor')}
knn.train <- sapply(knn.train.prob, getLabel)
knn.test <- sapply(knn.test.prob, getLabel)

# Evaluate the algorithm
confusionMatrix(knn.train, iris.train$Species)
confusionMatrix(knn.test, iris.test$Species)

