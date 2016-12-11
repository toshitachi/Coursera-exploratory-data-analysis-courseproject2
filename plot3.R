# Set working directory

getwd()
setwd("C:/Users/Tachibana/Documents/project1/ExploratoryDataAnalysis/exdata_data_NEI_data")

# Set ggplot2
library(ggplot2)

# Read PM2.5 emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC)

# Get Baltimore PM2.5 emissions by the types and years
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ type+year, subsetNEI, sum)

# Plot Baltimore PM2.5 emmissions by the type and the years
png('plot3.png')

qplot(year, Emissions, data = aggregatedTotalByYear, color = type, geom= "line")+ ggtitle("Total PM'[2.5]*' Emissions in the Baltimore County by Source Type") + xlab("Year") + ylab("PM'[2.5]*' Emissions")       


dev.off()

