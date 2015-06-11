padWithZeros <- function(i, n, lOrR){
  w <- nchar(i)
  while(w < n){
    if(lOrR == "L"){
      i <- paste("0", i, sep="")
    }
    if(lOrR == "R"){
      i <- paste(i, "0", sep="")
    }
    w <- w + 1
  }
  i
}
