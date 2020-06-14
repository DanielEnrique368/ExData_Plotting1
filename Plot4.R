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
# Plot 4
######################

# convert variable "date" into format class date% day% month% year
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$DateTime <- as.POSIXct(data$DateTime)

# convert variable "SubMetering" into numerical class format
SubMetering1 <- as.numeric(data$Sub_metering_1)
SubMetering2 <- as.numeric(data$Sub_metering_2)
SubMetering3 <- as.numeric(data$Sub_metering_3)

#convert the data "GlobalActivePower"," GlobalReactivePower" and "Voltage"  to numeric character
GlobalActivePower <- as.numeric(data$Global_active_power)
GlobalReactivePower <- as.numeric(data$Global_reactive_power)
Voltage <- as.numeric(data$Voltage)

# divide the chart window into 4 sections
par(mfrow = c(2, 2)) 

# the first chart
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# the second graph
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# the third graph
plot(DateTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= , lwd=2.5, col=c("black", "red", "blue"),cex=0.3,text.font=3.5, bty="o")

# the fourth graphic
plot(DateTime, GlobalReactivePower, type="l", xlab="DateTime", ylab="Global_Reactive_Power")

# save the graph with name "Plot4.pgn"
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()

detach(data)


