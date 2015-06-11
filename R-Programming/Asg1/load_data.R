load_data <- function(path, id){
  
  fileNames <- list(length = length(id))
  
  for(i in id){
    i <- padWithZeros(i, 3, lOrR="L")    
    fileName <- paste(path, "/", i, ".csv", sep="")

    if(!exists("pollutants")){
      pollutants <- read.csv(fileName, header=TRUE)
    }
    
    if(exists("pollutants")){
      temp <- read.csv(fileName, header=TRUE)
      pollutants <- rbind(pollutants, temp)
      rm(temp)
    }
  }
  pollutants
}