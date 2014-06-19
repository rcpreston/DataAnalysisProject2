## Problem 1
## Have total emissions from PM2.5 decreased in the 
## United States from 1999 to 2008? Using the base 
## plotting system, make a plot showing the total 
## PM2.5 emission from all sources for  each of the 
## years 1999, 2002, 2005, and 2008.

setwd("~/Exploratory Data Analysis Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

em1999 <- NEI[NEI[,"year"]==1999,"Emissions"]
em2002 <- NEI[NEI[,"year"]==2002,"Emissions"]
em2005 <- NEI[NEI[,"year"]==2005,"Emissions"]
em2008 <- NEI[NEI[,"year"]==2008,"Emissions"]

vecem <- c(sum(em1999),sum(em2002),sum(em2005),sum(em2008))
vecyear <- c(1999,2002,2005,2008)

plot(x=vecyear,y=vecem,type="b",xlab="Year",
     ylab="Total Emissions from PM2.5",
     main="Emissions for chosen years",lwd=5)

