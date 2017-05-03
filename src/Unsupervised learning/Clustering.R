# Simple clustering algorithm
data.clusters <- kmeans(data.clu[,1:2], 3)
data.clusters
data.clusters$centers
data.clusters$size

# Retrieve cluster information
clu.cen <- data.frame(data.clusters$centers)
clu.col <- factor(data.clusters$cluster)

# Plot clusters agains original data generation
ggplot(data.clu, aes(x1, x2)) + geom_point(aes(col=clu.col)) +
  geom_point(data=clu.cen)

ggplot(data.clu, aes(x1, x2)) + geom_point(aes(col=clu.col, shape=data.clu$c.label)) +
  geom_point(data=clu.cen)
