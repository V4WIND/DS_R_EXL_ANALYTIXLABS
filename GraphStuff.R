library(ggplot2)

# The plot() function - Generic plotting utility
v1<-10:20
plot(v1) 

plot(n3)# Y axis as default and x axis will have Indexes

plot(n3,
     xlab = "Positions",#label for x axis
     ylab = "The actual Data",#label for y axis
     main = "My First Graph",
     type = "b" # by default it's p
     # l for lines
     # b both
     )
.

plot(stores$OperatingCost,type = "b")



v2 <- c(12,34,55,66,33,44,77,88,99,11)

plot(x=v1,y=v2,type = "b",main = "My First Plot",
     xlab = "The Vector V2",
     ylab = "The Vector V1",
     sub="My subtitle") #p - point, l - lines, b - both
grid() # adds grid lines to the most recent graph

plot(1:10)


x<- 1:10 # Index
y<- 21:30 # Data
plot(x,y) #default points

y2 <- c(12,45,67,23,46,47,55,54,99,100)
plot(x = x,y = y2)


plot(x,y2,type = "l") #default lines
plot(x,y2,type = "b") #both points and lines

plot(x,y2,
     type="b",
     xlab = "X Values",
     ylab = "Y Values",
     main = "My First Plot",
     sub = "Foot Note")

# R graphics device - RStudioGD 
# extended pdf(),png() etc...

plot(stores$TotalSales)

plot(stores$TotalSales,
     main="Total Sales \n Ranges and Distribution",
     ylab="Total Sales", 
     # ylab="Op Cost", 
     type = "b")  
grid() # adds grid lines

# TotalSales in Y axis vs OperatingCost in X axis
plot(y=stores$TotalSales,
     x=stores$OperatingCost,
     main="Total Sales vs Operating Cost",
     ylab="Total Sales", 
     # ylab="Op Cost"
     )
grid() # adds grid lines

# factor -> levels(accessed externally) and index(internal storage)

plot(y=stores$TotalSales,
     x=factor(stores$Location), # to pass the entire data and at the same time use only the unique values
     main="Total Sales \n Based on Location",
     xlab="Location", 
     ylab="Total Sales")
grid()


# plot(x=sort(stores$TotalSales),
#      y=factor(stores$Location), # to pass the entire data and at the same time use only the unique values
#      main="Total Sales \n Based on Location",
#      xlab="Location", 
#      ylab="Total Sales",type="b")



#Creating a scatter plot
x<- seq(1,10,by=0.5)
y<- 21:39
plot(x,y) #default points

plot(x,y,type = "l") #default lines
plot(x,y,type = "b") #both points and lines

plot(x,y,
     type="b",
     xlab = "X Values",
     ylab = "Y Values",
     main = "My First Plot",
     sub = "Mein eine Plot")
grid() # adds grid lines

library(ggplot2)

#Exploring the data

#Scatter Plot

#Base Package
plot(stores$Total_Customers,stores$TotalSales)

#ggplot grammar of graphics

qplot(data=stores,x=Total_Customers,y=TotalSales)
# Works on Layers
# First Layer : Emplty Canvas
# Second : Axes
# Third : plot
# Fourth, Firth ... nth : optional additions to the graph

#A backdrop First

ScPlot <- ggplot(stores, aes(x=Total_Customers, y=TotalSales)) # aes(x,y)
#A layer
ScPlot <- ScPlot + geom_point()
plot(ScPlot)


#Lineplot

#Base Package
plot(stores$Total_Customers,stores$TotalSales,type="b")

View(pressure)
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)


qplot(pressure$temperature, pressure$pressure, geom="line")

qplot(data = pressure,x = temperature, y = pressure , geom="line")


LinePLot <- ggplot(pressure, aes(x=temperature, y=pressure))
LinePLot <- LinePLot + geom_line()
LinePLot

LinePLot <- ggplot(stores, aes(x=Total_Customers, y=TotalSales))
LinePLot <- LinePLot + geom_line()
LinePLot


LinePointPlot <- ggplot(pressure, aes(x=temperature, y=pressure))
LinePointPlot <- LinePointPlot + geom_line() + geom_point()
LinePointPlot

LinePointPlot <- ggplot(stores, aes(x=Total_Customers, y=TotalSales))
LinePointPlot <- LinePointPlot + geom_line()+ geom_point()
LinePointPlot

