## creates the third plot
## path2data is the location of the raw data file
## path2image is the location of the PNG that will be created
## data is the data to be plotted
createPlotThree<-function(path2data, path2image, data = NULL){
  if(is.null(data)){
    ## PLEASE NOTE: Source plot1.R to get the getCleanData function.
    data<-getCleanData(path2data)
  }
  Sys.setlocale("LC_TIME", "English") 
  png(file=path2image,width=480,height=480,units="px",bg = "transparent")
  plot(data$Date, data$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab="")
  lines(data$Date, data$Sub_metering_1)
  lines(data$Date, data$Sub_metering_2, col="red")
  lines(data$Date, data$Sub_metering_3, col="blue")
  legend("topright", col= c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}