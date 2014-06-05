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

##Create Plot 2 as a png file
##open png device, create "plot2.png"
png(file="plot2.png", width=480, height=480, units="px", bg="white")

##specify a line plot, without an x-axis and send to file
plot2<-plot(x=epc_sub$Global_active_power, y=NULL, ylab="Global Active Power (kilowatts)", 
            type="l", xlab="", xaxt="n")
##add a custom x-axis
axis(side=1, at=c(0, 1500, 2900), labels=c("Thu","Fri","Sat"))

##close the device
dev.off() 