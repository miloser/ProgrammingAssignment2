## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## Using the same code as in makeVector function, with new variable name
  inve <- NULL
  set <- function(y) {
    x <<- y
    inve <<- NULL
  }
  get <- function() x
  ## This is where our function differs, instead of a 
  ## mean we're looking for an inverse matrix
  setinve <- function(inverse) inve <<- inverse
  getinve <- function() inve
  list(set = set, get = get,
       setinve = setinve,
       getinve = getinve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inve <- x$getinve()
  if(!is.null(inve)) {
    message("getting cached data")
    return(inve)
  }
  datainve <- x$get()
  ##It took a lot of time to work out the next line :)
  inve <- solve(datainve, ...)
  x$setinv(inve)
  inve
  ## Return a matrix that is the inverse of 'x'
}