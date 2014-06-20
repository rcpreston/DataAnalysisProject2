## Problem 6
## Compare emissions from motor vehicle sources in 
## Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California 
## (fips == "06037"). Which city has seen greater 
## changes over time in motor vehicle emissions?

setwd("~/git_repos/DataAnalysisProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorcode <- SCC[grepl("Mobile - On-Road",SCC[,"EI.Sector"],ignore.case=TRUE),"SCC"]
ladat <- NEI[NEI[,"fips"]=="06037",]
baltdat <- NEI[NEI[,"fips"]=="24510",]

baltem <- subset(baltdat,SCC %in% motorcode)
laem <- subset(ladat,SCC %in% motorcode)

baltem <- aggregate(Emissions~year,data=baltem,FUN=sum)
laem <- aggregate(Emissions~year,data=laem,FUN=sum)

png(file="plot6.png",height=450,width=450)

plot(y=laem$Emissions,x=laem$year,col="red",type="o",
     main="Motor Vehicle Emissions in LA and Baltimore",xlab="Year",
     ylab="PM2.5 Motor Vehicle Emissions",
     ylim=c(min(baltem$Emissions),max(laem$Emissions)+500))
lines(y=baltem[,"Emissions"],x=baltem$year,type="o",col="blue")
legend("topleft",c("Baltimore","LA"),cex=.6,col=c("blue","red"),lty=c(1,1))

dev.off()
