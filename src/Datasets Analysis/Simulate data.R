# Generations of data for the classification problem
classificationSample <- function(features=2, n=100){
  classes <- 2
  data <- NULL
  data.names <- NULL
  
  # Generate data, normal distribution
  for(i in 1:features){
    fname <- paste("f", i, sep = '')
    data.names <- c(data.names, fname)
    data <- cbind(data, rnorm(n, 0, 5))
  }
  data <- data.frame(data)
  names(data) <- data.names
  
  data$labels <- factor(ifelse(data$f1 + data$f2 < 0, 1, 2))
  
  # Introduce some variation
  idxs <- sample(1:100, 10)
  data$labels[idxs] <- ifelse(data$labels[idxs] == 1, 2, 1)
  
  return(data)
}
