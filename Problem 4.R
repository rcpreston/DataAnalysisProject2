## Problem 4
## Across the United States, how have emissions
## from coal combustion-related sources changed
## from 1999-2008?

# Get to my working directory and read in the data
setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find all SCC codes that pertain to coal
coalcode <- SCC[grepl("coal",SCC[,"EI.Sector"],ignore.case=TRUE),"SCC"]
# Get NEI files that match coal SCC codes
coalem <- subset(NEI,SCC %in% coalcode)

# Sum the coal data by year
coalem <- aggregate(Emissions~year,data=coalem,FUN=sum)

# Write the plot to a png file
png(file="plot4.png",height=450,width=450)

barplot(height=coalem[,"Emissions"],names.arg=c(1999,2002,2005,2008),
        xlab="Year", ylab="Total Emissions from PM2.5",
        main="Emissions for chosen years",log="")

dev.off()