#***********************************************************
# Level 0
#-----------------------------------------------------------

# A pound character (#) is for comments!
# R has only single line comments

# Shortcut key for all sc?
# Alt + Shift + K
# Run - Ctrl Enter
# Create new  script - Ctrl Shift N
# Clear console - Ctrl L
# Comments - Select lines and Ctrl Shift C

sessionInfo()

# Installing packages

# dplyr - DM
# ggplot2 - Graphs
# plotly - Interactive graphs
# reshape - structure of Data
# sqldf - run SQL in R

install.packages("dplyr")
# download the specified package from the Internet
# along with it, it will also download the dependent packages!

# install multiple packages
# "ggplot2","sqldf" - R will NOT treat it as a single unit or
#  a combination of things

# Use cmbine function c()

install.packages(c("ggplot2","sqldf"))









# Load a package - getting a package to memory - functions are ready to be used
group_by()

library("<package name>") # to load a package
library(dplyr)

require() # is also used to load a package


library(xlsx)


# 1. should be in the source .R file
# 2. Can be written anywhere - but best practise - to write it on the top!



# Unloading - automatic- close the session - unloaded

detach("package:<pack name>") # dependencies will not be unloaded
detach("package:dplyr")

library(sqldf);



# delete a package

remove.packages("dplyr"); # dependencies won't go!


x = 10
y <- 20
100 -> z


10 ^ (1/2)

#-----------------------------------------------------------



#***********************************************************
# Level 1 - Datatypes
#-----------------------------------------------------------

# Numbers
# 

n1 <- 100
n2 <- 12.4
n3 <- 3+5i

# integers
# which don't have decimal part
# -2147483647 to +2147483648
# should be a return value from some function


class(n1) # returns the datatype of an object
class(n3)

# Textual data

c1 <- "R language"
c2 <- "DSSR Jan Batch"
c3 <- "A"

c4 <- 'C'
c5 <- "This is a 'character' value"
print(c5)


class(c3)
class(c4)


# Logical/Boolean
# 

5 > 2
3 == 2 # R is not SAS!
4 != 4

(5 > 2) & (3 < 2)
TRUE & FALSE

(5 > 2) | (3 < 2)
TRUE | FALSE

# conversions

# Numbers to other types

n1

as.character(n1) # is not saving the changes
class(n1)

n1 <- as.character(n1)
class(n1)

n1
n2

log_n1 <- as.logical(n1)
log_n1
as.logical(n2)
as.logical(0)


# character

# char to numeric
c1
as.numeric(c1)

c4 <- "123.4"
class(c4)
as.numeric(c4)


c2
as.logical(c2)

c5 <- "TRUE"

l1 <- as.logical(c5)
class(l1)

c6 <- "True"
as.logical(c6)

c7 <- "T"
as.logical(c7)

c8 <- "tRUe"
as.logical(c8)

c9 <- "true"
as.logical(c9)


# logical
# 
l2 <- FALSE
l3 <- TRUE

as.numeric(l2)
as.numeric(l3)

as.character(l2) # lose it's boolean properties


n1
ln1 <- as.logical(n1)
as.numeric(ln1)


# Dates

# 1. How dates are stored
# 2. How dates are represented by default
# 3. How to handle dates when we import data
# 4. How to display/report dates in a required format

TodaysDate <- Sys.Date()
class(TodaysDate)

as.numeric(TodaysDate)

# Number of days from 1st jaunay 1960 - SAS
# R is not SAS
# Number of days from 1st jaunay 1970 - R


print(TodaysDate)
# YYYY-MM-DD - unambigious string format
# If I have a Date object, IT IS ALWAYS REPRESENTED AS YYYY-MM-DD


#----------
# 05MAR2017
# How it is handled when we import?
# All dates are imported as characters
# Primary Task - convert them to Date type

