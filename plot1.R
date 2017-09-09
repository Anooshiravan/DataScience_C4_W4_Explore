source("GetData.R")

# Load the NEI & SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

# Plot 1
png("plot1.png",width=480,height=480,units="px",bg="white")
barplot(
  (aggTotals$Emissions)/10^6,
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions"
)
dev.off()

