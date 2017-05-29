# Given the information you've gathered when exploring Prestige dataset 
# you should have pretty good idea about the features.
# Your task is now to perform linear regression and evaluate your algorithm.
# Experiment with the lm formula, check relevant statistics and plots:
# - Include all numeric features
# - Use function for the variables that have other than linear relation with the prestige 
# - Include and check what happens when you add categorical feature
# - Try combining the features or conditional features (use multiplication in the formula)

# All numerical data
# Looks like women is the feature that is not significant (0.77 > 0.05).
# F-statistic (3, 98): 129.2
# R-squared: 0.7982
# Adjusted R-squared: 0.792
# RMSE: 7.846
# p-value: < 2.2e-16
all.model <- lm(prestige ~ education + income + women, prestige)
summary(all.model)
anova(all.model)

par(mfrow=c(2,2))
plot(all.model)
par(mfrow=c(1,1))

# All numerical data & log2(income)
# Looks like the error is smaller, but 
# women is the feature that is still not significant (0.12 > 0.05).
# F-statistic (3, 98): 165.4
# R-squared: 0.8351
# Adjusted R-squared: 0.83
# RMSE: 7.093
# p-value: < 2.2e-16
all.logi.model <- lm(prestige ~ education + log2(income) + women, prestige)
summary(all.logi.model)
anova(all.logi.model)

par(mfrow=c(2,2))
plot(all.logi.model)
par(mfrow=c(1,1))


# Only relevant features
# All the features are relevant now but the error is higher.
# F-statistic (2, 99): 243.3
# R-squared: 0.831
# Adjusted R-squared: 0.8275
# RMSE: 7.145
# p-value: < 2.2e-16
rel.num.model <- lm(prestige ~ education + log2(income), prestige)
summary(rel.num.model)
anova(rel.num.model)

# Added categorical value (type) to the formula
# The model created dummy values: typeprof, typewc
# Also missing values were deleted
# F-statistic (4, 93): 137.6
# R-squared: 0.8555
# Adjusted R-squared: 0.8493
# RMSE: 6.637
# p-value: < 2.2e-16
cat.model <- lm(prestige ~ education + log2(income) + type, prestige)
summary(cat.model)
anova(cat.model)

# Added categorical value (type) to the formula
# The model created dummy values: 
# typeprof, typewc, typeprof:education, 
# typewc:education, typeprof:log2(income), typewc:log2(income)
# F-statistic (8, 89): 75.15
# R-squared: 0.871
# Adjusted R-squared: 0.8595
# RMSE: 6.409
# p-value: < 2.2e-16
mul.model <- lm(prestige ~ type*(education + log2(income)), prestige)
summary(mul.model)
anova(mul.model)

par(mfrow=c(2,2))
plot(mul.model)
par(mfrow=c(1,1))

# Other ways to run the same model
mul2.model <- lm(prestige ~ education*type + log2(income)*type, prestige)
summary(mul2.model)
anova(mul2.model)

mul3.model <- lm(prestige ~ education + log2(income) + type + log2(income):type + education:type, prestige)
summary(mul3.model)
anova(mul3.model)

# Education vs prestige
edu.pres.fit <- lm(prestige ~ education, prestige)
summary(edu.pres.fit)

library(ggplot2)
ggplot(prestige, aes(education, prestige)) +
  geom_point(aes(col=type)) +
  geom_abline(slope=edu.pres.fit$coefficients[2], intercept = edu.pres.fit$coefficients[1])

# Education:type
edu.type.fit <- lm(prestige ~ type*education, prestige)
summary(edu.type.fit)

ggplot(prestige, aes(education, prestige)) +
  geom_point(aes(col=type)) +
  geom_abline(slope=edu.type.fit$coefficients[4], intercept = edu.type.fit$coefficients[1], colour='red') +
  geom_abline(slope=edu.type.fit$coefficients[4] + edu.type.fit$coefficients[5], intercept = edu.type.fit$coefficients[1] + edu.type.fit$coefficients[2], colour='green') +
  geom_abline(slope=edu.type.fit$coefficients[4] + edu.type.fit$coefficients[6], intercept = edu.type.fit$coefficients[1] + edu.type.fit$coefficients[3], colour='blue')
