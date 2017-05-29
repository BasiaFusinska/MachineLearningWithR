# Iris is the dataset available from the standard installation
data(iris)

# Tasks:
# - Perform descriptive statistics (dimentionality, data types, correlation)
# - Try to understand the data from visualisations (distributions, outliers)
# - Check the features' distributions per classes and how would you separate classes programmatically
# - Visualise the data in 2D space separating the classes with colour

# 5 features, 150 examples
dim(iris)
names(iris)

# Summary of the data
# Classes are uniformly spreaded
# All features except labels (factor) are of the type numeric 
summary(iris)
class(iris$Sepal.Length)
class(iris$Sepal.Width)
class(iris$Petal.Length)
class(iris$Petal.Width)
class(iris$Species)

# Histograms
# Looks like Petal features are giving the most information on data separation
# Classes versocolor and virginica are still overlapping
ggplot(iris, aes(Sepal.Length)) + geom_histogram(binwidth = .1, aes(fill=Species))
ggplot(iris, aes(Sepal.Width)) + geom_histogram(binwidth = .1, aes(fill=Species))
ggplot(iris, aes(Petal.Length)) + geom_histogram(binwidth = .1, aes(fill=Species))
ggplot(iris, aes(Petal.Width)) + geom_histogram(binwidth = .1, aes(fill=Species))

ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot()
ggplot(iris, aes(Species, Sepal.Width)) + geom_boxplot()
ggplot(iris, aes(Species, Petal.Length)) + geom_boxplot()
ggplot(iris, aes(Species, Petal.Width)) + geom_boxplot()

# Plot the bivariate graphs and check the correlation
# Looks like there is a strong correlation between:
# - Sepal.Length - Petal.Length (.87)
# - Sepal.Length - Petal.Width (.81)
# - Petal.Length - Petal.Width (.96)
# Correlations also get stronger when broken down to separate classes

pairs(iris, pch=21, bg=iris$Species)
pairs(iris[,-5], pch=21, bg=iris$Species)

cor(iris[,-5])

ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point(aes(col=Species))

cor(iris[iris$Species == "setosa",-5])
cor(iris[iris$Species == "versicolor",-5])
cor(iris[iris$Species == "virginica",-5])

# Visualisation of the data in 2D
iris.areas <- NULL
iris.areas$petal <- iris$Petal.Length * iris$Petal.Width
iris.areas$sepal <- iris$Sepal.Length * iris$Sepal.Width
iris.areas <- data.frame(iris.areas)

ggplot(iris.areas, aes(sepal, petal)) + geom_point(aes(col=iris$Species))

# Dimensionality reduction
library(caret)
pca.par <- preProcess(iris[,-5], method=c("pca"), pcaComp = 2)
iris.pca <- predict(pca.par, iris[,-5])
summary(iris.pca)

ggplot(iris.pca, aes(PC1, PC2)) + geom_point(aes(col=iris$Species))
