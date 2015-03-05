## creates the fourth plot
## path2data is the location of the raw data file
## path2image is the location of the PNG that will be created
## data is the data to be plotted
createPlotFour<-function(path2data, path2image, data = NULL){
  if(is.null(data)){
    ## PLEASE NOTE: Source plot1.R to get the getCleanData function.
    data<-getCleanData(path2data)
  }
  Sys.setlocale("LC_TIME", "English") 
  png(file=path2image,width=480,height=480)
  par(mfcol = c(2,2))
  with(data,{
    ## first plot
    plot(Date, Global_active_power,type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
    lines(Date, Global_active_power)
    
    ## second plot
    plot(Date, Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab="")
    lines(Date, Sub_metering_1)
    lines(Date, Sub_metering_2, col="red")
    lines(Date, Sub_metering_3, col="blue")
    legend("topright", col= c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
    
    ## third plot
    plot(Date, Voltage,type = "n", ylab = "Voltage", xlab="datetime")
    lines(Date, Voltage)
    
    ## fourth plot
    plot(Date, Global_reactive_power,type = "n", ylab = "Global_reactive_power", xlab="datetime")
    lines(Date, Global_reactive_power)
  })
  dev.off()
}