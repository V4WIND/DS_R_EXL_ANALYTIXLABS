# create a matrix of 10 rows x 2 columns
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)
# mean of the rows
apply(m, 1, mean)

# mean of the columns
ColMean <- apply(m, 2, mean)

# divide all values by 2
apply(m, 1:2, function(x) x/2)


#--------------------------------------------------------------------

attach(iris)
head(iris)

by(iris[, 1:4], Species, colMeans)

# ---------------------------------------------------------------------
#   eapply
# Description: eapply applies FUN to the named values from an environment and returns the results as a list.”
# a new environment
e <- new.env()
# two environment variables, a and b
e$a <- 1:10
e$b <- 11:20
# mean of the variables
eapply(e, mean)

# -----------------------------------------------------------------------
#   lapply
# Description: lapply returns a list of the same length as X, each element of which is 
# the result of applying FUN to the corresponding element of X.”
# create a list with 2 elements
MyList <- list(Var = x,Vector = v1,datafr = stores,matrix = m)


l <- list(a = 1:10, b = 11:20)
# the mean of the values in each element
lapply(MyList, mean)


meanFromlapply<-lapply(l, mean)
class(meanFromlapply)
mean(l)
# --------------------------------------------------------------------------
#   sapply
# Description: “sapply is a user-friendly version of lapply by default returning a 
# vector or matrix if appropriate.”
# 

# create a list with 2 elements
l <- list(a = 1:10, b = 11:20)
# mean of values using sapply
l.mean <- sapply(l, mean)
# what type of object was returned?
class(l.mean)
# it's a numeric vector, so we can get element "a" like this
l.mean[['a']]

# ----------------------------------------------------------------------------
#   vapply
# Description: “vapply is similar to sapply, but has a pre-specified 
# type of return value, so it can be safer (and sometimes faster) to use.”

l <- list(a = 1:10, b = 11:20)
# fivenum of values using vapply
lFiveNum <- vapply(l, fivenum, c(Minimum.=0, "1st Qu."=0, Median=0, "3rd Qu."=0, Max.=0))
sfivenum <- sapply(l, fivenum)

class(l.fivenum)
# [1] "matrix"
# let's see it
l.fivenum


# 
# =---------------------------------------------------------------------------------
#   mapply
# Description: “mapply is a multivariate version of sapply. mapply applies FUN to the first elements of each (…) argument, the second elements, the third elements, and so on.”
l1 <- list(a = c(1:10), b = c(11:20))
l2 <- list(c = c(21:30), d = c(31:40))
# sum the corresponding elements of l1 and l2
mapply(sum, l1$a, l1$b, l2$c, l2$d)


# ------------------------------------------------------------------------------------
#   rapply
# Description: “rapply is a recursive version of lapply.”

# let's start with our usual simple list example
l <- list(a = 1:10, b = 11:20)
# sum of each value in the list
rapply(l, sum)
rapply(l, sum, how = "list")

# what if the function is the mean?
rapply(l, mean)


rapply(l, mean, how = "list")






# ----------------------------------------------------------------------------------
#   tapply
# Description: “Apply a function to each cell of a ragged array, 
#that is to each (non-empty) group of values given by a 
#unique combination of the levels of certain factors.”
# 

attach(iris)
# mean petal length by species
tapply(iris$Petal.Length, Species, mean)

