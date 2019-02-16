#----------------------------------------
# 9. Merging

View(demographic)
View(txn)

InnerJoin <- merge(x = demographic, 
                   y = txn,
                   by.x = c("CustName"),
                   by.y = c("CustomerName"),
                   all = FALSE
                   )

OuterJoin <- merge(x = demographic, 
                   y = txn,
                   by.x = c("CustName"),
                   by.y = c("CustomerName"),
                   all = TRUE
)

LeftJoin <- merge(x = demographic, 
                   y = txn,
                   by.x = c("CustName"),
                   by.y = c("CustomerName"),
                  all.x = TRUE
                   
)

RightJoin <- merge(x = demographic, 
                  y = txn,
                  by.x = c("CustName"),
                  by.y = c("CustomerName"),
                  all.y = TRUE
                  
)


# 10. Group By

# categorical 
# continious

sum(stores$TotalSales)


library(dplyr)

# group_by()
# summarize()

stores$Location <- factor(stores$Location, labels = c("Chennai","Delhi","Kolkata","Mumbai"))

t = dplyr::group_by(stores, Location)
Result = dplyr::summarize(t,SumOfTotalSales = sum(TotalSales))

# The pipe operator of dplyr ( %>% )

Res = stores %>% dplyr::group_by(Location) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales))



# Task : Calculate SumOfTotalSales wrt Location and StoreType

t = dplyr::group_by(stores, Location, StoreType)
Result = dplyr::summarize(t,SumOfTotalSales = sum(TotalSales))

Res = stores %>% dplyr::group_by(Location, StoreType) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales))

# Task : Calc SumOfTotalSales and MeanOfOperatingCost wrt Location

Res_2 = stores %>% dplyr::group_by(Location) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales),
                   MeanOfOperatingCOst = mean(OperatingCost))
# Ctrt Shift M


# 11. Reshaping Data
require(reshape2)
{
  Res_wide <- dcast(Res, Location ~ StoreType)
  
  Res_long <- melt(Res_wide, id.vars = "Location",variable.name = "",value.name = )
}

# Long to wide
Res_wide <- reshape2::dcast(Res, Location ~ StoreType)

Res_2 = stores %>% dplyr::group_by(Location,StoreType,StoreName) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales))


Res_2_wide <- reshape2::dcast(Res_2, Location ~ StoreType + StoreName)


Res_2 = stores %>% dplyr::group_by(Location,StoreType,StoreName) %>% 
  dplyr::summarize(SumOfTotalSales = sum(TotalSales)))

Res_2_wide <- reshape2::dcast(Res_2, Location + StoreType ~ StoreName)


# Wide to Long
# melt()

Res_long <- reshape2::melt(Res_wide, 
     id.vars = "Location",
     value.name = "Sum_Of_TotalSales",
     variable.name = "StoreType") # measure.vars = 


#----------------------------------------

#----------------------------------------
# Programming Features
#----------------------------------------

# 1. conditional statments

x <- -10
# pos neg
ifelse(x > 0, "positive","negative")
ifelse(x == 0, "zero",ifelse(x > 0,"pos","neg"))

if(x > 0){
  print("pos")
}else {
  print("neg")
}

if(x == 0){
  print("zero")
}else if(x > 0){
  print("pos")
}else {
  print("neg")
}

v2
ifelse(v2 == 0, "zero",ifelse(v2 > 0,"pos","neg"))

if(v2 == 0){
  print("zero")
}else if(v2 > 0){
  print("pos")
}else {
  print("neg")
}

# 2, Loops


# Ranged Loop

# for(i = 0;i < 10; i += 1)

# for loop is a loop/iteration on a vector of start and end
# 1 to 10
# 1:10
# seq(1,10)



# for(i in a vector){
#   
# }

for(i in seq(1,10)){
  print(i*3)
}


for(i in 1:10){
  print(i*3)
}


for(i in seq(0,100,10)){
  print(i)
}

# Conditional Loop - loop till a condition is satisfied

x = 20

while(TRUE){
  print(x)
  x = x - 1
}


# 3. Creating function

# Take two numbers as input and calculate sum

