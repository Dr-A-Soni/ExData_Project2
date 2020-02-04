## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

## subset to just data from Baltimore and then adding up emissions for each year in new vector.
## 1) subsetting:
Balti_data <- subset(NEI, NEI$fips == "24510")

head(Balti_data)
dim(Balti_data)  

## 2) Emission adding up 

Balti_data_year <- aggregate(Balti_data$Emissions, by = list(Balti_data$year), sum)

head(Balti_data_year)

## Creating the plot answering the question below?
 ## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## (fips == "24510"\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008?
## Use the base plotting system to make a plot answering this question.


png(filename = "plot2.png")

plot(Balti_data_year$Group.1, Balti_data_year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)", pch = 19, col = "red", lty = 6)

dev.off()