LinePointPlot <- ggplot(mtcars, aes(x=wt, y=mpg))
LinePointPlot <- LinePointPlot + geom_line() 
LinePointPlot <- LinePointPlot + geom_point()
LinePointPlot







#*****************************************************************************************
# Bar Charts for Single Variable
#-----------------------------------------------------------------------------------------
#stores <- read.csv("stores.csv")

plot(factor(stores$StoreType))




storetype <- table(stores$StoreType)
barplot(storetype,main="Frequency of Store Type elements")

barplot(storetype,horiz = TRUE,main = "Barplot of storetypes")

demo(colors())
showCols1()

barplot(storetype,
        horiz = FALSE,
        main = "Barplot of storetypes",
        col = c("red","blue","black"),
        xlab = "Types of storetypes",
        ylab="Frequency")

qplot(stores$StoreType)

# qplot(factor(stores$StoreType))

barplot1 <- ggplot(stores,aes(StoreType))+geom_bar()

#-------------------------------------------------------------
#  Bivariate
#-------------------------------------------------------------
Name_Loc <- table(stores$StoreName,stores$Location)

barplot(Name_Loc,
        beside = F)
barplot(Name_Loc,
        beside = FALSE,
        col=c("red","orange","gray20","yellow","tomato","chocolate","indianred"))

barplot(Name_Loc,
        beside = TRUE,
        col=c("red","orange","gray20","yellow","tomato","chocolate","indianred"))
legend("topright",levels(factor(stores$StoreName)),
       fill=c("red","orange","gray20","yellow","tomato","chocolate","indianred"))

#Aim is to get barplot of Total of Operating Cost per Location

OperatingCost <- stores$OperatingCost
StoreLoc <- stores$Location

TotalOCByLoc <- aggregate(OperatingCost~StoreLoc,FUN=sum)

t1 <- group_by(stores,Location)
t2 <- summarise(t1,TotalOperatingCost = sum(OperatingCost))



TotalOCByLocDF <- t(TotalOCByLoc[-1])
colnames(TotalOCByLocDF) <- levels(factor(StoreLoc))

barplot(TotalOCByLocDF)

LocCols <- c("blue1","deeppink","gold","lawngreen") #showCols1() or showCols2()
barplot(TotalOCByLocDF, main="Total Operating Cost \n Per Location", xlab="Location", ylab="Total Operating Cost",
        border="black")

ggplot(stores, aes(x=Location, y=OperatingCost)) + geom_bar(stat="identity")
ggplot(stores, aes(x=Location)) + geom_bar(stat="count")

#*****************************************************************************************
# Pie Charts for Single Variable
#-----------------------------------------------------------------------------------------
attach(chickwts)


plot(chickwts$feed)


feeds <- table(chickwts$feed)
pie(prop.table(feeds))

pie(feeds)

Pie_Table <- table(stores$StoreSegment)
pie(Pie_Table)
Percent <- prop.table(Pie_Table)*100
pie(Pie_Table,main = "pie Chart",
    labels = paste0(names(Pie_Table),"\n","(",Percent,"%)"))

#*****************************************************************************************
# Pie Charts for bivariate analysis
#-----------------------------------------------------------------------------------------

x <- c(10,41,5,15,33)
y <- c("A","B","C","D","E")

pie(x,y)

x <- stores$OperatingCost
y <- stores$Location

pie(x,y)

x <- TotalOCByLoc$OperatingCost
y <- TotalOCByLoc$StoreLoc

pie(x,y)

#*****************************************************************************************
# Univariate Histogram
#-----------------------------------------------------------------------------------------

# A histogram representsthe distribution of numerical data or an estimate of the probability
# distribution of a continiuous variable



# Make a histogram using the defaults
hist(lynx)  # distribution of one-dimensional data with a histogram.
?hist

hist(stores$TotalSales)



require("datasets")
?lynx
data(lynx)  # Annual Canadian Lynx trappings 1821-1934
hist(lynx,freq = F)
options(scipen=999) # turns off scientific notation
# Modify histogram
h <- hist(lynx,
          breaks = 7, # this adds up the bins - 
          freq = T, # IF freq = FALSE, this will draw normal distribution
          col = "thistle1", # Or use: col = colors() [626]
          main = "Histogram of Annual Canadian Lynx Trappings\n1821-1934",
          xlab = "Number of Lynx Trapped")


h

h2 <- hist(lynx,
          breaks = 11, # this adds up the bins - 
          freq = FALSE, # IF freq = FALSE, this will draw normal distribution
          col = "thistle1", # Or use: col = colors() [626]
          main = "Histogram of Annual Canadian Lynx Trappings\n1821-1934",
          xlab = "Number of Lynx Trapped")


