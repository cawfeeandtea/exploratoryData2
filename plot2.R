#Question 2

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")

#Subset data - Baltimore City
baltsubset <- subset(NEI, NEI$fips=="24510")

#Get total amount of emissions from each yr
sum1999 <- sum(baltsubset[baltsubset$year=="1999", "Emissions"])
sum2002 <- sum(baltsubset[baltsubset$year=="2002", "Emissions"])
sum2005 <- sum(baltsubset[baltsubset$year=="2005", "Emissions"])
sum2008 <- sum(baltsubset[baltsubset$year=="2008", "Emissions"])
years = c(sum1999,sum2002,sum2005,sum2008)
yearslabel = c("1999","2002","2005","2008")

#Create plot and save to file plot2.png
png('plot2.png')
plot(years, type="b", xlab="Year", ylab="total PM2.5 emitted (tons)", main="Total PM2.5 Emissions in Baltimore City from 1999 to 2008", xaxt = "n")
axis(1, 1:4, labels = yearslabel)
dev.off()