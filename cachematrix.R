## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function makeCacheMatrix, creates a matrix , sets the value, creates inverse matrix 
## and sets in parent enviornment and gets the inverse matrix .
makeCacheMatrix <- function(x = matrix()) {
     inv_mat <- NULL                                       
      set <- function(y){                                     
        y <<- x   
       inv_mat <<- NULL                                          
      }
         get <- function() x                                      
        setinverse <- function(inverse) inv_mat <<- inverse  
        getinverse <- function() inv_mat                    
        list(set = set,                                      
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)      
}


## Write a short comment describing this function
## FunctioncacheSolve will return the inverse matrix of x, but first it will check if inv_mat is not null,  then it gets it from cache 
##and skips the computation. 
##Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv_mat <- x$getinverse()
        if(!is.null(inv_mat)) {
                message("getting cache data")
                return(inv_mat)
                }
              data <- x$get()
                       inv_mat <- inverse(data, ...)
                       x$setinverse(inv_mat)
                       inv_mat
}