hist(stores$TotalSales)

plot(h)

h <- hist(stores$TotalSales,
          breaks = c(0,71.1,120.8,196.3,230.7,326,max(stores$TotalSales)), # this adds up the bins - 
          freq = T, # IF freq = FALSE, this will draw normal distribution
          col = "coral", # Or use: col = colors() [626]
          main = "Histogram of TotalSales",
          xlab = "TotalSales")


# All normal distributions are symmetric and have bell-shaped density curves with a single peak. 
# To speak specifically of any normal distribution, two quantities have to be specified: 
#   the mean , where the peak of the density occurs, 
#   and the standard deviation , which indicates the spread or girth of the bell curve.
h <- hist(lynx,
          breaks = 11, # this adds up the bins - 
          freq = FALSE, # IF freq = FALSE, this will draw normal distribution
          col = "blue", # Or use: col = colors() [626]
          main = "Histogram of Annual Canadian Lynx Trappings\n1821-1934",
          xlab = "Number of Lynx Trapped")

hist(lynx,
          breaks = c(min(lynx),1000,3000,4000,5500,max(lynx)), # this adds up the bins - 
          freq = T, # IF freq = FALSE, this will draw normal distribution
          col = "blue", # Or use: col = colors() [626],
          main = "Histogram of Annual Canadian Lynx Trappings\n1821-1934\nCustom Bins",
          xlab = "Number of Lynx Trapped")

curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)), 
      col = "thistle4", 
      lwd = 2,
      add = TRUE)
?curve

hist(stores$TotalSales,freq=T, col="red")


ggplot(stores, aes(x=TotalSales)) + geom_histogram(bins = 7)






#-----------------------------------------------------------------------------------------

# Displays distribution of data based on the Five number summary - min, 1st Quartile, mean, 3rd quartile, max

help("boxplot")
?hist
# LOAD DATASET
require("datasets")
# Lawyers' Ratings of State Judges in the US Superior Court (c. 1977)
?USJudgeRatings
USJudgeRatings  # View data
data(USJudgeRatings)  # Load into workspace
# At least two errors in data file:
# 1. Data appears to be on 1-10 or 0-10 scale but Callahan
#    has a 10.6 on CONT. 8.6 seems more likely.
# 2. Santaniello's last name is misspelled
# Best to fix errors in spreadsheet and reimport

# Make boxplot using the defaults
boxplot(USJudgeRatings$RTEN)
?boxplot

boxplot(stores$TotalSales)

NumericalData <- stores[,c(5:15)]
boxplot(NumericalData)
boxplot(USJudgeRatings)

