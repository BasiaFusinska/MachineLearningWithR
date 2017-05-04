# Simple clustering algorithm
kmeans.fit <- kmeans(data.clu[,1:2], 3)
kmeans.fit
kmeans.fit$centers
kmeans.fit$size

# Retrieve cluster information
clu.cen <- data.frame(kmeans.fit$centers)
clu.col <- factor(kmeans.fit$cluster)

# Plot clusters against original data generation
ggplot(data.clu, aes(x1, x2)) + geom_point(aes(col=clu.col)) +
  geom_point(data=clu.cen)

ggplot(data.clu, aes(x1, x2)) + geom_point(aes(col=clu.col, shape=data.clu$c.label)) +
  geom_point(data=clu.cen)

# Check the original data 
table(data.clu$c.label, clu.col)
