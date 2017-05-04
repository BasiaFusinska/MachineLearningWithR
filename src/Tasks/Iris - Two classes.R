# You can use the subset of Iris to perform binary classification.
iris.two <- iris[iris$Species != 'setosa',]
iris.two$Species <- factor(iris.two$Species)
summary(iris.two)

# Your task is now to perform binary classification using logistic regression.
# Keep in mind that predictions will now held scored probabilities instead of the class labels.
