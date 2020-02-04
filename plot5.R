## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

## Merging both the summary and the classification code and saving it into a new vector NEISCC.

NEISCC <- merge(NEI, SCC, by="SCC")

# loading the ggplot2 package.
library(ggplot2)

## Creating a vector NEI_Car with data pertaining to the emission from the motor vehical sources
 # on road in year 1999-2008 in baltimore city. 

NEI_Car <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

CARS <- aggregate(Emissions ~ year, NEI_Car, sum)

# Creating a plot which shows the emission from the motor vehical in Baltimore city from the year
# 1999-2008 which are on road. 

png("plot5.png", width=840, height=480)

g <- ggplot(CARS, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
