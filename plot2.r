plot1 <- function(){
  #read data from file
  data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"))
  
  #filter by data
  data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  #format Date column
  data$Date<-strptime(as.Date(data$Date[],format = "%d/%m/%Y"),format = "%Y-%m-%d")
  
  #open graphics device
  png("plot2.png",width = 480, height = 480)
  
  #plot
  plot(as.POSIXct(paste(data$Date,data$Time)),data$Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
  
  #close PNG
  dev.off()
  
}