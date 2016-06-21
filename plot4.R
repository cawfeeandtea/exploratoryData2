#Question 4

#Read in data from files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get SCC codes of Coal and and Comb related sources and obtain subset data with relevant SCC codes 
subcoal <- SCC[grep("Coal", SCC$EI.Sector), ]
subcoalcomb <- subcoal[grep("Comb", subcoal$EI.Sector), ]
vals <- NEI[NEI$SCC %in% subcoalcomb$SCC, ]

#Create plot and save into plot4.png
png('plot4.png')
ggplot(vals, aes(x = factor(year), y = Emissions))+ geom_bar(stat = "identity") + ggtitle("Total PM2.5 Emissions in US from Coal-Combustion Sources") + xlab("Years") +ylab("PM2.5 Emissions (tons)")
dev.off()

