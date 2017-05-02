# Get the data for classification problem
data.reg <- regressionSample()

# Explore the data
dim(data.reg)
names(data.reg)

class(data.reg$x1)
class(data.reg$y)

summary(data.reg)

# Visualise the data
library(ggplot2)

# Univariate plots
ggplot(data.reg, aes(x1)) + geom_histogram(binwidth = .5)
ggplot(data.reg, aes(y)) + geom_histogram(binwidth = .5)

ggplot(data.reg, aes(x='', y=x1)) + geom_boxplot() + xlab('')
ggplot(data.reg, aes(x='', y=y)) + geom_boxplot() + xlab('')

# Bivariate plots
ggplot(data.reg, aes(x1, y)) + geom_point()

pairs(data.reg, pch=21, bg='black')

# Correlation
cor(data.reg$x1, data.reg$y)
