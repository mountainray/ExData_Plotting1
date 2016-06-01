# code for Course_Project_1...plot1.R

setwd("/Users/rb/Desktop/Data Science course/Exploratory_Data_Analysis/Course_Project_1")

# check for expected folder, create if it does not exist
if(!file.exists("./data")) {dir.create("./data")}

# The dataset has 2,075,259 rows and 9 columns.  Approximately 8 bytes per numeric...estimate the memory requirements.
rows <- 2075259
columns <- 9
avg_bytes_numeric <- 8

estimated_memory_required_MB <- (rows * columns * avg_bytes_numeric)/2^20
estimated_memory_required_MB

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
str(household_power_consumption)

# avoid the scientific notation observed in png output by changing the "scipen" setting
options(scipen = 5)

png(filename = "plot1.png", width = 480, height = 480)

# set the layout...comes in handy when this code is run after the fourth part of this week's project, which 
# has multiple plots (2 X 2)
par(mfrow=c(1,1))

hist(household_power_consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# turn the png file device off
dev.off()
