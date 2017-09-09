source("GetData.R")

# NEI & SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# The Baltimore emissions data
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

# Plot 2
png("plot2.png",width=480,height=480,units="px",bg="white")
barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Baltimore City"
)
dev.off()
