##Get data and download the zip file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="ElectPowCons.zip")

##unzip the file
unzip ("ElectPowCons.zip")

##load data into r
EPC<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".", na.strings="?",)

##convert date from char to date
as.Date(EPC$Date)

##convert time from char to time
strptime(EPC$Time, format="%H:%M:%S")

##subset data for required dates
epc_sub<-subset(EPC, Date=="1/2/2007" | Date=="2/2/2007")

##Create Plot 3 as a png file
png(file="plot3.png", width=480, height=480, units="px", bg="white")##open png

##specify a line plot, without an x-axis or y-axis
plot(x=epc_sub$Sub_metering_1,y=NULL, type="l", ylab="Energy sub metering", xlab="", xaxt="n",yaxt="n")

##add custom x axis & y axis
axis(side=2, at=c(0, 10, 20, 30))
axis(side=1, at=c(0, 1500, 2900), labels=c("Thu","Fri","Sat"))

##add second line
lines(x=epc_sub$Sub_metering_2, y=NULL, type="l", col="red",
      xlab="",xaxt="n", yaxt="n")

##add third line
lines(x=epc_sub$Sub_metering_3, y=NULL, pch="l", col="blue",
      xlab="", xaxt="n", yaxt="n")

##add the legend
legend("topright", lty=c(1,1,1), col=c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

##close the device
dev.off() 