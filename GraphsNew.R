#************************************************************
# ggplot2
#____________________________________________________________
require(ggplot2)
require(plotly)

#-------------------------------------
# Building Components of ggplot2
#------------------------------------- 
# Data

# Layers
# Scales
# Coord
# faceting
#------------------------------------- 

# mpg data set
# stores data set

View(mpg)

# cty and hwy record miles per gallon (mpg) for city and highway driving.

# displ is the engine displacement in litres.

# drv is the drivetrain: front wheel (f), rear wheel (r) or four wheel (4).

# model is the model of car. There are 38 models, selected because they had

# a new edition every year between 1999 and 2008.

# class (not shown), is a categorical variable describing the \type" of car:
#     two seater, SUV, compact, etc.

#---------------------------------------
# Aim : To get a scatterplot
#---------------------------------------
# Every ggplot2 plot has three key components:
# 1. data,
# 2. A set of aesthetic mappings between variables in the data and visual
# properties, and
# 3. At least one layer which describes how to render each observation. Layers
# are usually created with a geom function.

Plot1 <- ggplot(mpg, aes(x = displ, y = hwy)) 
Plot1 <- Plot1 + geom_point()
Plot1
ggplotly(Plot1)

Plot2 <- ggplot(stores, aes(x = OperatingCost, y = TotalSales))+ geom_point()
Plot2 <- Plot2 + geom_point()
Plot2
plotly::ggplotly(Plot2)


# Adding colors
Plot3 <- ggplot(stores,aes(x = OperatingCost, y = TotalSales))
Plot3 <- Plot3 + geom_point(color = "dodgerblue4")
Plot3

#-------------------
# Adding more variables as colors
#-------------------
# R color guide is available at lot of places!
# 1. http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# 2. demo(color)

Plot4 <- ggplot(mpg, aes(displ, cty, colour = class)) + geom_point()

# color -> ideally takes a categorical variable
# 
# different colors are filledin the graph acc to the 
# levels
Plot5 <- ggplot(stores,aes(x = OperatingCost, y = TotalSales, color = Location)) + 
  geom_point()

Plot5
ggplotly(Plot5)




#-------------------
# Adding more variables as facets
#-------------------

Plot6 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class)
Plot6

Plot6 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(cyl~class)
Plot6

Plot7 <- ggplot(stores,aes(x = OperatingCost, y = TotalSales)) + 
  geom_point() + 
  facet_wrap(~Location)
# rows,columns
# rows ~ columns
# eq to Pivot - column as Category/Axis
Plot7




Plot7_1 <- ggplot(stores,aes(x = OperatingCost, y = TotalSales)) + 
  geom_point() + 
  facet_grid(Location ~ .)
#[r,c]
# r ~ c
# . ~ Location
# . for nothing under that section in facet


#---


Plot8 <- ggplot(stores,aes(x = OperatingCost, y = TotalSales)) + 
  geom_point() + 
  facet_grid(StoreType~Location)

Plot8
ggplotly(Plot8)


#-----------------------
# More Plot geoms 
#-----------------------

# 1. Smoothing Curve
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

ggplot(stores, aes(OperatingCost, TotalSales)) +
  geom_point() +
  geom_smooth()

# 2. Whisker plots for distributions
ggplot(stores, aes(y = TotalSales, x = Location)) + geom_boxplot()

# 3. Violin plots for density distribution
#   Kind of box plots but they show density - 
#   areas where more data points are found
ggplot(mpg, aes(drv, hwy)) + geom_violin()

ggplot(stores, aes(y = TotalSales, x = Location)) + geom_violin()

# 4. Histograms

ggplot(mpg, aes(hwy)) + geom_histogram()

ggplot(stores, aes(TotalSales)) + geom_histogram(bins = 5,color = "black",fill = "tomato1")

#http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#-------------------------------
# 5. Bar Plots
#-------------------------------

# by default, a geom_bar() amounts to count or stat = "bins"
ggplot(mpg, aes(manufacturer)) +
  geom_bar()

ggplot(stores, aes(StoreType)) +
  geom_bar()

# For pre summarized data, like a pivot kind of information, 
# use stat = "identity"

