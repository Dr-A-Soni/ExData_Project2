## Setting correct Working Directory
getwd()

setwd("C://Users/chinks/Downloads/coursera/exdata_data_NEI_data")

## checking whether set correctly?

getwd()

## Reading the Emission data and the Classification code.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC<- readRDS("./Source_Classification_Code.rds")

## Fetching all the records involving Coal from the current directory.

SCC_Coal <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)

head(SCC_Coal)

## Creating a vector Coal with all data relating to Coal in the classification code. 

Coal <- SCC[SCC_Coal, ]

head(Coal)

# Now merging the data from the NEI with the Coal relating information located into the Vector Coal.

NEI_merge_SCC <- merge(NEI, Coal, by = "SCC")

# Cross checking the information. 
dim(NEI_merge_SCC)

## Applying Tapply function to the this new merge and data corresponding to 
# the emission and the year and storing  it into a new vector Emission.

Emission <- tapply(NEI_merge_SCC$Emissions, NEI_merge_SCC$year, sum)

## Creating a barplot which shows the emissions from coal combustion-related sources
# changed from 1999–2008 in the US. 

png(filename = "plot4.png")

barplot(Emission, xlab = "Year", ylab = "Total Emissions PM2.5 Tons", 
        main = "Total Coal Emissions by year", col = c("RED","BLUE","GREEN","YELLOW"))

dev.off()





