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

# Use the 'Short.Name' field to find the coal combustion-related sources
SCC.Coal <- SCC[grep('coal', SCC$Short.Name), ]
# Get the emissions from coal combustion-related sources
Coal.Emission <- NEI[NEI$SCC %in% SCC.Coal$SCC, ]
# Get the total emissions from coal combustion-related sources by year
Coal.EmissionYears <- aggregate(Emissions ~ year, data = Coal.Emission, FUN = sum)

# Open png device
png(filename='plot4.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)
with(Coal.EmissionYears, {
  
  plot(year, Emissions, type = 'b',
       
       xlab="Year",
       
       ylab="PM'[2.5]*' Emissions (tons)",
       
       main="PM'[2.5]*' Emissions from coal combustion sources in U.S.A.")
  
})


# Close png device

dev.off()



