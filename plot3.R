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

##plot3
##convert date and time to specific format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data$Global_active_power)
png("plot3.png", width=480, height=480)
##subset the sub_metering data
subMetering1<-as.numeric(data$Sub_metering_1)
subMetering2<-as.numeric(data$Sub_metering_2)
subMetering3<-as.numeric(data$Sub_metering_3)
##plot figures
plot(datetime, subMetering1, type="l", xlab="", ylab="Engery Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
##legend
legend("topright",col=c("black","red","blue"), lty=1, lwd=2.5,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##close device
dev.off()
