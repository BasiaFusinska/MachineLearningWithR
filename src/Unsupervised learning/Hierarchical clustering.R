# Hierarchical clustering
data.dist <- dist(data.clu[,1:2])
hc.fit <- hclust(data.dist, method = "complete")

# find clusters cut
groups <- factor(cutree(hc.fit, k=3))

# plot the tree
plot(hc.fit)
rect.hclust(hc.fit, k=3, border="red") 

# plot the values
ggplot(data.clu, aes(x1, x2)) + geom_point(aes(col=groups, shape=data.clu$c.label))
