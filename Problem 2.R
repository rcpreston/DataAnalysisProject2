## Problem 2
## Have total emissions from PM2.5 decreased in the 
## Baltimore City, Maryland (fips == "24510") from 
## 1999 to 2008? Use the base plotting system to make
## a plot answering this question.

setwd("~/Exploratory Data Analysis Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltem <- NEI[NEI[,"fips"]=="24510",]
balt99 <- baltem[baltem[,"year"]==1999,"Emissions"]
balt02 <- baltem[baltem[,"year"]==2002,"Emissions"]
balt05 <- baltem[baltem[,"year"]==2005,"Emissions"]
balt08 <- baltem[baltem[,"year"]==2008,"Emissions"]

balty <- c(sum(balt99),sum(balt02),sum(balt05),sum(balt08))
baltx <- c(1990,2002,2005,2008)

plot(x=baltx,y=balty,type="b",xlab="Year",
     ylab="Total Emissions from PM2.5 in Baltimore",
     main="Emissions from 1999 to 2008",lwd=5)


