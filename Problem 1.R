## Problem 1
## Have total emissions from PM2.5 decreased in the 
## United States from 1999 to 2008? Using the base 
## plotting system, make a plot showing the total 
## PM2.5 emission from all sources for  each of the 
## years 1999, 2002, 2005, and 2008.

setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vecem <- aggregate(Emissions~year,data=NEI,FUN=sum)

png(file="plot1.png",height=450,width=450)

barplot(height=vecem[,"Emissions"],names.arg=c(1999,2002,2005,2008),
        xlab="Year", ylab="Total Emissions from PM2.5",
        main="Emissions for chosen years",log="")

dev.off()