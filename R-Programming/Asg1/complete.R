complete <-function(directory, id = 1:332){
  
  parentDir <- "/Users/cartik/Desktop"
  
  directory <- paste(parentDir, directory, sep="/")
  output <- c("id", "nobs")
  
  for(i in id){
    paddedI <- padWithZeros(i, 3, lOrR="L")
    fileName <- paste(directory, "/", paddedI, ".csv", sep="")
    
    data <- read.csv(fileName, header=TRUE)
    
    completeData <- na.omit(data)

    output <- rbind(output, c(i, nrow(completeData)))
   
  }
  output
}