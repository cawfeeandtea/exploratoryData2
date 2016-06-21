#Question 5

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data - Baltimore City
baltsubset <- subset(NEI, NEI$fips=="24510")

#Get SCC codes of motor vehicle related sources and obtain subset data with relevant SCC codes 
submotor <- SCC[grep("Vehicle", SCC$Short.Name), ]
sub2 <- baltsubset[baltsubset$SCC %in% submotor$SCC, ]


#Create plot and save into plot5.png
png('plot5.png')
options(scipen=999)
ggplot(sub2, aes(x = factor(year), y = Emissions))+ geom_bar(stat = "identity") + ggtitle("Total PM2.5 Emissions in Baltimore from Motor Vehicle Sources") + xlab("Years") +ylab("PM2.5 Emissions (tons)")
dev.off()
                            