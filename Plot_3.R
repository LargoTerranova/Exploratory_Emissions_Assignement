###############################################################################
#Question 3
##############################################################################
#Question
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four 
sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions 
from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)


#Read in Data
setwd("C:/...")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")


#Subset Data
baltimore      <- subset(nei, fips == "24510")


#Plot Graph
ggplot(baltimore, aes(factor(year), Emissions, fill=type))+
        geom_bar(aes(fill=type), stat = "identity")+
        theme_light()+
        guides(fill=FALSE)+
        facet_grid(.~type, scales="free_y", space = "free")+
        labs(x="Year", y=expression("Total PM"[2.5]* " Emissions (in tons)"))+
        labs(title=("PM25 Emissions in Baltimore (per type)"))



#Save File
dev.copy(png, file="Plot_3.png", height=480, width=960)
dev.off()

#Answer 1
From the four types, three have seen decreases: 1. Non-Road, 2.NonPoint, 3.OnRoad,

#Answer 2
One type "point" increased between 1999 and 2005 and then fell considerably in 2008.




