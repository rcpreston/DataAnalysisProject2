## Problem 3
## Of the four types of sources indicated by 
## the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen 
## decreases in emissions from 1999-2008 for 
## Baltimore City? Which have seen increases in
## emissions from 1999-2008? Use the ggplot2 
## plotting system to make a plot answer this question.

# Get to my working directory and read in the data
setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get specifically the baltimore data
baltem <- NEI[NEI[,"fips"]=="24510",]

# Get the point data and sum it by year
bpoint <- baltem[baltem[,"type"]=="POINT",]
bpoint <- aggregate(Emissions~year,data=bpoint,FUN=sum)

# Get the nonpoint data and sum it by year
bnonpoint <- baltem[baltem[,"type"]=="NONPOINT",]
bnonpoint <- aggregate(Emissions~year,data=bnonpoint,FUN=sum)

# Get the onroad data and sum it by year
broad <- baltem[baltem[,"type"]=="ON-ROAD",]
broad <- aggregate(Emissions~year,data=broad,FUN=sum)

# Get the nonroad data and sum it by year
bnonroad <- baltem[baltem[,"type"]=="NON-ROAD",]
bnonroad <- aggregate(Emissions~year,data=bnonroad,FUN=sum)

# Make a data frame for plotting
type <- c("Point","Point","Point","Point",
          "Nonpoint","Nonpoint","Nonpoint","Nonpoint",
          "Onroad","Onroad","Onroad","Onroad",
          "Nonroad","Nonroad","Nonroad","Nonroad")

baltab <- rbind(bpoint,bnonpoint,broad,bnonroad)
baltab <- cbind(baltab,type)
baltab <- data.frame(baltab)

# Write plot to png file
png(file="plot3.png",height=450,width=450)

ggplot(baltab,aes(x=type,y=Emissions,fill=type,ylab="PM2.5 Emissions")) + 
  geom_bar(stat="identity",position="dodge") +facet_grid(.~year)

dev.off()