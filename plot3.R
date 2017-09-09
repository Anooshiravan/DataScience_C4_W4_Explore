source("GetData.R")

# NEI & SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

# Plot 3
png("plot3.png",width=480,height=480,units="px",bg="white")
library(ggplot2)
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM 2.5, Baltimore 1999-2008"))
print(ggp)
dev.off()