date1 <- "05MAR2017"
date2 <- "2017-03-05"  # default R format
date3 <- "03/05/17"
date4 <- "05-03-2017"
date5 <- "05 March 2017"
date6 <- "Sun, Mar 5 17"



date2_D <- as.Date(date2) 
class(date2_D)

date1_D <- as.Date(date1) # incorrect!!
# R is unable to identify the date components
# Year
# Month
# Date
# Day of the week
# Time(Hours,Min,Sec)


date1_D <- as.Date(date1, format = "%d%b%Y") 
# using this format argument in as.Date function
# we 're conveying the R interpreter about the 
# different components (day,month,year etc) of the date string
date1_D
class(date1_D)

date3 # "03/05/17"

"%m/%d/%y"

#date3_D <- as.Date(date3, format = c("%m%d/%y",))

date4
"%d-%m-%Y"


date5


# Dates prior to 1970

date6 <- "25-Jun-76"

date6_f <- format(as.Date(date6,"%d-%b-%y"),"%d-%b-19%y")
date6_D <- as.Date(date6_f,"%d-%b-%Y")
class(date6_D)
#-----------------------------------------------------------

#***********************************************************
# Level 2 - Datastructures
#-----------------------------------------------------------

#-------------------
# vectors
#-------------------

# one object, storing multiple info
x <- 10 # simple object

# creating vectors

# 1. use c()  

v1 <- c(12,44,55,34,78,99,100,43,23,87,88)

StatsTools <- c("R","SAS","SPSS","Python","Excel")

# 2. creating numeric/Date vectors using sequencing

# the : operator

v2 <- 1:10 # numbers from 1 through 10, incremented by 1
v2

# the seq() function

# Syntax :
# seq(from,to,by)

v3 <- seq(from = 1,to = 10,by = 1) # numbers from 1 to 10, inc by 1

# seq from 1 to 100, incr by 10
v4 <- seq(1,100,10)

# 10,20,30,40,50
v5 <- seq(from = 10, to = 50,by = 10)

# 100,90,80...10
v5 <- seq(from = 100, to = 10, by = -10)

# length.out -> determines the length of the output
seq(from = 1, length.out = 10) # generate numebrs till the len of vector is 10
v6 <- seq(from = 1, by = 5.5, length.out = 100)

# Sampling

# sample(data,size,replacements)

v1
# select 3 num from v1 randomly
sample(v1,size = 3)

# v1, select 5 unique numbers
sample(v1,5,replace = F) # replace set to F

sample(v1,5,replace = T) # values that form the sample data have repeat values

#  extracting columns from a data.frame


# creating default vectors :
# empty vectors

#empty character vector 
c1 <- character(0)
class(c1)
n1 <- numeric(0)

obj1 <- NULL # with no datatype

obj1 = 10



#-------------------

# accessing vectors
v6
v6[29]

# [] -> specify the position that you need
# indexing in R starts from 1

# elements in positions 1,2,3,4

v6[1:4]
v6[c(1,2,3,4)]
v6[seq(1,4,1)]

# elements in all even positions
v6[seq(2,100,2)]
seq(2,100,2) # generating numbers


# Apply conditions
v6
# extract all numbers from v6 which are < 300
v6[v6 < 300]

v6[v6 > 200 & v6 < 300]

v6 < 300


#-----------
# which function will give the position of the element that satisfies a certain
# condition.
which(v6 == 171.5)

which(v6 == 12)

# from v6, fetch 12
v6[which(v6 == 12)]
v6 == 12
v6[v6 == 12]


length(v6)
# elements in all even positions
v6[seq(2,length(v6),2)]

max(v6)
min(v6)
which.max(v6) # pos of max
which.min(v6)
range(v6)

sort(v6)
sort(v6,decreasing = T)


v7 <- c(12,34,74,82,99,22.5,13,0,2,18,10,8,120)
order(v7)
rank(v7)