td <- group_by(stores, Location)
Res <- dplyr::summarize(td, Sum.of.TotalSales = sum(TotalSales))

Bar1 <- ggplot(data = Res,aes(x = Location, y = Sum.of.TotalSales)) 
Bar1 <- Bar1 + geom_bar(stat = "identity")
Bar1

# Add colors and borders

Bar1 <- ggplot(Res,aes(x = Location, y = Sum.of.TotalSales)) 
Bar1 <- Bar1 + geom_bar(stat = "identity",color = "deeppink",fill = "blue")

# fill adds color
# color adds a border


Bar1

ggplotly(Bar1)

# Add more variables through colors in aes
Res2 <- stores %>% group_by(Location,StoreType) %>% 
  dplyr::summarize(Sum.of.TotalSales = sum(TotalSales))

td <- group_by(stores, Location, StoreType)
Res2 <- dplyr::summarize(td, Sum.of.TotalSales = sum(TotalSales))



# Multivariables in any bar graph can be : stacked or dodged

# 1. Stacked

Bar2 <- ggplot(Res2, aes(x = Location, y = Sum.of.TotalSales, fill = StoreType)) 
Bar2 <- Bar2 + geom_bar(stat = "identity")
Bar2

ggplotly(Bar2)

# 2. Dodged


Bar2d <- ggplot(Res2, aes(x = Location, y = Sum.of.TotalSales, fill = StoreType)) 
Bar2d <- Bar2d + geom_bar(stat = "identity",position = "dodge")
Bar2d

ggplotly(Bar2d)

PlotBG1 <- ggplot(Res2,aes(x = Location,y = Sum.of.TotalSales,fill = StoreType)) + 
  geom_bar(stat = "identity",position = "dodge") + 
  scale_fill_manual(values=c("goldenrod2","turquoise","lightseagreen"));
ggplotly(PlotBG1)

# Add more variables through facets

Bar2f <- ggplot(Res2, aes(x = Location, y = Sum.of.TotalSales)) 
Bar2f <- Bar2f + geom_bar(stat = "identity",fill = "royalblue")
Bar2f <- Bar2f + facet_grid(.~StoreType)
Bar2f
ggplotly(Bar2f)
#or
Bar2f <- ggplot(Res2, aes(x = Location, y = Sum.of.TotalSales)) 
Bar2f <- Bar2f + geom_bar(stat = "identity")
Bar2f <- Bar2f + facet_grid(StoreType~.)
Bar2f

#----------------------------------------------
# Modifying the axes
#----------------------------------------------

# 1. Labeling the axes

Plot9 <- ggplot(stores, aes(y = TotalSales, x = OperatingCost)) +
  geom_point() +
  xlab("Operating Cost") +
  ylab("Total Sales")
Plot9
# Remove the axis labels with NULL
ggplot(stores, aes(y = TotalSales, x = OperatingCost)) +
  geom_point() +
  xlab(NULL) +
  ylab(NULL)

# Changing the limits of the axes
# use xlim() for x
# ylim() for y

Plot9lim <- ggplot(stores, aes(y = TotalSales, x = OperatingCost)) +
  geom_point() +
  xlab("Operating Cost") +
  ylab("Total Sales") + 
  xlim(min(stores$OperatingCost),50)
Plot9lim

#-----------
# Adding text
#-----------

Plot10 <- ggplot(data = stores,aes(x = OperatingCost, y  = TotalSales))
Plot10 <- Plot10 + geom_point() 
Plot10 <- Plot10 + geom_text(aes(label = paste("\n",OperatingCost,",",TotalSales)))
Plot10
ggplotly(Plot10)


# labels : for the main labels
# family : for the font family. Serif, Mono or Sans
# fontface : bold, ita, plain




#--------------------------------------------
# Pie
#--------------------------------------------
Res1 <- stores %>% group_by(Location) %>% summarize(SumTotalSales = sum(TotalSales))


p <- plot_ly(Res, labels = ~Res1$Location, values = ~Res1$SumTotalSales, type = 'pie') %>%
  layout(title = 'Location and Sales',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p



