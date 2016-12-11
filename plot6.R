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

# Get the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510') and Los Angeles (fips code: '06037')
CityEmissions <- NEI[NEI$type == 'ON-ROAD' & NEI$fips %in% c('24510', '06037'), ]

# Get the total emissions for Baltimore City and Los Angeles, grouped by year and city
CityEmissionsYear <- aggregate(Emissions ~ year + fips, data = CityEmissions, FUN = sum)

# Add city names for use in the plot

CityEmissionsYear$city = CityEmissionsYear$fips

CityEmissionsYear[which(CityEmissionsYear$fips == '24510'), 'city'] = 'Baltimore City'

CityEmissionsYear[which(CityEmissionsYear$fips == '06037'), 'city'] = 'Los Angeles'

# Open png device
png(filename='plot6.png', width=640, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)
plot6 <- qplot(year, Emissions, data=CityEmissionsYear, facets = . ~ fips) +  
  
  geom_line() +
  
  xlab("Year") +
  
  ylab('Total PM'[2.5]*' Emissions (tons)') +
  
  ggtitle('Total PM'[2.5]*' Emissions in Los Angeles and Baltimore City')

print(plot6)

# Close png device
dev.off()