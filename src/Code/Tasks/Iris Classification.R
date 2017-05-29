# Once you know your data you could start a task of classifying them.
# You would be using two algorithms: k-Nearest Neighbours and Naive Bayes
# To do this you need to perform few tasks:
# - Prepare the data if needed (hint: some algorithms need the data to be normalised before beeing fed to the training phase, otherwise some of the dimensions can overtake)
# - Split the data to train and test (75% in the training set)
# - Perform training using both algorithms (don't worry about parameters tuning for now)
# - Check the performance of both classificator on the training and test sets
# - Visualise the classification results and underlying truth

# Normalising the data
norm.par <- preProcess(iris[,-5], method=c("range"))
iris.norm <- predict(norm.par, iris[,-5])
iris.norm$Species <- iris$Species
summary(iris.norm)

# Spliting the data to train and test sets
data.partition <- createDataPartition(iris.norm$Species, p=.75, list=FALSE)
iris.train <- iris.norm[data.partition,]
iris.test <- iris.norm[-data.partition,]

# k-NN classification
knn.fit <- knn3(Species~., data=iris.train, k=5)
knn.fit

# Naive Bayes
nb.fit <- naiveBayes(Species~., data=iris.train)
nb.fit

# Scoring the algorithms
knn.train <- predict(knn.fit, iris.train[,-5], type="class")
knn.test <- predict(knn.fit, iris.test[,-5], type="class")

nb.train <- predict(nb.fit, iris.train[,-5], type="class")
nb.test <- predict(nb.fit, iris.test[,-5], type="class")

# Evaluate the algorithms
confusionMatrix(knn.train, iris.train$Species)
confusionMatrix(knn.test, iris.test$Species)
confusionMatrix(nb.train, iris.train$Species)
confusionMatrix(nb.test, iris.test$Species)

# Visualising the classification results
pca.par <- preProcess(iris.norm[,-5], method=c("pca"), pcaComp = 2)
iris.norm.pca <- predict(pca.par, iris.norm[,-5])
summary(iris.norm.pca)

ggplot(iris.norm.pca[data.partition,], aes(PC1, PC2)) + 
  geom_point(aes(col=knn.train, shape=iris.train$Species)) +
  ggtitle('knn - train data')

ggplot(iris.norm.pca[-data.partition,], aes(PC1, PC2)) + 
  geom_point(aes(col=knn.test, shape=iris.test$Species)) +
  ggtitle('knn - test data')

ggplot(iris.norm.pca[data.partition,], aes(PC1, PC2)) + 
  geom_point(aes(col=nb.train, shape=iris.train$Species)) +
  ggtitle('nb - train data')

ggplot(iris.norm.pca[-data.partition,], aes(PC1, PC2)) + 
  geom_point(aes(col=nb.test, shape=iris.test$Species)) +
  ggtitle('nb - test data')
