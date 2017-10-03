###############################################################################
#Question 6
###############################################################################
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles 
County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)


#Read in Data
setwd("C:/...")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Search for Motor Vehicle source
sub_vehicles        <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)


#Subset the scc and nei data
sub_vehicles_scc    <- SCC[sub_vehicles, ]$SCC
sub_vehicles_nei    <- NEI[NEI$SCC %in% sub_vehicles_scc, ]


#Subset for Cities
#Baltimore
sub_vehicle_balt    <- sub_vehicles_nei[sub_vehicles_nei$fips=="24510", ]
#LA
sub_vehicle_LA      <- sub_vehicles_nei[sub_vehicles_nei$fips=="06037", ] 


#Adding city names
sub_vehicle_balt$city <- "Baltimore"  
sub_vehicle_LA$city   <- "LosAngeles"


#Merge Data
sub_balt_la         <-rbind(sub_vehicle_balt, sub_vehicle_LA) 


#Plot
ggplot(sub_balt_la, aes(factor(year), Emissions, fill=city)) + 
        geom_bar(stat = "identity") + 
        theme_light() + 
        facet_grid(.~city) + 
        guides(fill=FALSE) +
        labs(x="Year",
             y="Emissions of pm25 in tons",
             title="Emissions of pm25 between 1999-2008")


#Save File
dev.copy(png, file="Plot_6.png", height=700, width=900)
dev.off()





