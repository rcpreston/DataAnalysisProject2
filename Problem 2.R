## Problem 2
## Have total emissions from PM2.5 decreased in the 
## Baltimore City, Maryland (fips == "24510") from 
## 1999 to 2008? Use the base plotting system to make
## a plot answering this question.

# Get to my working directory and read in the data
setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get specifically the baltimore data
baltem <- NEI[NEI[,"fips"]=="24510",]

#Sum the baltimore emissions by year
balty <- aggregate(Emissions~year,data=baltem,FUN=sum)

# write the plot to a png
png(file="plot2.png",height=450,width=450)

barplot(height=balty[,"Emissions"],names.arg=c(1999,2002,2005,2008),
        xlab="Year", ylab="Total Emissions from PM2.5 in Baltimore",
        main="Emissions from 1999 to 2008",log="")


dev.off()