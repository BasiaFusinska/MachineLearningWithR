library(caret)

# Standarise data
stand.par <- preProcess(data.class[,1:2])
# Same as:
# stand.par <- preProcess(data.class[,1:2], method=c("center", "scale"))

data.stand <- predict(stand.par, data.class[,1:2])
summary(data.stand)

# Normalise data
norm.par <- preProcess(data.class[,1:2], method=c("range"))
data.norm <- predict(norm.par, data.class[,1:2])
summary(data.norm)

# Dimentionality reduction
five.dim <- classificationSample(5)
summary(five.dim)

pca.par <- preProcess(five.dim[,1:5], method=c("pca"), pcaComp = 2)
data.pca <- predict(pca.par, five.dim[,1:5])
summary(data.pca)
