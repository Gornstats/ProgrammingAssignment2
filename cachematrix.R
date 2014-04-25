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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
