# Get the data for classification problem
myData <- classificationSample()

# Explore the data
dim(myData)
names(myData)

class(myData$labels)
class(myData$f1)
class(myData$f2)

summary(myData)

# Visualise the data
library(ggplot2)

# Univariate plots
ggplot(myData, aes(f1)) + geom_histogram(binwidth = 1)
ggplot(myData, aes(f2)) + geom_histogram(binwidth = 1)

ggplot(myData, aes(f1)) + geom_histogram(binwidth = 1, aes(fill=labels))
ggplot(myData, aes(f2)) + geom_histogram(binwidth = 1, aes(fill=labels))

ggplot(myData, aes(labels, f1)) + geom_boxplot()
ggplot(myData, aes(labels, f2)) + geom_boxplot()

# Bivariate plots
ggplot(myData, aes(f1, f2)) + geom_point(aes(col=labels))

pairs(myData[1:2], pch=21, bg=myData$labels)

# Correlation
cor(myData$f1, myData$f2)

data.l1 <- myData[myData$label == 'A',]
data.l2 <- myData[myData$label == 'B',]
cor(data.l1$f1, data.l1$f2)
cor(data.l2$f1, data.l2$f2)
