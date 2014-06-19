## Problem 4
## Across the United States, how have emissions
## from coal combustion-related sources changed
## from 1999-2008?

setwd("~/Exploratory Data Analysis Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcode <- SCC[grepl("coal",SCC[,"EI.Sector"],ignore.case=TRUE),"SCC"]
coalem <- NEI[grepl(coalcode,NEI[,"SCC"]),]
