#Question 1 

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")

#Get total amount of emissions from each yr
sum1999 <- sum(NEI[NEI$year=="1999", "Emissions"])
sum2002 <- sum(NEI[NEI$year=="2002", "Emissions"])
sum2005 <- sum(NEI[NEI$year=="2005", "Emissions"])
sum2008 <- sum(NEI[NEI$year=="2008", "Emissions"])
years = c(sum1999,sum2002,sum2005,sum2008)
yearslabel = c("1999","2002","2005","2008")

#Create plot and save to file plot1.png
png('plot1.png', width=480, height=480)
options(scipen=999)
barplot(years, col="black", names.arg = yearslabel, xlab="Year", ylab="total PM2.5 emitted (tons)", main="Total PM2.5 Emissions in US from 1999 to 2008")
dev.off()