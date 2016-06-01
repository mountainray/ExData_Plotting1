# code for Course_Project_1...plot4.R

setwd("/Users/rb/Desktop/Data Science course/Exploratory_Data_Analysis/Course_Project_1")

# check for expected folder, create if it does not exist
if(!file.exists("./data")) {dir.create("./data")}

#read in file records
household_power_consumption <- read.table(file="./data/household_power_consumption.txt",
                                          header = TRUE,
                                          colClasses = c("character", "character", "numeric", "numeric",
                                                         "numeric", "numeric", "numeric", "numeric", "numeric"),
                                          sep = ";",
                                          na.strings = "?")
# subset for dates 2/1/2007 and 2/2/2007...incoming as character in d/m/yyyy format
household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
head(household_power_consumption)

household_power_consumption$newdatetime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
head(household_power_consumption)
str(household_power_consumption)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
with(household_power_consumption, plot(newdatetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
lines(household_power_consumption$newdatetime, household_power_consumption$Global_active_power, type = "l")

# Plot 2
with(household_power_consumption, plot(newdatetime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
lines(household_power_consumption$newdatetime, household_power_consumption$Voltage, type = "l")

# Plot 3
with(household_power_consumption, plot(newdatetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(household_power_consumption$newdatetime, household_power_consumption$Sub_metering_1, type = "l", col = "black")
lines(household_power_consumption$newdatetime, household_power_consumption$Sub_metering_2, type = "l", col = "red")
lines(household_power_consumption$newdatetime, household_power_consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), lwd = c(1,1,1), box.lty = 0)

# Plot 4
with(household_power_consumption, plot(newdatetime, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"))
lines(household_power_consumption$newdatetime, household_power_consumption$Global_reactive_power, type = "l")

# turn png file device off
dev.off()
