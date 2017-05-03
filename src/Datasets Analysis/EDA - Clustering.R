# Get the data for classification problem
data.clu <- clusteringSample()

# Explore the data
dim(data.clu)
names(data.clu)

class(data.clu$x1)
class(data.clu$x2)
class(data.clu$c.label)

summary(data.clu)

# Visualise the data
library(ggplot2)

ggplot(data.clu, aes(x1, x2)) + geom_point()
