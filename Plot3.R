
## Exploratory Data Analysis
## Assigment #1: Course Project 1
## By. Francisco J. Chavez
## Plot3.R


getwd()
##setwd("CD:/OneDrive/School, Training and Education/CourseRA/Data Science Certification/4. Exploratory Data Analysis/Week1/household_power_consumption")

setwd("c:\\Temp\\data")
getwd()

electricData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                           colClasses= c('character', 'character', 'numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))

electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

electricData <- subset(electricData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

electricData <- electricData[complete.cases(electricData),]

dateTime <- paste(electricData$date, electricData$Time)

dateTime <- setNames(dateTime, "DateTime")

electricData <- electricData[ , !(names(electricData) %in% c("Date", "Time"))]

electricData <- cbind(dateTime, electricData)

## Create Plot 3
with(electricData, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