MySum <- function(num1,num2){
  res = num1 + num2
  return(res) 
  # 1. there can be only 1 return statemnt
  # 2. A return function can return only 1 object
}

MySum(10,20)
MySum(num1 = 10,num2 = 20)

# One vaiable numerical statistics

var_summary <- function(x){
  n <- length(x)
  nmiss <- sum(is.na(x))
  Sum <- sum(x,na.rm = TRUE)
  Avg <- mean(x,na.rm = TRUE)
  Median <- median(x,na.rm = TRUE)
  StdDev <- sd(x,na.rm = TRUE)
  Var <- var(x,na.rm = TRUE)
  Min <- min(x,na.rm = TRUE)
  Max <- max(x,na.rm = TRUE)
  
  
  Res <- c(n = n, 
           missing = nmiss,
           Mininum = Min,
           Total = Sum,
           Mean = Avg,
           Median = Median,
           StdDev = StdDev,
           Variance = Var,
           Maximum = Max)
  
  return(Res)
  
}

var_summary(v1)

var_summary(stores$TotalSales)
var_summary(stores$AcqCostPercust)


# Task - apply the function var_summary to all the numeric columns of 
# stores

storesNum <- stores[,-c(1:4)]
storesNum$Performance <- NULL

stats <- apply(X = storesNum, MARGIN = 2, FUN = var_summary)

stats1 <- t(stats)
stats1 <- as.data.frame(stats1)


# apply(X = , MARGIN = , FUN = )
# MARGIN = where to apply
#           rows       =    1
#           columns    =    2
#           both       =    c(1,2)
# FUN = function name


stats <- sapply(storesNum, FUN = var_summary)


#----------------------------------------


#----------------------------------------
# Misc
#----------------------------------------

# The .RData file
# We can export the entire session into that file
# global env, history, packages that were loaded

# To save the session
# save.image(file = )
# file = "where to store it?"
#       filename.RData
save.image(file = "~/Backup_28Jul.RData")

# To load the .RData
load(file = "~/Backup_28Jul.RData")
#----------------------------------------


#----------------------------------------
# Lists
#----------------------------------------
Location
v1
x = 10
Res1
MyMatrix <- matrix(1:15,5,3)


MyList1 <- list(x,v1,Location,MyMatrix,Res1)

MyList2 <- list(var = x,numVec = v1,
                charVec = Location,
                matrix = MyMatrix,
                data = Res1)

# Accessing elements from a list
# 1 Accessing one element a give time using [[]]
MyList1[[2]]
MyList1[[5]]

MyList2[[3]]
MyList2[["matrix"]]


# 2. Accessing multiple elements into a new list using []
MyList1[c(5,3)]


# 3. For a named list, accessing elements via $ operator
MyList2$charVec



data = MyList2[[5]]
data[4,]
#----------------------------------------

sapply()
# can take any input (vector, df or matrix)
# output can be a vec, matrix or list


lapply()
# can take any input
# output is ALWAYS a list

sapply(storesNum, var_summary)
lapply(storesNum, var_summary)

#----------------------------------------

# Univariate and Bivariate Analysis

#----------------------------------------
stores$TotalSales

library(ggplot2)
# 1. Draw a scatterplot of TotalSales

# generic x,y plotting function
plot(stores$TotalSales,type = "b",
     main = "Distribution of TotalSales in the data",
     xlab = "Index",ylab = "ActualData")

# type = "b","l","p"
# main = main title, xlab and ylab = labels for x and y


ggplot2::qplot(y = TotalSales, data = stores,
               main = "Distribution of TotalSales in the data",
               xlab = "Index",ylab = "ActualData")


# 2. Two variable scatterplot

OC <- stores$OperatingCost
TS <- stores$TotalSales

plot(x = OC, y = TS,
     main = "Correlation of TotalSales with OperatingCost",
     xlab = "Operating Cost/Expenses",
     ylab = "Total Sales or Income")


#---------------
# 1. get the canvas
# 2. add axes and scale it
# 3. draw the actual geometry - geom_xxxxx()
#     bar                 geom_bar()
#     line                geom_line()
#     point               geom_point()
#     area                geom_area()
#     pie 
#     histogram           geom_histogram()
#     boxplot             geom_boxplot()
# 4. Add labels etc
# 5. Add more geometries


