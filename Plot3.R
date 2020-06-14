# Downloaded the "dplyr" package that will help us to structure the data with the code "tbl_df" 
library(dplyr) 

# modify the directory address with the code 'setwd'.
setwd("C:/Users/DANIEL/Documents/GitHub/ExData_Plotting1")

dat.full <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

# convert the date variable to Date class
dat.full$Date <- as.Date(dat.full$Date, format = "%d/%m/%Y")

# subset of the data you are working with
data <- subset(dat.full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

######################
# Plot 3
######################

# convert variable "date" into format class date% day% month% year
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$DateTime <- as.POSIXct(data$DateTime)

# convert variable "SubMetering" into numerical class format
SubMetering1 <- as.numeric(data$Sub_metering_1)
SubMetering2 <- as.numeric(data$Sub_metering_2)
SubMetering3 <- as.numeric(data$Sub_metering_3)



# label to data frame header
attach(data)

plot(Sub_metering_1 ~ DateTime,type="l",ylab="Energy sub metering",xlab="")
lines(Sub_metering_2 ~ DateTime, col = "Red")
lines(Sub_metering_3 ~ DateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save the graph with name "Plot3.pgn"
dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()

detach(data)