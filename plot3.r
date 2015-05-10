plot1 <- function(){
  #read data from file
  data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"))
  
  #filter by data
  data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  #format Date column
  data$Date<-strptime(as.Date(data$Date[],format = "%d/%m/%Y"),format = "%Y-%m-%d")
  
  #open graphics device
  png("plot3.png",width = 480, height = 480)
  
  #plot
  plot(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_1,xlab="",ylab = "Energy sub metering",type = "n")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_1,type = "l")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_2,col="red",type = "l")
  points(as.POSIXct(paste(data$Date,data$Time)),data$Sub_metering_3,col="blue",type = "l")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=1)
  
  #close PNG
  dev.off()
  
}