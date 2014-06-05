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


##Create Plot 1 as a png file
##open png device, create "plot1.png"
png(file="plot1.png", width=480, height=480, units="px", bg="white") 
##create plot and send to file
hist(epc_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off() ##close the device