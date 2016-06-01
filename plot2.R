# code for Course_Project_1...plot2.R

setwd("/Users/rb/Desktop/Data Science course/Exploratory_Data_Analysis/Course_Project_1")

# check for expected folder, create if it does not exist
if(!file.exists("./data")) {dir.create("./data")}

# read in file records 
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

png(filename = "plot2.png", width = 480, height = 480)

# set the layout...comes in handy when this code is run after the fourth part of this week's project, which 
# has multiple plots (2 X 2)
par(mfrow=c(1,1))

with(household_power_consumption, plot(newdatetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
lines(household_power_consumption$newdatetime, household_power_consumption$Global_active_power, type = "l")

# turn png file device off
dev.off()
