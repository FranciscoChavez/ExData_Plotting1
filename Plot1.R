## Exploratory Data Analysis
## Assigment #1: Course Project 1
## By. Francisco J. Chavez
## Plot1.R


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

##electricData$dateTime <- as.POSIXct(dateTime, format="%Y-%m-%d-%H.%M.%S")

hist(electricData$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
