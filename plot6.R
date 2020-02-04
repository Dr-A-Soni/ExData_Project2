## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

## Creating a subset of data from Baltimore City, LA county and from type "on road".
Baltimore_CarData <- subset(NEI, NEI$fips=="24510" |
                                NEI$fips=="06037" &
                                NEI$type=="ON-ROAD")
head(Baltimore_CarData)

## Creating a vector with sum of date pertaining to emission and year from Baltimore_CarData. 

Balti_car_year <- aggregate( Baltimore_CarData$Emissions, 
                             by=list(Baltimore_CarData$fips, Baltimore_CarData$year),
                             sum)

colnames(Balti_car_year)

# naming the columns 
 
colnames(Balti_car_year) <- c("City", "Year", "Emissions")

colnames(Balti_car_year)

## loading the ggplot2 package.

library(ggplot2)

## Ceating a  plot comparing emissions from motor vehicles in Baltimore 
 # and LA from 1999-2008.


png(filename = "plot6.png")
qplot(Year, Emissions, data = Balti_car_year, color = City, geom = "line") +
    ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
    ylab("Total Emissions from motor vehicles (tons)") + 
    xlab("Year") 
dev.off()

