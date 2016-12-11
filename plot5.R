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

# Get the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510')
BaltimoreVehicle <- NEI[NEI$type == 'ON-ROAD' & NEI$fips == '24510', ]

# Get the total Baltimore emissions from motor vehicle sources by year
BaltimoreVehicleYear <- aggregate(Emissions ~ year, data = BaltimoreVehicle, FUN = sum)

# Open png device

png(filename='plot5.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)
with(BaltimoreVehicleYear, {
  
  plot(year, Emissions, type = 'b',
       
       xlab="Year",
       
       ylab="PM'[2.5]*' Emissions (tons)",
       
       main="PM'[2.5]*' Emissions from motor vehicle sources in Baltimore City")
  
})

# Close png device
dev.off()


