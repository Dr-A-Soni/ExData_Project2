## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

## Looking at the data 

head(NEI)
tail(NEI)


## add up the total emissions for each year from 1999-2008.

NEI_yeartotal  <- aggregate(NEI$Emissions , by =list(year = NEI$year), sum)

dim(NEI_yeartotal)

head(NEI_yeartotal$year)

## Making  a plot (Plot1.png) showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.

png(filename = "plot1.png")
plot(NEI_yeartotal$year, NEI_yeartotal$x, type = "l", 
     main = "Total Emissions of PM2.5",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year", pch = 19, col = "darkblue", lty = 6)
dev.off()

