#--------------------------------------------------------------------------
# R Tool based concepts and Programming Constructs
#--------------------------------------------------------------------------
#-----------------------------------------
# Working Directory
#-----------------------------------------
# ~ My Documents/Documents default Home

# Set a folder as a temp working dir
getwd()
# [1] "C:/Users/admin/Documents"

setwd("C:\\Users\\admin/Documents/DataSets/")

#-----------------------------------------

#-----------------------------------------
# Saving the Global Environment
#-----------------------------------------
# Workspace image - *.RData

save.image(file = "~/DataSets/27May2018.RData")

load(file = "~/DataSets/27May2018.RData")
#-----------------------------------------

#-----------------------------------------
# Conditionals
#-----------------------------------------
 
#if() .. else
# ifelse()

x = -10
# check if x is positive or negative

if(x > 0){
  print("pos")
} else {
  print("neg")
}

# check if x is positive or negative or zero

if(x == 0){
  print("zero")
}else if(x > 0){
  print("pos")
}else{
  print("neg")
}


ifelse(x == 0,"zero",ifelse(x > 0,"pos","neg"))

v1 <- c(-12,0,34,-56,65,45,54,-33,21,78,99,10,0,-1)

# A normal if then else cannot iterate automatically through a vector!!
if(v1 == 0){
  print("zero")
}else if(v1 > 0){
  print("pos")
}else{
  print("neg")
}


# ifelse is VECTORIZED
# It can automatically loop through the vectors!
ifelse(v1 == 0,"zero",ifelse(v1 > 0,"pos","neg"))

#-----------------------------------------

#-----------------------------------------
# Loops
#-----------------------------------------
# 1. Conditional Loops
# 2. Ranged Loops

# 1. Loops that continue execution till a condition is satisfied

# while (condition) {
#   
# }

x = 1
while(x <= 10){
  r = paste(x," ",x * 5)
  print(r)
  x = x + 1
}

# 2. Loops that run within a range of numbers
# for loop
seq(1,10)

# for(i = 1;i <= 10;i += 1) # in C/C++/Java

for (i in seq(1,10)) {
  print(i)
}

for (i in seq(1,20,2)) {
  print(i)
}
#-----------------------------------------

#-----------------------------------------
# User Defined Functions
#-----------------------------------------

# Process by which we create our own functions
v2 <- c(-12,0,10,11,22,99,101,34,-56,65,45,54,-33,21,78,99,10,0,-1)

# create a function to calculate the descriptive stats
# name <- function(variables) {
#   
# }

# return()?
# There should be only one return() in a function
# A return() statement can return only one object

# Named Vector
v5 <- c(Maths = 81, Phy = 83,Che = 88,Eng = 77,Eco = 86)
v5[3]
v5["Che"]

MyStats <- function(x){
  if(is.numeric(x)){
    n = length(x)
    nmiss = sum(is.na(x))
    Min <- min(x, na.rm = T)
    Sum = sum(x, na.rm = T)
    Avg = mean(x, na.rm = T)
    StdDev = sd(x, na.rm = T)
    Variance = var(x, na.rm = T)
    Max <- max(x, na.rm = T)
    
    Result <- c(N = n,
                NMiss = nmiss,
                Min = Min,
                Sum = Sum,
                Avg = Avg,
                SD = StdDev,
                Var = Variance,
                Max = Max)
    # return(Sum,Mean,StdDev) # incorrect
    return(Result)
  }else {
    Result <- c(N = NA,
                NMiss = NA,
                Min = NA,
                Sum = NA,
                Avg = NA,
                SD = NA,
                Var = NA,
                Max = NA)
    return(Result)
  }
}

v2

MyStats(v2)

stores[,5:15] -> storesNum

MyStats(storesNum$OperatingCost)
MyStats(storesNum$Staff_Cnt)
MyStats(storesNum$TotalSales)

#-----------------------------------------


#-----------------------------------------
# Apply Functions
#-----------------------------------------

# Apply apply() -> call a function on a table's row or columns or both
# apply() can be also used to call a function on a group of vectors
# apply(X = , MARGIN = ,FUN =  )
# X = matrix/data.frame
# MARGIN = Row = 1
#          Column = 2
#          Both = c(1,2)
# FUN = function Name MyStats       
#       [just the name, not the fucntion call MyStats()]

Stats <- apply(stores[,5:15],MARGIN = 2,FUN = MyStats)

# The combo of function and apply() is the fundamental way of
# getting univariate stats

