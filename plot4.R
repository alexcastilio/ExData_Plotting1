plot1 <- function(){
  #read data from file
  data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"))
  
  #filter by data
  data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  #format Date column
  data$Date<-strptime(as.Date(data$Date[],format = "%d/%m/%Y"),format = "%Y-%m-%d")
  
  #open graphics device
  png("plot4.png",width = 480, height = 480)
  
  #Graphs positions
  par(mfrow = c(2,2))
  
  #plot1
  hist(data$Global_active_power,main = "",xlab = "Global Active Power (kilowatts)",col = "red",ylim = c(0,1200))
  
  #plot2
  plot(as.POSIXct(paste(data$Date,data$Time)),data$Voltage,ylab = "Voltage",xlab = "datetime",type="l")
  
  #plot3
  plot(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "n")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_1,type = "l")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_2,col="red",type = "l")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_3,col="blue",type = "l")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=1)
  
  #plot4
  plot(as.POSIXct(paste(data$Date,data$Time)),data$Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime",type="l")
  
  #close PNG
  dev.off()
  
}