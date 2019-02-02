## I imitated what was shown, and edited on the existing functions that:

## 1) gets and sets the matrix

makeCacheMatrix <- function(x = matrix()) {
        
        i <- NULL
        set <- function (y) {
                x <<- y
                i <<- NULL
        }
        
        get <- function() x
        setinv <- function(solve) i <<- solve
        getinv <- function() i 
        list(set = set, get = get,
             setinv = setinv, getinv = getinv)
        
}


## 2) caches the inverse of that matrix using built-in solve function, if not
## done already

cacheSolve <- function(x, ...) {
        
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        data <- x$get()
        i <- solve(data,...)
        x$setinv(i)
        i
        
}