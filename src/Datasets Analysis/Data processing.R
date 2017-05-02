library(caret)

# Standarise data
stand.par <- preProcess(myData[,1:2])
# Same as:
# stand.par <- preProcess(myData[,1:2], method=c("center", "scale"))

data.stand <- predict(stand.par, myData[,1:2])
summary(data.stand)

# Normalise data
norm.par <- preProcess(myData[,1:2], method=c("range"))
data.norm <- predict(norm.par, myData[,1:2])
summary(data.norm)

# Dimentionality reduction
fiveDimData <- classificationSample(5)
summary(fiveDimData)

pca.par <- preProcess(fiveDimData[,1:5], method=c("pca"), pcaComp = 2)
data.pca <- predict(pca.par, fiveDimData[,1:5])
summary(data.pca)