v8 <- c(12,34,74,82,99,22.5,13,0,18,34,34,2,18,10,8,120)
sort(v8)
order(v8)
rank(v8)



sum(v7)
mean(v7)
median(v7)
mode(v7)
var(v7)
sd(v7)



# Matrix
# 2-d DS
# A vector(data), populated into rows and columns

v9 <- c(12,34,74,82,99,13,0,2,18,10,8,120)

My_Matrix <- matrix(v9,nrow = 4,ncol = 3)


# 1. row wise
My_Matrix2 <- matrix(v9,nrow = 4,ncol = 3,byrow = TRUE)

# 2. we are not giving multiples
My_Matrix3 <- matrix(v9,nrow = 5,ncol = 4)

# [row,columns]

# Fetch the entire 1st column
My_Matrix[,1]

matrix(My_Matrix[,1],4,1)

# Fetch the entire 3rd row
My_Matrix[3,]

My_Matrix[2,2]

# fetch "13" from matrix using which()

#-----------------------------------------------------------


#*****************************************************
# Level 3 - Data Frames - Imports 
# Acting On Columns, Subsetting, Type conversions
#-----------------------------------------------------

# Text files

# PROC IMPORT DATAFILE = "C:/MY DOCUMENTS/DATASETS/File.csv" OUT = File DBMS = CSV REPLACE;
# GETNAMES = YES
# RUN;

MyFirstData <- read.table(file = "DataSets/stores.csv",
                          header = TRUE,sep = ",",
                          stringsAsFactors = FALSE)

read.csv(file = "DataSets/stores.csv",
         stringsAsFactors = FALSE)

# Excel
# xlsx or XLConnect and Java must be installed in the system

# Install JRE and set environment variable

require(xlsx)
ExcelData <- read.xlsx(file = "DataSets/Data_Xlsx.xls",
                       sheetIndex = 1,
                       stringsAsFactors = FALSE)

require(readxl)
MyXLSFile2 <- read_excel("~/DataSets/Car_data_oth.xlsx")

require(foreign)

require(sas7bdat)
SAStoR <- read.sas7bdat("DataSets/hsb2.sas7bdat")

# To create a DF from equal sized vectors
v1 = 1:5
v2 = c(23,44,56,78,32)
v3 = c("A","B","C","D","E")

DF_Vectors <- data.frame(Column1 = v1, Column2 = v2, Column3 = v3)

#-----------------------
stores <- read.table(file = "DataSets/stores.csv",header = TRUE,sep = ",",stringsAsFactors = F)

library(dplyr)

# Summary Stats on the dataset
str(stores) # structure 
summary(stores)
names(stores)

# Extract a column - $ operator is used
Col1 <- stores$Location # $ extracts columns as a vector



Location <- stores["Location"]
Location2 <- stores[,"Location"] # equivalent to stores$Location

# Change a column's datatype - OnlinePresence Numeric to character
OP <- stores$OnlinePresence
OP <- as.character(OP)
stores$OnlinePresence <- OP

stores$Tenure <- as.character(stores$Tenure)


# renaming a column

ColumnNames <- names(stores)
# Change Location to City

ColumnNames[ColumnNames == "Location"] <- "City"

names(stores) <- ColumnNames

# Two column names - follow the correct order while replacing 

fix(stores)

# dplyr
stores <- dplyr::rename(.data = stores, City = Location) # NewName = OldName

# Subsetting

stores[,"Location"]
sub1 <- stores[,c("StoreName","Location","OnlinePresence")]

sub2 <- stores[,c(1,4,6,7,8,9)]

# to extract selected number of rows

# Extract randomly 10 rows and three columns
sub3 <- stores[1:10,c(1,4,6,7,8,9)]

# rearranging columns
ncol(stores)

Rearranged <- stores[,c(15,7,8,3,5,10,11,12,1,2,9,4,6,14,13)]
# 15 col to 6th position

Rearranged2 <- stores[,c(1:5,15,6:14)]


