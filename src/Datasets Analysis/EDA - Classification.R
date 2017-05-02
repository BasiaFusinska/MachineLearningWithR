# Get the data for classification problem
data.class <- classificationSample()

# Explore the data
dim(data.class)
names(data.class)

class(data.class$labels)
class(data.class$x1)
class(data.class$x2)

summary(data.class)

# Visualise the data
library(ggplot2)

# Univariate plots
ggplot(data.class, aes(x1)) + geom_histogram(binwidth = 1)
ggplot(data.class, aes(x2)) + geom_histogram(binwidth = 1)

ggplot(data.class, aes(x1)) + geom_histogram(binwidth = 1, aes(fill=labels))
ggplot(data.class, aes(x2)) + geom_histogram(binwidth = 1, aes(fill=labels))

ggplot(data.class, aes(labels, x1)) + geom_boxplot()
ggplot(data.class, aes(labels, x2)) + geom_boxplot()

# Bivariate plots
ggplot(data.class, aes(x1, x2)) + geom_point(aes(col=labels))

pairs(data.class, pch=21, bg=data.class$labels)
pairs(data.class[1:2], pch=21, bg=data.class$labels)

# Correlation
cor(data.class$x1, data.class$x2)

data.l1 <- data.class[data.class$label == 'A',]
data.l2 <- data.class[data.class$label == 'B',]
cor(data.l1$x1, data.l1$x2)
cor(data.l2$x1, data.l2$x2)