# For categorical variable
freq <- table(stores$StoreType)
prop <- prop.table(freq)
#-----------------------------------------
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# Visualizations in R
#--------------------------------------------------------------------------
#-----------------------------------------
# The plot function
#-----------------------------------------
v1
plot(v1)

plot(v1,
     main = "My First Graph",
     xlab = "Index/Positions of v1",
     ylab = "The actual values in v1",
     type = "b" # p -> points, l -> line, b -> both 
     )
#-----------------------------------------

#-----------------------------------------
# grammar of graphics - ggplot2
#-----------------------------------------
require(ggplot2)

# A simple X -Y plot using qplot
stores$TotalSales
stores$OperatingCost

plot(x = stores$OperatingCost, y = stores$TotalSales,
     main = "Income vs Expenses \n Stores Data Set",
     xlab = "Operating Cost or Expenses",
     ylab = "TotalSales or Income",)

ggplot2::qplot(x = stores$OperatingCost, y = stores$TotalSales)

#*****************************************
# Task
# Add x and y labels, main title to qplot
#*****************************************
#-----------------------------------------

#-----------------------------------------
# The ggplot() function
#-----------------------------------------
# Empty canvas
# Draw the axes - set the ticks
# Draw the main graph
# Draw the sub graphs
# Add titles and lables
# Others

# Task - to draw a scatterplot using TotalSales and OperatingCost
# 1. Empty canvas
Plot1 <- ggplot2::ggplot(data = stores)

# 2. Draw the axes - set the ticks and add it to Plot1
Plot1 <- Plot1 + aes(x = OperatingCost,y = TotalSales)
Plot1

# Geometry or geom_xxxxxx()
# Bar               geom_bar()
# Hist              geom_hist()
# Boxplot           geom_boxplot()
# Area              geom_area()
# Line              geom_line()
# Scatter           geom_point()

# 3. Draw the main graph
# We should add the geometry to the plot

Plot1 <- Plot1 + geom_point()
Plot1

Plot1 <- Plot1 + geom_point(color = "deeppink")
Plot1

# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# Draw the sub graphs

# Add titles and lables
Plot1 <- Plot1 + ggtitle("Income vs Expenses \n Stores Data Set") + xlab("Operating Cost") + ylab("TotalSales")

Plot1
# Others

# Adding colors - changing the physical color of the geom_xxxx()
# color = "" for scatter/line
# fill = "" for barcharts/area/hist

# Task : Add a new Varaible as colors
# We'll add a categorical var adn the levels will appear as colors
# StoreType to the graph

# We'll use aes() to add StoreType as the visual aesthetic
# color = StoreType

Plot2 <- ggplot(data = stores)
Plot2 <- Plot2 + aes(x = OperatingCost, y = TotalSales, color = StoreType)
Plot2 <- Plot2 + geom_point()
Plot2

# Task : Draw a bar chart - between 2 variables

Result <- stores %>% dplyr::group_by(Location) %>% 
  dplyr::summarise(SumOfTotalSales = sum(TotalSales))

Bar1 <- ggplot(data = Result)
Bar1 <- Bar1 + aes(x = Location, y = SumOfTotalSales)
Bar1 <- Bar1 + geom_bar(stat = "identity",fill = "skyblue")
# geom_bar() by default creates a histogram stat = "count"
# We need to over-rite it using stat = "identity"
Bar1


# Task : Draw a bar chart - between 3 variables
Result <- stores %>% dplyr::group_by(Location, StoreType) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales))

Bar2 <- ggplot(data = Result)

Bar2 <- ggplot(data = Result)
Bar2 <- Bar2 + aes(x = Location, y = SumOfTotalSales, fill = StoreType)
Bar2 <- Bar2 + geom_bar(stat = "identity")
Bar2

Bar3 <- ggplot(data = Result)
Bar3 <- Bar3 + aes(x = Location, y = SumOfTotalSales, fill = StoreType)
Bar3 <- Bar3 + geom_bar(stat = "identity", position = "dodge")
Bar3


Bar4 <- ggplot(data = Result)
Bar4 <- Bar4 + aes(x = Location, y = SumOfTotalSales)
Bar4 <- Bar4 + geom_bar(stat = "identity", fill = "deepskyblue")
Bar4 <- Bar4 + facet_grid(.~StoreType)
# horizontal ~ vertical
# hor
# ver
# both
# .~StoreType
Bar4

# Complete Assignment 1
# Revise all graphs of ggplot2
# 


#-----------------------------------------
#--------------------------------------------------------------------------