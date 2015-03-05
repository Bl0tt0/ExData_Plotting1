## creates the second plot
## path2data is the location of the raw data file
## path2image is the location of the PNG that will be created
## data is the data to be plotted
createPlotTwo<-function(path2data, path2image, data = NULL){
  if(is.null(data)){
    ## PLEASE NOTE: Source plot1.R to get the getCleanData function.
    data<-getCleanData(path2data)
  }
  Sys.setlocale("LC_TIME", "English") 
  png(file=path2image,width=480,height=480)
  plot(data$Date, data$Global_active_power,type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(data$Date, data$Global_active_power)
  dev.off()
}