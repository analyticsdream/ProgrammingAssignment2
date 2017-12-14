## Put comments here that give an overall description of what your
## functions do

## This function will create a special matrix, which is really a list containing a function to
## set the value of a matrix 
## get the value of a matrix
## set the value of a inverse matrix 
## get the value of a inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function (y) {
                x <<- y
                m <<- NULL
        }
        
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m 
        list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function will first check if the inverse matrix value is already calacualted
## If so, it will the inverse matrix value from the cache and skip calcualtion. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if (!is.null(m)) {
                message("getting inverse matrix")
                return(m)
                
        }
        
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setinverse(m)
        m
}
