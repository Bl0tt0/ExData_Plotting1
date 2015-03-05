## creates the first plot
## path2data is the location of the raw data file
## path2image is the location of the PNG that will be created
## data is the data to be plotted
createPlotOne <- function(path2data, path2image, data = NULL){
  if(is.null(data)){
    data<-getCleanData(path2data)
  }
  png(file=path2image,width=480,height=480)
  hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
  dev.off()
}

## reads the data from the .txt file and filters the relevant data
getCleanData<-function(path2data){
  ## read the data
  data <- read.csv(path2data, sep = ';', na.strings=c("?"))
  
  ## parse date and times
  data <- mutate(data, Date =as.POSIXct(paste(Date, Time), tz="GMT", format= "%d/%m/%Y %H:%M:%S"))
  
  ## filter relevant days
  data<-filter(data, year(Date)==2007, month(Date)==2, day(Date)==1|day(Date)==2)
  
  data
}