# Filtering
sub3 <- stores[1:10,c(1,4,6,7,8,9)]

# Conditions are applied on the data elements which are row wise

# Select StoreName and Location from Stores where OperatingCost > 15
sub4 <- stores[stores$OperatingCost > 15,c("StoreName","Location","OperatingCost")] # [r,c]

# Subsetting and Filtering using functions

# Select StoreName and Location from Stores where OperatingCost > 15
sub4 <- stores[stores$OperatingCost > 15,c("StoreName","Location","OperatingCost")] # [r,c]

sub4_func1 <- subset(stores, 
                     OperatingCost > 15,
                     select = c("StoreName","Location","OperatingCost"))

# Select OperatingCost > 15 and OperatingCost < 25
sub5 <- subset(stores, 
               OperatingCost >= 15 & OperatingCost <= 25,
               select = c("StoreName","Location","OperatingCost"))

# Adding and Remving a Column
stores$Location

stores$OwnStore <- as.character(stores$OwnStore)

# GrossSales = Product of TotalSales and Customers

stores$GrossSales <- stores$TotalSales * stores$Total_Customers

# Create a dummy column
stores$Dummy1 <- 0
stores$Dummy2 <- ""

# Remove a column
stores$GrossSales <- NULL # Assign NULL to any Column, it'll be dropped


# transform()
?transform()

stores <- transform(stores, GrossSales = TotalSales * Total_Customers)
stores$GrossSales <- NULL
#dplyr
# mutate and transmute
stores <- mutate(stores,GrossSales = TotalSales * Total_Customers,
                 TotalCost = OperatingCost - GrossSales)
stores2 <- transmute(stores,GrossSales = TotalSales * Total_Customers)

# Sorting

v1 <- c(12,33,44,56,76,88,54,33,21,99,20)
sort(v1)
sort(v1,decreasing = T)

order(v1)
v1[order(v1)]

# Sorting using one variable
storesSorted <- stores[order(stores$StoreName),]

d_storesSorted <- dplyr::arrange(stores,StoreName)

# Sorting Using two variables
storesSorted2 <- stores[order(stores$StoreName,stores$Location),]

d_storesSorted2 <- arrange(stores,StoreName,Location)


# Reverse Sorting
storesSorted3 <- stores[order(stores$TotalSales,decreasing = TRUE),]
storesSorted3 <- stores[order(-stores$TotalSales),] # - sign for decreasing order
# - sign works only for numerical values

d_storesSorted3 <- arrange(stores,desc(TotalSales)) # desc() for descending order

storesSorted4 <- stores[order(stores$StoreName,decreasing = TRUE),]

# Reverse Sort one Numerical Column and another num column in normal sort
storesSorted5 <- stores[order(-stores$TotalSales,stores$OperatingCost),]

# Reverse Sort one Numerical Column and another non numerical column in normal sort
# IMPOSSIBLE!!!

d_storesSorted6 <- arrange(stores,Location,desc(TotalSales))

# duplicates
View(scores)

v2 <- c(12,13,55,44,12,46,55,54,78,54,99,12,13)
v2
# To get all unique values :
unique(v2) # All unique values

duplicated(v2)

v2[duplicated(v2)] # -> all the repeated values 
v2[!duplicated(v2)] # ->  All unique values


unique(scores) # All repeated rows by checking all the column elements
# If atleast one element in a column is unique, then the row is not dropped!

scores[duplicated(scores),]

unique(scores$Student)

unique(scores$Test2)

scores[duplicated(scores$Student),]
scores[duplicated(scores$Test2),]
# Missing Values
v1 <- c(12,43,55,67,88,32,NA,NA,98,77,NA)

v1
#Detect missing values 
is.na(v1)

# Pick up missing values []
v1[is.na(v1)]

# Impute them
v1[is.na(v1)] <- 0

v1[v1!=0]

v1 <- v1[!is.na(v1)]

