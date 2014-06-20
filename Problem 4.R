## Problem 4
## Across the United States, how have emissions
## from coal combustion-related sources changed
## from 1999-2008?

setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcode <- SCC[grepl("coal",SCC[,"EI.Sector"],ignore.case=TRUE),"SCC"]
coalem <- subset(NEI,SCC %in% coalcode)

coalem <- aggregate(Emissions~year,data=coalem,FUN=sum)

barplot(height=coalem[,"Emissions"],names.arg=c(1999,2002,2005,2008),
        xlab="Year", ylab="Total Emissions from PM2.5",
        main="Emissions for chosen years",log="")
