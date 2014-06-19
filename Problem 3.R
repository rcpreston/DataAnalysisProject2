## Problem 3
## Of the four types of sources indicated by 
## the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen 
## decreases in emissions from 1999-2008 for 
## Baltimore City? Which have seen increases in
## emissions from 1999-2008? Use the ggplot2 
## plotting system to make a plot answer this question.

setwd("~/Exploratory Data Analysis Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltem <- NEI[NEI[,"fips"]=="24510",]

balt99 <- baltem[baltem[,"year"]==1999,]
balt99p <- balt99[balt99[,"type"]=="POINT","Emissions"]
balt99np <- balt99[balt99[,"type"]=="NONPOINT","Emissions"]
balt99r <- balt99[balt99[,"type"]=="ON-ROAD","Emissions"]
balt99nr <- balt99[balt99[,"type"]=="NON-ROAD","Emissions"]

balt02 <- baltem[baltem[,"year"]==2002,]
balt02p <- balt02[balt02[,"type"]=="POINT","Emissions"]
balt02np <- balt02[balt02[,"type"]=="NONPOINT","Emissions"]
balt02r <- balt02[balt02[,"type"]=="ON-ROAD","Emissions"]
balt02nr <- balt02[balt02[,"type"]=="NON-ROAD","Emissions"]

balt05 <- baltem[baltem[,"year"]==2005,]
balt05p <- balt05[balt05[,"type"]=="POINT","Emissions"]
balt05np <- balt05[balt05[,"type"]=="NONPOINT","Emissions"]
balt05r <- balt05[balt05[,"type"]=="ON-ROAD","Emissions"]
balt05nr <- balt05[balt05[,"type"]=="NON-ROAD","Emissions"]

balt08 <- baltem[baltem[,"year"]==2008,]
balt08p <- balt08[balt08[,"type"]=="POINT","Emissions"]
balt08np <- balt08[balt08[,"type"]=="NONPOINT","Emissions"]
balt08r <- balt08[balt08[,"type"]=="ON-ROAD","Emissions"]
balt08nr <- balt08[balt08[,"type"]=="NON-ROAD","Emissions"]

balt99 <- c(sum(balt99p),sum(balt99np),sum(balt99r),sum(balt99nr))
balt02 <- c(sum(balt02p),sum(balt02np),sum(balt02r),sum(balt02nr))
balt05 <- c(sum(balt05p),sum(balt05np),sum(balt05r),sum(balt05nr))
balt08 <- c(sum(balt08p),sum(balt08np),sum(balt08r),sum(balt08nr))

baltab <- cbind(balt99,balt02,balt05,balt08)
baltab <- data.frame(baltab,row.names=c("Point","Nonpoint","Onroad","Nonroad"))
yr <- c(1999,2002,2005,2008)

qplot(Point,yr,baltab)

