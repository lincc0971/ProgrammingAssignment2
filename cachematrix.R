## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #step 1: initialize, inverse_m: it means inverse matrix 
  inverse_m <- NULL
  #step 2: create object 'methods'
  #
  set <- function(y) {
    x <<- y
    inverse_m <<- NULL
  }
  #get: catch input x
  get <- function() x
  #setinverse: set "sol" to inverse_m
  setinverse <- function(sol) inverse_m <<- sol
  #getinverse: return inverse_m
  getinverse <- function() inverse_m
  #list of internal functions(methods)
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve<- function(x, ...) {
  #step 1: check and get inverse matrix from makeCacheMatrix$getinverse
  inverse_m <- x$getinverse()
  #step 2: check that inverse matrix is null or not
  #if existed, do not calculate and return inverse matrix
  #stop here
  if(!is.null(inverse_m)) {
    message("getting cached data")
    return(inverse_m)
  }
  #if not existed, use makeCacheMatrix$get to catch data  
  data <- x$get()
  #step 3: caculate inverse matrix of data
  inverse_m <- solve(data, ...)
  #step 4: use makeCacheMatrix$setinverse to store the result
  #Therefor, we could catch data next time.
  x$setinverse(inverse_m)
  #step 5: return result
  inverse_m
}
