## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

##  Creating a subset with just data from Baltimore and sum up emissions by variable "type"


Balti_data <- subset(NEI, NEI$fips == "24510")

Baltidata_year <- aggregate(Balti_data$Emissions, 
                            by = list(Balti_data$type, Balti_data$year), sum)

## naming the columns titles 

colnames(Baltidata_year)

colnames(Baltidata_year) <- c("Type", "year", "Emissions")


colnames(Baltidata_year)

## Creating a plot with ggplot2 indicating the type of sources (Non-Road, Non-point,
# On-road, Point) which have seen a decrease in the emission in the 
 # Baltimore city from 1999- 2008.

library(ggplot2)

png(filename = "plot3.png")
qplot(year, Emissions, data = Baltidata_year, color = Type, geom = "line") + 
    ggtitle("Total Emission of PM2.5 in Baltimore City 1999-2008 By Pollutant Type ") +
    ylab("Total Emission(tons") + xlab("year")

dev.off()

