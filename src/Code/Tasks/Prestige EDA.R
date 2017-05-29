# There is a dataset called Prestige that you can obtain from the library car 
library(car)
# Find out more using help
?Prestige

# Your task is to perform EDA on the dataset so that later you can use it for linear regression problem:
# - Perform descriptive statistics (dimentionality, data types, correlation)
# - Try to understand the data from visualisations (distributions, outliers)
# - Find out the missing data, decide how they could influence your model and try to handle them
# - Try to decide which feature would be significant when predicting the prestige level

# 5 features, 150 examples
dim(Prestige)
names(Prestige)

# Looking at the data
head(Prestige)
tail(Prestige)

# Summary of the data
summary(Prestige)
str(Prestige)

# All features except type are of the type numeric
# Centus should be a factor
# income should be numeric
prestige <- Prestige
prestige$income <- as.numeric(prestige$income)
prestige$census <- factor(prestige$census)

summary(prestige)
str(prestige)

# Histograms
# Looks like Petal features are giving the most information on data separation
# Classes versocolor and virginica are still overlapping
ggplot(prestige, aes(education)) + geom_histogram(binwidth = .3)
ggplot(prestige, aes(income)) + geom_histogram(binwidth = 500)
ggplot(prestige, aes(women)) + geom_histogram(binwidth = 3)
ggplot(prestige, aes(prestige)) + geom_histogram(binwidth = 3)

# Probably census is not the variable we'll be taking into account
ggplot(prestige, aes(census)) + geom_bar()
# Type seems to be a feature that could differentiate the data
ggplot(prestige, aes(type)) + geom_bar()

ggplot(prestige, aes(type, education)) + geom_boxplot()
ggplot(prestige, aes(type, income)) + geom_boxplot()
ggplot(prestige, aes(type, women)) + geom_boxplot()
ggplot(prestige, aes(type, prestige)) + geom_boxplot()

# Plot the bivariate graphs and check the correlation
# Looks like there is a strong correlation between:
# - education - prestige (.85)
# - income - prestige (.71)

pairs(prestige[,-c(5,6)], pch=21, bg=prestige$type)
cor(prestige[,-c(5,6)])

ggplot(prestige, aes(education, prestige)) + geom_point(aes(col=type))
ggplot(prestige, aes(income, prestige)) + geom_point(aes(col=type))

# income - prestige relations looks logarithmical (.74)
ggplot(prestige, aes(log2(income), prestige)) + geom_point(aes(col=type))
cor(log2(prestige$income), prestige$prestige)

