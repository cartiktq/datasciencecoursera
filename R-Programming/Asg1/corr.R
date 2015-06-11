corr <- function(dir, threshold=0){
  
  parentDir <- "/Users/cartik/Desktop"
  directory <- paste(parentDir, dir, sep="/")
  
  files <- list.files(directory, full.names=TRUE)
  
  cr <- NULL
  
  for(file in files){
    data <- read.csv(file, header=TRUE)
    completeData <- na.omit(data)
    if(nrow(completeData) > threshold){
          nitrates <- completeData[,3]
          sulfates <- completeData[,2]
          cr <- c(cr, cor(sulfates, nitrates))
    }
  }

  cr
}