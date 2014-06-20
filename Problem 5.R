## Problem 5
## How have emissions from motor vehicle sources
## changed from 1999-2008 in Baltimore City?

# Get to my working directory and read in the data
setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get a subset of the SCC codes that pertain to motor vehicles
motorcode <- SCC[grepl("Mobile - On-Road",as.character(SCC$EI.Sector),ignore.case=TRUE),"SCC"]

# Take the subset of NEI data that pertains to Baltimore and then take the subset of
# that data that matches the motor vehicle SCC codes
motorem <- subset(NEI[NEI[,"fips"]=="24510",],SCC %in% motorcode)
# Sum the emissions data by year
motorem <- aggregate(Emissions~year,data=motorem,FUN=sum)

# Write plot to a png file
png(file="plot5.png",height=450,width=450)

barplot(height=motorem[,"Emissions"],names.arg=c(1999,2002,2005,2008),
        xlab="Year", ylab="Total Emissions from PM2.5",
        main="Emissions for chosen years",log="")

dev.off()