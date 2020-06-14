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
# Plot 1
######################

# convert the data "GlobalActivePower" to numeric character
GlobalActivePower <- as.numeric(data$Global_active_power)

# graph the histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# save the graph with name "Plot1.pgn"
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()

