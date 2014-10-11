#Exploratory Data Analysis Course Project 1

#Course project 1 - plot 2

#load partial file data including desired dates
Power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",nrows=400000)

#Create new Date_Time column by combining Date and Time
Power$Date_Time<-paste(Power$Date, Power$Time, sep=", ")

#Convert class to Date/Time for Date_Time column
Power$Date_Time<-strptime(Power$Date_Time, "%d/%m/%Y, %H:%M:%S")

#Subset for desired dates
Power$Date<-as.character(Power$Date)
Power_sub<-Power[Power$Date %in% c("1/2/2007","2/2/2007"),]

#Plot graph in png file for plot2
Power_sub$Global_active_power<-as.character(Power_sub$Global_active_power)
Power_sub$Global_active_power<-as.numeric(Power_sub$Global_active_power)
Power_sub[Power_sub=="?"]<-NA
par(cex=0.75)
png(filename="plot2.png",width=480, height=480, units="px")
with(Power_sub, plot(Power_sub$Date_Time, Power_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
