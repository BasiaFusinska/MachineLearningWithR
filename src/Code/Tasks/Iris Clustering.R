# Iris dataset can be used for clustering algorithm.
# - Use k-means and hierarchical clustering to separate data into clusters
# - Compare the cluster assignments to the original classes
# - Visualise your findings

# Used k-means for slustering
kmeans.fit <- kmeans(iris[,-5], 3)
kmeans.fit

# Retrieve cluster information
iris.clusters <- factor(kmeans.fit$cluster)

# Dimensionality reduction
pca.par <- preProcess(iris[,-5], method=c("pca"), pcaComp = 2)
iris.pca <- predict(pca.par, iris[,-5])
summary(iris.pca)

# Plot clusters agains original data generation
ggplot(iris.pca, aes(PC1, PC2)) + geom_point(aes(col=iris.clusters, shape=iris$Species))

# This piece may require rearranging
clusters.names <- c('versicolor', 'virginica', 'setosa')

# Check the original data 
table(clusters.names[iris.clusters], iris$Species)

# Hierarchical clustering
iris.dist <- dist(iris[,-5])
hc.fit <- hclust(iris.dist, method = "complete")

# find clusters cut
groups <- factor(cutree(hc.fit, k=3))

# plot the values
ggplot(iris.pca, aes(PC1, PC2)) + geom_point(aes(col=groups, shape=iris$Species))

# This piece may require rearranging
clusters.names <- c('setosa', 'virginica', 'versicolor')

# Check the original data 
table(clusters.names[groups], iris$Species)