# To drop the NA
v1 <- na.omit(v1)


# For a DF
is.na(stores)

stores[is.na(stores)] # detect the NA from ALL the columns of the dataset'

stores[is.na(stores$StoreCode)]
stores[is.na(stores$StoreName)]

stores[is.na(stores)] <- 0


# Binning
stores$TotalSales

v1 <- summary(stores$TotalSales)

# TotalSales
# 71.1 to 120.8 -> Low Performance
# 120.8 - 230.7 -> Average Performance
# 230.7 - 326 -> Good Performace
# >326 -> High Performance

stores$StoresCategory[stores$TotalSales >= 71.1 & stores$TotalSales < 120.8] <- "Low Performance"

stores$StoresCategory[stores$TotalSales >= 120.8 & stores$TotalSales < 230.7] <- "Average Performance"

stores$StoresCategory[stores$TotalSales >= 230.7 & stores$TotalSales < 326] <- "Good Performance"

stores$StoresCategory[stores$TotalSales >= 326] <- "High Performance"

#ifelse(condition,T,if(contition2,T,ifelse(Condition3,T,F)))
stores$StoresCategory2 <- ifelse(stores$TotalSales >= 71.1 & stores$TotalSales < 120.8,"Low Performance",
                                 ifelse(stores$TotalSales >= 120.8 & stores$TotalSales < 230.7,"Average Performance",
                                        ifelse(stores$TotalSales >= 230.7 & stores$TotalSales < 326,"Good Performance",
                                               ifelse(stores$TotalSales >= 326,"High Performance","Not Availabe"))))




# Merging

dd <- read.csv("DataSets/Demographic_Data.csv")
td <- read.csv("DataSets/Transaction_Summary.csv")

InnerJoin <- merge(x = dd ,y = td,
                   by.x = "CustName", by.y = "CustomerName")

FullJoin <- merge(x = dd ,y = td,
                  by.x = "CustName", by.y = "CustomerName",all = TRUE)

RightJoin <- merge(x = dd ,y = td,
                   by.x = "CustName", by.y = "CustomerName",all.y = TRUE)

LeftJoin <- merge(x = dd ,y = td,
                  by.x = "CustName", by.y = "CustomerName",all.x = TRUE)


#dplyr
left_join()
right_join()
full_join()
inner_join()
semi_join()
anti_join()


d_RightJoin = right_join(x = dd,y = td,by = c("CustName" = "CustomerName","Col2" = "Col3"))

# PROC IMPORT datafile = "C:/Documents/file.csv" out = class1.file dbms = CSV replace;
# getnames = yes;
# run;

# 1. file location
# 2. type of file
# 3. destination
# 4. headers

#----------------------
# CSV/texxt files
#----------------------

?read.table()

StoresData <- read.table(file = "C:/Users/admin/Documents/DataSets/stores.csv",
                         header = TRUE, # getnames = yes
                         sep = ",")

# R is NOT SAS
# sas7bdat is physical file
# R objects are NOT physical
View(StoresData)


# Dynamic typing


#------------------------
# Excel files
#------------------------
# install.packages("readxl")
library(readxl)

StoresFromExcel <- read_excel(path = "C:/Users/admin/Documents/DataSets/stores.xlsx",
                              sheet = 1)

library(XLConnect)
library(xlsx)

#------------------------
# SAS7BDAT files
#------------------------
library(sas7bdat)
DataSAS <- read.sas7bdat(file = "C:/Users/admin/Documents/DataSets/ccu.sas7bdat")

class(DataSAS)
class(StoresData)
class(StoresFromExcel)

#------------------------

#------------------------
# DF from Vectors
#------------------------
# vectors of same size

v1 = 1:5
v2 = c("Ashish","Lokesh","Sanjay","Niks","Akash")
v3 = c(1234,5556,7843,2291,1000)


