#Question 3

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")

#Subset data - Baltimore City
baltsubset <- subset(NEI, NEI$fips=="24510")

#Create plot and save into plot3.png
png('plot3.png')
qplot(year, Emissions, data = baltsubset, facets= . ~ type, geom = c("point","smooth"), method="lm", xlab="Year", ylab="PM2.5 Emissions (tons)", main="Emission Trends in Baltimore City by Source Type") + geom_point(aes(color=type))
dev.off()