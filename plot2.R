##load the data from website
setwd("F:/R-3.5.1/coursera")
if(!file.exists("data")){dir.create("data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/power_consumption.zip")
unzip("./data/power_consumption.zip",exdir="./data")

##read the data into R
files<-"./data/household_power_consumption.txt"
dataraw<-read.table(files,sep=";",header=TRUE, dec=".", na.strings="?")
data<-dataraw[dataraw$Date %in% c("1/2/2007","2/2/2007"),]

##plot2
##convert date and time to specific format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
##plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##close device
dev.off()
