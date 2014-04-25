# Matrix inverse caching function

# Function is intended to cache inverse of a matrix rather than 
# continually computing it to potentially improve performance.

## First a proxy function for inverse-caching of matrices

makeCacheMatrix = function(x = matrix()) {
  inv = NULL
  set = function(y) {
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setInv = function(inv) inv <<- inv
  getInv = function() inv
  proxy = list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
  attr(proxy, "type") = "cachedMatrix"
  proxy
}


## Function finds inverse of matrix, using cached 
## version if available to improve performance

cacheSolve = function(x) {

  # make sure we're only solving our cacheMatrix object from makeCacheMatrix()
  if(!class(x)=="list" || !attr(x, "type")=="cachedMatrix")
    stop("Please use makeCacheMatrix to create solveable object")
  
  inv = x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data = x$get()
  inv = solve(data)
  x$setInv(inv)
  inv
}
