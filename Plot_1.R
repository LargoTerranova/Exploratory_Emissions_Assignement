###############################################################################
#Question 1
###############################################################################
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot 
showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


#Read in Data
setwd("C:/...")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")



#Plot per year
#Get summaries with tapply
emm_year <- tapply(nei$Emissions/1000000, INDEX = nei$year, sum)
#Plot the Graph
barplot(emm_year,
        ylab = "Emissions PM2.5 (in Million tonnes)",
        xlab = "Year",
        main = "Total Emissions of PM25 in US per year",
        col  = c("red","orange","yellow","khaki"))



#Save File
dev.copy(png, file="Plot_1.png", height=480, width=480)
dev.off()
