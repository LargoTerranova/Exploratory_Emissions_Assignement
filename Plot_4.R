###############################################################################
#Question 4
###############################################################################
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?


library(ggplot2)


#Read in Data
setwd("C:/...")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")


#Search for coal
scc_coal        <- scc[grepl("coal", scc$Short.Name, ignore.case = TRUE), ]
#Merge Data
emissions_coal  <- merge(nei, scc_coal, by="SCC")


#Aggregate Emissions
emission_coal_2 <- aggregate(emissions_coal[, "Emissions"]/1000, by=list(emissions_coal$year), sum)
#Combine Data
colnames(emission_coal_2) <- c("year", "Emissions")


#Plot Graph
ggplot(emission_coal_2, aes(x=year, y=Emissions)) +
        geom_bar(stat="identity") +
        theme_light() +
        labs(x="Year", y="Emission of pm25 in kilotons") +
        ggtitle("Total Emissions from coal 1999-2008")



#Save File
dev.copy(png, file="Plot_4.png", height=480, width=480)
dev.off()


#Answer
Yes, emissions from coal combustion related sources have decreasd between 1999 and 2008




