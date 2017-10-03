###############################################################################
#Question 5
###############################################################################
5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)


#Read in Data
setwd("C:/...")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



#Fetch all rows withthe term "vehicle"
sub_vehicles        <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)

#Subset the scc and nei data
sub_vehicles_scc    <- SCC[sub_vehicles, ]$SCC
sub_vehicles_nei    <- NEI[NEI$SCC %in% sub_vehicles_scc, ]

#Subset for Baltimroe
sub_vehicle_balt    <- sub_vehicles_nei[sub_vehicles_nei$fips==24510, ] 

#Plot Graph
ggplot(sub_vehicle_balt, aes(factor(year), Emissions)) +
        geom_bar(stat = "identity", fill= "grey", width = 0.75) +
        theme_light() +
        guides(fill=FALSE) +
        labs(x="Year",
             y="Total PM25 Emissions",
             title="Total PM25 Motor Vehicle Emission in Baltimore from 1999-2008")


#Save File
dev.copy(png, file="Plot_5.png", height=480, width=480)
dev.off()


#Answer
Yes, Emissions from Motor vehicle sources have decreased between 1999 and 2008

