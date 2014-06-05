##load data into r
EPC<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".", na.strings="?",)

##convert date from char to date
as.Date(EPC$Date)

##convert time from char to time
strptime(EPC$Time, format="%H:%M:%S")

##subset data for required dates
epc_sub<-subset(EPC, Date=="1/2/2007" | Date=="2/2/2007")


##open png device, create "plot4.png"
png(file="plot4.png", width=480, height=480, units="px", bg="white")

##set up the canvas for the plots
par(mfcol=c(2,2))

##add first plot upper left
##specify a line plot, without an x-axis and send to file
plot2<-plot(x=epc_sub$Global_active_power, y=NULL, ylab="Global Active Power", 
            type="l", xlab="", xaxt="n")
##add a custom x-axis
axis(side=1, at=c(0, 1500, 2900), labels=c("Thu","Fri","Sat"))

##add second plot lower left
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
legend("topright", lty=c(1,1,1), bty="n", col=c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

##add third plot upper right
##specify a line plot
plot(x=epc_sub$Voltage,y=NULL, type="l", ylab="Voltage", xlab="datetime", xaxt="n")

##add custom x axis & y axis
axis(side=2, at=c(0, 10, 20, 30))
axis(side=1, at=c(0, 1500, 2900), labels=c("Thu","Fri","Sat"))

##add fourth plot lower right
##specify a line plot
plot(x=epc_sub$Global_reactive_power,y=NULL, ylab="Global_reactive_power", type="l", xlab="datetime", xaxt="n")

##add custom x axis & y axis
axis(side=2, at=c(0, 10, 20, 30))
axis(side=1, at=c(0, 1500, 2900), labels=c("Thu","Fri","Sat"))

##close the device
dev.off() 


