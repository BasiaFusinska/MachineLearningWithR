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

# Univariate plots
ggplot(myData, aes(f1)) + geom_histogram(binwidth = 1)
ggplot(myData, aes(f2)) + geom_histogram(binwidth = 1)

ggplot(myData, aes(f1)) + geom_histogram(binwidth = 1, aes(fill=labels))
ggplot(myData, aes(f2)) + geom_histogram(binwidth = 1, aes(fill=labels))

ggplot(myData, aes(labels, f1)) + geom_boxplot()
ggplot(myData, aes(labels, f2)) + geom_boxplot()

# Bivariate plots
ggplot(myData, aes(f1, f2)) + geom_point(aes(col=labels))
