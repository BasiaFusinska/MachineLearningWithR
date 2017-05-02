library(caret)
library(pROC)

# By default bootstraping is chosen
boot.fit <- train(labels~., data=data.class, method="knn")
boot.fit

# k-fold cross validation (k = 10 by default)
tc.cv <- trainControl(method="cv")
cv.fit <- train(labels~., data=data.class, trControl=tc.cv, method="knn")
cv.fit

# Repeated k-fold cross validation
# Changing the metric from default Accuracy to ROC
tc.rcv <- trainControl(method="repeatedcv", repeats=3, classProbs = TRUE, summaryFunction = twoClassSummary)
rcv.fit <- train(labels~., data=data.class, trControl=tc.rcv, method="knn", metric="ROC")
rcv.fit
