
## Exploratory Data Analysis
## Assigment #1: Course Project 1
## By. Francisco J. Chavez
## Plot2.R


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

## Create Plot 2
plot.new()
ax.dt <- seq(as.POSIXct("2017-02-01 0:00:00 EDT"),
             as.POSIXct("2017-02-28 0:00:00 EDT"), by=86400)
axis(side=1, at=ax.dt, labels=weekdays(ax.dt), line=2)
plot(electricData$Global_active_power ~ electricData$dateTime, xlab="" , type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
