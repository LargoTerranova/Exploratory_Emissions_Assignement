###############################################################################
#Question 2
###############################################################################
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base 
plotting system to make a plot answering this question.


#Read in Data
setwd("C:/...")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")



#Plot per year
#Subset Data
baltimore      <- subset(nei, fips == "24510")
#Get summaries with tapply
baltimore_year <- tapply(baltimore$Emissions/1000, INDEX = baltimore$year, sum)
#Plot the Graph
barplot(baltimore_year,
        ylab = "Emissions PM2.5 (in tonnes)",
        xlab = "Year",
        main = "Total Emissions of PM25 in Baltimore per year",
        col  = c("red","orange","yellow","khaki"))



#Save File
dev.copy(png, file="Plot_2.png", height=480, width=480)
dev.off()

