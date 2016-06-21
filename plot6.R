#Question 6

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data - Baltimore City and LA
NEI <- mutate(NEI, fips = factor(fips,c("06037","24510"),c("LA", "Baltimore")))
lasubset <- subset(NEI, NEI$fips=="LA")
baltsubset <- subset(NEI, NEI$fips=="Baltimore")

#Get SCC codes of motor vehicle sources and obtain subset data with relevant SCC codes 
submotor <- SCC[grep("Vehicle", SCC$Short.Name), ]
lavals <- lasubset[lasubset$SCC %in% submotor$SCC, ]
baltvals <- baltsubset[baltsubset$SCC %in% submotor$SCC, ]
merge <- rbind(lavals, baltvals)

#Create plot and save into plot6.png
png('plot6.png')
ggplot(merge,aes(x=factor(year),y=Emissions,fill=factor(fips)), color=factor(fips), labels=c("LA", "Balt")) +  
  stat_summary(fun.y=mean,position=position_dodge(),geom="bar") + labs(title="Total PM2.5 Emissions from Vehicle Sources in LA and Baltimore", fill = "City") 
dev.off()