SampleData <- data.frame(EmpId = v1,
                         Names = v2,
                         SalaryinUSD = v3)

#------------------------

# 0. Knowing the structure
str(StoresData) # physical structure

summary(StoresData) # 5 number summary/Frequency table

library(psych)
describe(StoresData)



# 1. Extracting a column

# the $ operator!!
# It is used to extact one column and store it in an object

Location <- StoresData$Location
TotalSales <- StoresData$TotalSales

# 2. changing types

v1
class(v1)
v1 <- as.character(v1)
v1
class(v1) # now character

StoresData$TotalSales <- as.character(StoresData$TotalSales)


# 3, Renaming

v2
v2[v2 == "Akash"]

v2[v2 == "Akash"] <- "Aakash"

# Have a list of column names!
# names() # will extract all the col names into a vector!

# To change the column name "Location" to "City"
names(StoresData)[names(StoresData) == "Location"] <- "City"


ColNames <- names(StoresData)
ColNames[ColNames == "OnlinePresence"] <- "EComm"
names(StoresData) <- ColNames
# names(StoresData)[names(StoresData) == "OnlinePresence"] <- "EComm"

# fix(StoresData)
# 



# adding columns

# GrandTotalSales <- TotalSales * Total_Customers

# $ can also be used to all columns

StoresData$ExampleColumn <- "S"
StoresData$BlankColumn <- ""


StoresData$GrandTotalSales <- StoresData$TotalSales * StoresData$Total_Customers

# Deleting a column

StoresData$ExampleColumn <- NULL

#---------------------------------------------------------
# Use of [] in DF
# [row,columns]
#---------------------------------------------------------

# Extract 1st column
Ext1 <- StoresData[,1]
StoresData$StoreCode

# Extract columns 1 to 5
Ext2 <- StoresData[,1:5]

# Extract "StoreCode","StoreType", "Location", "TotalSales"
Ext3 <- StoresData[,c("StoreCode","StoreType", "Location", "TotalSales")]

# Rearrangement!
Ext4 <- StoresData[,c(4,1,13,8,9,7,12,14,16,2,10,5,15,11,3,6)]

Ext5 <- StoresData[,c(1:8,16,9:15)]


#---------------------------------------------------------
# Use of [] in DF
# Subsetting
#---------------------------------------------------------

# Extract 1st column
Ext1 <- StoresData[,1]
StoresData$StoreCode

# Extract columns 1 to 5
Ext2 <- StoresData[,1:5]

# Extract "StoreCode","StoreType", "Location", "TotalSales"
Ext3 <- StoresData[,c("StoreCode","StoreType", "Location", "TotalSales")]

# Extract rows 1 to 5
Ext4 <- StoresData[1:5,]

# Extract Columns 1 to 5 and last 5 rows
length(StoresData) # no of columns
nrow(StoresData) # no of rows
ncol(StoresData) # no of cols
dim(StoresData)

# nrow
# Number of rows
r <- nrow(StoresData)
(r-4):r 

Ext5 <- StoresData[(r-4):r,1:5]

# Filtering

# Extract all rows where Location is Delhi
Ext6 <- StoresData[StoresData$Location == "Delhi",]

# Extract all rows where Location is Chennai and TotalSales > 250
Ext7 <- StoresData[StoresData$Location == 'Chennai' & StoresData$TotalSales > 250,]

library(dplyr)

# renaming
# Location to City and OnlinePresence to EComm
StoresData <- rename(StoresData, City = Location, EComm = OnlinePresence)
# rename(Data, NewColName1 = OldColName1, NewColName2 = OldColName2 ... )

# Adding new Columns
GrandTotalSales <- Totalsales * Total_Customers

StoresData <- mutate(StoresData,GrandTotalSalesDP = TotalSales * Total_Customers)


# subset(Data,<condition>,select = )
## Extract all rows where City is Chennai and TotalSales > 250
## And columns 2,3,4

