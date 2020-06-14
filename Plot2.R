# Downloaded the "dplyr" package that will help us to structure the data with the code "tbl_df" 
library(dplyr) 

# modify the directory address with the code 'setwd'.
setwd("C:/Users/DANIEL/Documents/GitHub/ExData_Plotting1")

dat.full <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

# convert variable "date" into format class date% day% month% year
dat.full$Date <- as.Date(dat.full$Date, format = "%d/%m/%Y")

# subset of the data you are working with
data <- subset(dat.full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

######################
# Plot 2
######################

# form a column where the date and time data are
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$DateTime <- as.POSIXct(data$DateTime)

# label to data frame header
attach(data)

# By language subjects in R is Thursday=Jueves (Thu.=ju.), Friday=Viernes(Fri.=vi.) and Saturday=Sabado(Sat=sá.)
plot(Global_active_power~DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# save the graph with name "Plot2.pgn"
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()

detach(data)


