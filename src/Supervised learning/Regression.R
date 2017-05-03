library(caret)

# Split data to train & test

data.partition <- createDataPartition(data.reg$y, p=.75, list=FALSE)

data.train <- data.reg[data.partition,]
data.test <- data.reg[-data.partition,]

# Linear regression model
lm.model <- lm(y ~ x1, data.train)
summary(lm.model)
anova(lm.model)

# Plot train data with the abline
ggplot(data.train, aes(x1, y)) + geom_point()
ggplot(data.train, aes(x1, y)) + geom_point() +
  geom_abline(intercept = lm.model$coefficients[1], slope = lm.model$coefficients[2], col='blue')

# Plot test data with the abline
ggplot(data.test, aes(x1, y)) + geom_point() +
  geom_abline(intercept = lm.model$coefficients[1], slope = lm.model$coefficients[2], col='blue')

par(mfrow=c(2,2))
plot(lm.model)

par(mfrow=c(1,1))

# Predictions for the training and test data
pred.train <- predict(lm.model, data.train)
pred.test <- predict(lm.model, data.test)

# Evaluate the model
library('Metrics')

# Mean Absolute Error
mae(data.train$y, pred.train)

# Mean Square Error
mse(data.train$y, pred.train)

# Root Mean Square Error
rmse(data.train$y, pred.train)

# Relative Squared Error
rse(data.train$y, pred.train)
