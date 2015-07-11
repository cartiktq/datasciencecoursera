complete <-function(directory, ids = 1:332){
  
  parentDir <- "/Users/cartik/Desktop"
  len <- length(ids)
  directory <- paste(parentDir, directory, sep="/")
  id <- numeric(len)
  nobs <- numeric(len)
  j <- 1
  
  for(i in ids){
    paddedI <- padWithZeros(i, 3, lOrR="L")
    fileName <- paste(directory, "/", paddedI, ".csv", sep="")
    
    data <- read.csv(fileName, header=TRUE)
    
    completeData <- na.omit(data)
    id[j] <- i
    nobs[j] <- nrow(completeData)
    j <- j + 1
  }
  output <- data.frame(id, nobs, stringsAsFactors=FALSE)
  output
}