Ext8 <- subset(StoresData,City == "Chennai" & TotalSales > 250,
               select = c(2,3,4))


# Sorting


# Sort with one variable - TotalSales

order(StoresData$TotalSales)
Sort1 <- StoresData[order(StoresData$TotalSales),]

Sort1_d <- arrange(StoresData,TotalSales)


# Sort with one variable in descending
order(StoresData$TotalSales,decreasing = TRUE)
Sort2 <- StoresData[order(StoresData$TotalSales,decreasing = T),]

Sort2_d <- arrange(StoresData,desc(TotalSales))

# Sort with two variables -  City and TotalSales
Sort3 <- StoresData[order(StoresData$City,StoresData$TotalSales),]

Sort3_d <- arrange(StoresData,City,TotalSales)

# Sort with two variables, both in descending
Sort4 <- StoresData[order(StoresData$City,StoresData$TotalSales,decreasing = T),]
Sort4_d <- arrange(StoresData,desc(City),desc(TotalSales))


# Sort with two variables, one in descending and other in asc

Sort5_d <- arrange(StoresData,City,desc(TotalSales))




# Missing Values
# Any missing value is denoted by NA

# Special Cases of numeric data
# NA
# NULL
# NaN -> not a number
# Inf/-Inf


r1 <- NA
r2 <- NULL

r3 <- 10/0
r4 <- sqrt(-1)

# Get rid of above 4 numbers


# 1. Identify 
# 2. Substitute accordingly!

class(num)
is.numeric(num)
is.character(num)
is.logical(num)


# To ID NA values
is.na() # detects NA values

v1 <- c(12, 54, 67, 88, 45, 32, 17, NA, NA, 8, 3, 1, NA, NA, 2)
v1

v2
sum(v2)

mean(v1)

is.na(v1)
v1[is.na(v1)]
v1[is.na(v1)] <- 0 # imputing NA with 0

v7
v7[v7 == "A"] <- "Z"


v1[is.na(v1)] <- mean(v1)

# Any mathematical functions will have an argument :
# na.rm = TRUE

sum(v1,na.rm = TRUE)
mean(v1,na.rm = TRUE) # 329/11 -> ignore the count as well

v1[is.na(v1)] <- mean(v1,na.rm = TRUE)

round(29.99)
round(29.3)
round(29.3378,2)

v1 = round(v1,2)
"" # This is not a missing value - 32

is.infinite()
is.nan()


is.na(stores)

# Trimming 

s1 <- "     Vizag    "
s1 == "Vizag"
# 1. trim all white spaces L and R -> default
trimws(s1)
trimws(s1,which = "both")
# 2. Trim only left
trimws(s1,which = "left")

# 3. Trim only right
trimws(s1,which = "right")

# Find and replace

# in stores data, replace "Delhi" with "New Delhi"

stores$Location[stores$Location == "Delhi"] <- "New Delhi"
# stores[stores == "Delhi"]


# Binning

# Process where we convert Continious variable to a Categorical Variable!

# TotalSales -> Depending on the ranges, we classify (create a new var) the data

# 1. range
range(stores$TotalSales)
min() # 71.1
max() # 472.0

# 2. Get a 5 number summary or better, get percentiles!
summary(stores$TotalSales)

# get percentiles
TotalSales <- stores$TotalSales

quantile(TotalSales)


# in probs arg, 0 -> 0% and 1 is 100%
# probs = c(0,1) -> 0% and 100%
# probs = c(0,0.5,1) -> 0,50,100
# 
# 0%,5%,10%,20%,25%,50%,90%,99%,100%
quantile(TotalSales,probs = c(0,0.05,0.1,0.2,0.25,0.5,0.9,0.99,1))


# Final Stage

stores$Food <- ""

# New Delhi -> "Chaat"
# Chennai -> "Pongal"
# Mumbai -> "Vada Pav"
# Kolkata -> "Sandesh"