# Modify boxplot
boxplot(USJudgeRatings$RTEN,
        horizontal = TRUE,
        las = 1,  # Make all labels horizontal
        notch = TRUE,  # Notches for CI for median
        ylim = c(0, 10),  # Specify range on Y axis
        col = "slategray3",   # R's named colors (n = 657)
        #         col = colors() [602], # R's color numbers
        #         col = "#9FB6CD",      # Hex codes for RBG
        #         col = rgb(159, 182, 205, max = 255),  # RGB triplet with max specified
        boxwex = 0.5,  # Width of box as proportion of original
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple (line at end) type; 0 = none
        outpch = 16,  # Symbols for outliers; 16 = filled circle
        outcol = "slategray3",  # Color for outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings")

# Multiple boxplots
boxplot(USJudgeRatings,
        horizontal = FALSE,
        las = 1,  # Make all labels horizontal
        notch = TRUE,  # Notches for CI for median
        ylim = c(0, 10),  # Specify range on Y axis
        col = "slategray3",   # R's named colors (n = 657)
        boxwex = 0.5,  # Width of box as proportion of original
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple (line at end) type; 0 = none
        outpch = 16,  # Symbols for outliers; 16 = filled circle
        outcol = "slategray3",  # Color for outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings")


ggplot(USJudgeRatings, aes(x=0,y=RTEN)) + geom_boxplot()

ggplot(stores, aes(x=interaction(Location), y=OperatingCost)) + geom_boxplot()
#*****************************************************************************************
# Scatter Plot
#-----------------------------------------------------------------------------------------
plot(stores$TotalSales,stores$BasketSize,pch=6, col="red")


pairs(~TotalSales+BasketSize+ProfitPercust+AcqCostPercust,data=stores)

#using car package
require(car)
scatterplot(OperatingCost ~ TotalSales , data=stores,
            xlab="OperatingCost", ylab="TotalSales", 
            main="Enhanced Scatter Plot")

#using lattice package

cor(stores$TotalSales, stores$BasketSize)

require(lattice)
require(car)
splom(stores[,c("TotalSales","BasketSize","ProfitPercust","AcqCostPercust")], groups=stores$StoreSegment, data=stores)

scatterplot.matrix(~ TotalSales+BasketSize+ProfitPercust+AcqCostPercust|OwnStore, data=stores)

scatterplotMatrix(~TotalSales+BasketSize+ProfitPercust+AcqCostPercust|OwnStore, data=stores)
?scatterplotMatrix()
# Finding correlation between two variables

cor(stores$BasketSize,stores$TotalSales)

install.packages("corrplot")
library(corrplot)
corrplot(cor(stores[, 5:10],use="pairwise.complete.obs"), method = "number", tl.cex = 0.5)







#-----------------------------------------------------------------------------------------


# Exporting to PDF, PNG

######################### EXPORTING OBJECTS
#0. write() & save(), save.image()   ## saving workspace , objects
#1. sink()                           ## Saving output in text file
#2. R-Markdown                       ## Saving output in pdf, word and html, slides
#3. prettyR 
#4. hwriter
#5. shyny
#6. Integrating with tableau
#7. pdf(), png() etc                ## Saving graphs/plots in different formats

# Export to RData file --------------------------------------------------------

# Save entire environment
path <- getwd()
save.image(file = paste0(path, "environment.RData"))
save(stores, file =  "stores.RData") # Save single R objects
load(file = "class1.RData") # Load RData file(s)

#Exporting data

library(xlsx)
write.xlsx(stores, file="Write_Excel.xlsx")

write.csv(stores, file = "Write_csv.csv")

# Exporting Output

setwd(choose.dir())
sink("sink-examp.html")
class(stores)
names(stores)
length(stores)
nrow(stores)
dim(stores)
str(stores)
head(stores)
tail(stores)
sink()


# EXPORTING GRAPHS

png("Plot.png") # PNG
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
#barplot(table(stores$StoreType), col="red", horiz=TRUE, main="Distribution of store types")
dev.off()

#Other graphs

pdf("mygraph.pdf") # PDF
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
dev.off()

win.metafile("mygraph.wmf") #Window media file
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
dev.off()

jpeg("mygraph.jpg")# JPG FIle
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
dev.off()

bmp("mygraph.bmp")        #bmp file
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
dev.off()

postscript("mygraph.ps")   # Post Script file
attach(mtcars)
plot(wt, mpg, col="red") 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
dev.off()

#RMarkdown


#install.packages("rmarkdown")
require(rmarkdown)
require(markdown)
require(knitr)

# Method-1
render("C:/Users/admin/Desktop/ss.docx", word_document())

# Method-2
knit2html("C:\\Users\\ChandraMouli\\Desktop\\dd.Rmd")
knit2pdf("C:\\Users\\ChandraMouli\\Desktop\\dd.Rmd")








pdf(file="C:/Users/admin/Documents/Demo2.pdf")

boxplot(USJudgeRatings,
        horizontal = FALSE,
        las = 1,  # Make all labels horizontal
        notch = TRUE,  # Notches for CI for median
        ylim = c(0, 10),  # Specify range on Y axis
        col = "slategray3",   # R's named colors (n = 657)
        boxwex = 0.5,  # Width of box as proportion of original
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple (line at end) type; 0 = none
        outpch = 16,  # Symbols for outliers; 16 = filled circle
        outcol = "slategray3",  # Color for outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings")

boxplot(USJudgeRatings$RTEN)

hist(lynx)  # distribution of one-dimensional data with a histogram.


dev.off()











jpeg(file="C:/Users/admin/Documents/demo_image.jpeg")

boxplot(USJudgeRatings,
        horizontal = FALSE,
        las = 1,  # Make all labels horizontal
        notch = TRUE,  # Notches for CI for median
        ylim = c(0, 10),  # Specify range on Y axis
        col = "slategray3",   # R's named colors (n = 657)
        boxwex = 0.5,  # Width of box as proportion of original
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple (line at end) type; 0 = none
        outpch = 16,  # Symbols for outliers; 16 = filled circle
        outcol = "slategray3",  # Color for outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings")
dev.off()
