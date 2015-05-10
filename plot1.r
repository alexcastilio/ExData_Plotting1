plot1 <- function(){
  #read data from file
  data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric","numeric"))
  
  #filter by data
  data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  #format Date column
  data$Date<-strptime(as.Date(data$Date[],format = "%d/%m/%Y"),format = "%Y-%m-%d")
  
  #open graphics device
  png("plot1.png",width = 480, height = 480)
  
  #histogram
  hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red",ylim = c(0,1200))
  
  #close PNG
  dev.off()
  
}