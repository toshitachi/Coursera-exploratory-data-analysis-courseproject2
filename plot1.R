# Set working directory

getwd()
setwd("C:/Users/Tachibana/Documents/project1/ExploratoryDataAnalysis/exdata_data_NEI_data")

# Read PM2.5 emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC)

# Get the total emissions by year
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
str(aggregatedTotalByYear)


png('plot1.png')

barplot(height=aggregatedTotalByYear$Emissions, 
        names.arg=aggregatedTotalByYear$year, 
        xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions by years'))

dev.off()

