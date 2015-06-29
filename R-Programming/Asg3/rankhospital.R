outcome <<- read.csv("outcome-of-care-measures.csv", colClasses="character")
stateCodes <<- sort(unique(outcome[,7])) 
conditions <<- c("heart attack", "heart failure", "pneumonia")

checkValidity <- function(stateCode,condition){
  if(!stateCode %in% stateCodes) stop("invalid state")
  if(!condition %in% conditions) stop("invalid outcome")
  return
}

rankhospital <- function(stateCode, condition="heart attack", rank="best"){
  checkValidity(stateCode, condition)
  hospitalInfo <- 
    outcome[(outcome[,7] == stateCode), ]
  hospitals <- hospitalInfo[,2]
  
  if(condition == "heart attack"){
    counts <- hospitalInfo[,11]
  }
  else if(condition == "heart failure"){
    counts <- hospitalInfo[,17]
  }
  else{
    counts <- hospitalInfo[,23]
  }
  
  allHospitals <- cbind(counts, hospitals)
  validHospitals <- allHospitals[counts != "Not Available",]
  vhdf <- data.frame(as.numeric(validHospitals[,1]), validHospitals[,2]) 
  sortedHospitals <- vhdf[order(vhdf[,1],vhdf[,2]),]  
  if(rank == "worst"){
    as.character(sortedHospitals[nrow(sortedHospitals),2])
  } else if(rank == "best"){
    as.character(sortedHospitals[1,2])
  } 
  else {
    as.character(sortedHospitals[rank,2])
  }
}