stores$Food[stores$Location == "New Delhi"] <- "Chaat"
stores$Food[stores$Location == "Chennai"] <- "Pongal"
stores$Food[stores$Location == "Mumbai"] <- "Vada Pav"
stores$Food[stores$Location == "Kolkata"] <- "Sandesh"


# TotalSales
# >=71.100 & <120.825 - "Low Performance Store" 
# >= 120.825 & < 196.300 - "Average Performance Store" 
# >= 326.000 & < 472.000 - "High Performance Store"

stores$StoreClass[stores$TotalSales >= 71.100 & stores$TotalSales < 120.825] <- "Low Performance Store"

stores$StoreClass[stores$TotalSales >= 120.825 & stores$TotalSales < 196.300] <- "Average Performance Store" 

stores$StoreClass[stores$TotalSales >= 196.300 & stores$TotalSales < 472.000] <- "High Performance Store"


# Encoding
# Converting a Categorical Variable which is character to a numeric variable
# New Delhi -> 1
# Chennai -> 2
# Mumbai -> 3
# Kolkata -> 4

# Duplicates - Identification

Scores <- read.csv(file = "DataSets/Score.csv",stringsAsFactors = FALSE)

duplicated() # T or F 
# If it encounters a data value for the first time, returns FALSE

v8 <- c(1,2,1,7,1,10,11)
duplicated(v8)
v8[duplicated(v8)] # returns the values which are duplicated

!duplicated(v8)
v8[!duplicated(v8)] # returns the values which are unique
unique(v8)


View(Scores)

# ID duplicates in the entire table
Scores[duplicated(Scores),]

Scores[!duplicated(Scores),]

# ID duplicates column wise and get unique data

# check if duplicates exist in a column and then subset the data with one unique 
# and other with duplicate rows

# Check with Student
Scores[duplicated(Scores$Student),]

# Check with Test2
Scores[duplicated(Scores$Test2),]

# Check with more than 1 column
# NOT duplicated(Scores$Test2,Score$Student)

Scores[duplicated(Scores$Test2) & duplicated(Scores$Student) ,]

# Merge
dd <- read.csv(file = "DataSets/Demographic_Data.csv")
td <- read.csv(file = "DataSets/Transaction_Summary.csv")

InnerJoin <- merge(x = dd,y = td,by.x = "CustName",by.y = "CustomerName")

FullJoin <- merge(x = dd,y = td,by.x = "CustName",by.y = "CustomerName",all = TRUE)

LeftJoin <- merge(x = dd,y = td,by.x = "CustName",by.y = "CustomerName",all.x = TRUE)

RightJoin <- merge(x = dd,y = td,by.x = "CustName",by.y = "CustomerName",all.y = TRUE)

library(dplyr)
left_join()
right_join()
full_join()
semi_join()
inner_join()
View(InnerJoin)
union()
setdiff()


#--------------------------------------------------

group_by()
summarize()
summarise()

# "SELECT Location, sum(TotalSales) as SumTotalSales FROM stores GROUP BY Location"
library(sqldf)
SQLQuery <- "SELECT Location, sum(TotalSales) as 'SumTotalSales' FROM stores GROUP BY Location"
OutDS <- sqldf(SQLQuery)

# first, group by loaction
tds <- group_by(stores, Location) 

# then, summarize() or calculate the values or apply some function
OutDS_dp <- summarize(tds, SumTotalSales = sum(TotalSales,na.rm = TRUE))

# %>%
OutDS_dp_pipe <- stores %>% group_by(Location) %>% summarize(SumTotalSales = sum(TotalSales,na.rm = TRUE))



# if two DS have same num of columns, then they can be pasted by rows!

ScoresRowBind <- rbind(Scores1,Scores2)


# if two DS have same num of rows, then they can be pasted by columns!

StoresColBind <- cbind(DS2,DS1)











































arran


ls()


#-----------------------------------------------------













