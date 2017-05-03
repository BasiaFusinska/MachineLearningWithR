# Generations of data for the classification problem
classificationSample <- function(features=2, n=100){
  classes <- 2
  data <- NULL
  data.names <- NULL
  
  # Generate data, normal distribution
  for(i in 1:features){
    fname <- paste("x", i, sep = '')
    data.names <- c(data.names, fname)
    data <- cbind(data, rnorm(n, 0, 5))
  }
  data <- data.frame(data)
  names(data) <- data.names

  f.sums <- rowSums(data)
  data$labels <- factor(ifelse(f.sums < 0, 'A', 'B'))

  # Introduce some variation
  idxs <- sample(1:100, 10)
  data$labels[idxs] <- ifelse(data$labels[idxs] == 1, 'B', 'A')
  
  return(data)
}

# Generations of data for the regression problem
regressionSample <- function(features=2, n=100){
  data <- NULL
  data.names <- NULL
  a <- 0.5
  
  # Generate data, normal distribution
  for(i in 1:(features-1)){
    fname <- paste("x", i, sep = '')
    data.names <- c(data.names, fname)
    
    data <- cbind(data, runif(n, 0, 10))
  }
  data.names <- c(data.names, 'y')
  
  y <- runif(n, -2, 2)
  
  for(i in 1:(features-1)){
    y <- y + a * data[,i]
  }
  
  data <- cbind(data, y)
  data <- data.frame(data)
  names(data) <- data.names
  
  return(data)
}

# Generations of data for the regression problem
clusteringSample <- function(features=2, n=120, k=3){
  data <- NULL
  data.names <- NULL

  div <- 20/(k+1)
  c.values <- NULL
  for(i in 1:k){
    c.values <- c(c.values, -10 + i*div)
  }
  
  c.label <- sample(1:k, n, replace=TRUE)
  c.cen <- c.values[c.label]
  
  for(i in 1:features){
    fname <- paste("x", i, sep = '')
    data.names <- c(data.names, fname)
    
    data <- cbind(data, rnorm(n, c.cen, 2))
  }
  
  data <- data.frame(data)
  names(data) <- data.names
  
  data$c.label <- factor(c.label, labels=toupper(letters[1:k]))

  return(data)
}
