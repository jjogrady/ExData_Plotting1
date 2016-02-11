##Set Working Directory
(WD <- getwd())
if (!is.null(WD)) setwd(WD)
##Download Zip File from URL
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
##Extract Zip File to Working Directory
if (!file.exists(householdFile)) {
        download.file(downloadURL, downloadFile)
        unzip(downloadFile, overwrite = T, exdir = "./Data")
}
##Pull Extracted Data into a Table
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
##Set Time to Between "2/1/2007 and 2/2/2007"
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##Generate Plot 2 and Save as PNG
png(filename="plot2.png")
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()