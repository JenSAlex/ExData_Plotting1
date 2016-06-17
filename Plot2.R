Install.packages("lubridate")
library(lubridate)
library(grDevices)

##Read Data

alldata<-read.table("household_power_consumption.txt",
                    comment.char="",
                    blank.lines.skip=TRUE,
                    sep=";",
                    header=TRUE,
                    row.names = NULL,
                    na.strings="?", 
                    col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

##Create subset
alldata<-subset(alldata,Date=="2/2/2007"|Date=="1/2/2007")

##Convert date to date data type
alldata$rDate<-as.Date(alldata$Date,"%d/%m/%Y")

##Convert time to time data type
alldata$rTime<-strptime(paste(alldata$Date, alldata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

##Graph2
png(filename="plot2.png",width=480,height=480,units = "px")

plot(alldata$rTime,alldata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
