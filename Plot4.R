#Exploratory Data Analysis Course Project 1

#Course project 1 - plot 4 

#load partial file data including desired dates
Power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",nrows=400000)

#Create new Date_Time column by combining Date and Time
Power$Date_Time<-paste(Power$Date, Power$Time, sep=", ")

#Convert class to Date/Time for Date_Time column
Power$Date_Time<-strptime(Power$Date_Time, "%d/%m/%Y, %H:%M:%S")

#Subset for desired dates
Power$Date<-as.character(Power$Date)
Power_sub<-Power[Power$Date %in% c("1/2/2007","2/2/2007"),]

#Convert data to numeric
Power_sub$Global_active_power<-as.character(Power_sub$Global_active_power)
Power_sub$Global_reactive_power<-as.character(Power_sub$Global_reactive_power)
Power_sub$Voltage<-as.character(Power_sub$Voltage)
Power_sub$Sub_metering_1<-as.character(Power_sub$Sub_metering_1)
Power_sub$Sub_metering_2<-as.character(Power_sub$Sub_metering_2)
Power_sub$Sub_metering_3<-as.character(Power_sub$Sub_metering_3)
Power_sub$Global_active_power<-as.numeric(Power_sub$Global_active_power)
Power_sub$Global_reactive_power<-as.numeric(Power_sub$Global_reactive_power)
Power_sub$Voltage<-as.numeric(Power_sub$Voltage)
Power_sub$Sub_metering_1<-as.numeric(Power_sub$Sub_metering_1)
Power_sub$Sub_metering_2<-as.numeric(Power_sub$Sub_metering_2)
Power_sub$Sub_metering_3<-as.numeric(Power_sub$Sub_metering_3)

#creates png file
png(filename="plot4.png",width=480, height=480, units="px")

#plot four graphs
par(mfrow=c(2,2))
par(cex=0.75)
#Plot2
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#new plot - Voltage
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Voltage, type="l",col="black",xlab="",ylab="Voltage"))
title(xlab="datetime")
#Plot3
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Sub_metering_1, type="l",col="black", xlab="",yaxt="n", ylab="Energy sub metering"))
lines(Power_sub$Date_Time,Power_sub$Sub_metering_2,type="l",col="red")
par(new=TRUE)
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Sub_metering_3, type="l",col="blue", xlab="",ylab="",xaxt="n",yaxt="n",ylim=range(Sub_metering_1)))
axis(2,at=c(0,10,20,30))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1)
#new plot - reactive 
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Global_reactive_power, type="l",col="black",xlab="",ylab="Global_reactive_power"))
title(xlab="datetime")

dev.off()

