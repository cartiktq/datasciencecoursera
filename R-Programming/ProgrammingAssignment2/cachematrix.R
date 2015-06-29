## Put comments here that give an overall description of what your
## functions do

## Takes a matrix and returns a list of functions that
## can set and get the matrix and its inverses

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
      x <<- y
      inv <<- NULL
    }
    
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function returns the inverse of a matrix. It first checks to see 
## if an inverse has already been computed and cached. If it founds a cached
## value for the inverse of the input matrix, it returns the cahced value. 
## Otherwise, it computes
## the inverse for the input matrix and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)){
          message("getting cached data")
          return(m)
        }
        cm <- x$get()
        inverse <- solve(cm) 
        x$setinv(inverse)
        inverse
}