ggplot(data = stores) + 
  aes(x = OperatingCost, y = TotalSales) + 
  geom_point() + ggtitle("Correlation between OC and TS") +
  xlab("Operating Cost") + ylab("Total Sales")
  
# 3. Two variable scatterplot - more features

# 3.1 Change the color of the graph
Plot1 <- ggplot(data = stores) + aes(x = OperatingCost, y = TotalSales)
Plot1 <- Plot1 + geom_point(color = "blue")
plot(Plot1)

# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf


# 3.2 Add a new variable as color
Plot2 <- ggplot(data = stores) + aes(x = OperatingCost, 
                                     y = TotalSales, 
                                     color = Location)
Plot2 <- Plot2 + geom_point()
plot(Plot2)


# 4. Draw a bar chart.

# 4.1 Bar graph between Location wise SumOfTotalSales

Res <- stores %>% 
  dplyr::group_by(Location) %>% 
  dplyr::summarise(SumOfTotalSales = sum(TotalSales))

Bar1 <- ggplot(data = Res) + aes(x = Location, y = SumOfTotalSales)
Bar1 <- Bar1 + geom_bar(stat = "identity", fill = "lightsalmon2",color = "black")
Bar1

# color = "black" -> border
# fill = "blue" -> filling


# 4.2 Adding new variable as color 

Res2 <- stores %>% group_by(Location,StoreType) %>% 
  dplyr::summarise(AvgTotalSales = mean(TotalSales))

Bar_s <- ggplot(data = Res2) + aes(x = Location, y = AvgTotalSales, fill = StoreType) +
  geom_bar(stat = "identity",color = "black")


Bar_d <- ggplot(data = Res2) + aes(x = Location, y = AvgTotalSales, fill = StoreType) +
  geom_bar(stat = "identity",color = "black",position = "dodge")

require(plotly)
plotly::ggplotly(Bar_d)
# a ggplot2 object/list as input

# 4.3 Adding more variables as facets

Res3 <- stores %>% group_by(Location,StoreType,StoreName) %>% 
  dplyr::summarise(AvgTotalSales = mean(TotalSales))

# facets - dividing the graph into sub graphs - vertically or horizaontally

# facet_grid()
# Vertical ~ Horizontal
# which variable should divide the graph vertically (horizontally)
# .~Location
# No vertical (hence, we used the .)
# Location levels are diving the graph horizontally


Bar_f <- ggplot(data = Res3) + aes(x = StoreType, y = AvgTotalSales, fill = StoreName) +
  geom_bar(stat = "identity",color = "black",position = "dodge")
Bar_f <- Bar_f + facet_grid(.~Location)
Bar_f

plotly::ggplotly(Bar_f)


#--------------------------------------------------------------

# Histogram
Data_n <- rnorm(n = 1000,mean = 90,sd = 10)

hist(Data,breaks = 100)

TS
hist(TS,breaks = 10)

Data <- runif(n = 1000,min = 1,max = 6)
hist(Data,breaks = 6)
# r unif

qplot(Data_n,geom = "histogram",bins = 100,fill = "deeppink")


# ggplot cannot take vectors as input
# just convert the vector to a data.frame
ggplot(data = data.frame(Data_n)) + 
  aes(x = as.numeric(Data_n)) + 
  geom_histogram(bins = 100,show.legend = FALSE, fill = "deeppink",color = "black")

#------------------------------------------
# Tasks
#------------------------------------------
# 1. Change the x/y ranges and ticks
# 2. Insert suitable data labels
# 3. For a bar graph, add line chart to the existing bars





Inner_join_d <- dplyr::inner_join(x = demographic,y = txn,
                                  by = c("CustName"="CustomerName"))

ST_counts <- stores %>% group_by(StoreType) %>% summarise(CountST = length(StoreType))
ggplot(data = ST_counts) + aes(x = StoreType, y = CountST) +  geom_bar(stat = "identity")


table(stores$StoreType)
prop.table(table(stores$StoreType))
barplot(table(stores$StoreType))
