# Set working directory

getwd()
setwd("C:/Users/Tachibana/Documents/project1/ExploratoryDataAnalysis/exdata_data_NEI_data")

# Read PM2.5 emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC)

# Get Baltimore PM2.5 emissions by the years
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
 
# Plot Baltimore PM2.5 emmissions by the years
png('plot2.png')
 
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
 
dev.off()
 