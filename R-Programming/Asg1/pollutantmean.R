pollutantmean <- function(directory, pollutant, id = 1:332){
  #parentDir <- "/Users/cartik/Desktop"  

  directory <- paste(parentDir, directory, sep="/")
  data <- load_data(directory, id)
  
  if(pollutant == "nitrate"){
    #print("Nitrates")
    pollutantVals <- data[,3] 
  } 
  
  if(pollutant == "sulfate"){
    #print("Sulfates")
    pollutantVals <- data[,2]
  }

  meanPollutantVal <- mean(pollutantVals, na.rm=TRUE) 
   
  meanPollutantVal
}

