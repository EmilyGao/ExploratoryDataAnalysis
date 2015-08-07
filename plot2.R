
library(data.table)
library(dplyr)  
library(lubridate)

# read file
setwd(dir = "C:/Users/gaoem.PBS/Documents/R Files/DataScientistAssignments/Exploratory Data Analysis/exdata-data-household_power_consumption")
hpc = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hpc<-filter (hpc, as.Date(Date, "%d/%m/%Y") == as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y") )

# convert date and time to DateTime 
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), format ="%d/%m/%Y %H:%M:%S")
hpc <- as.data.frame(hpc)

# specify png device
png(filename = "plot2.png", width = 480, height = 480,
    pointsize = 12, bg = "white",  res = NA)

# plot2 - Global_active_power (kilowatts) over Datetime (weekdays)

plot(hpc$DateTime, as.numeric(hpc$Global_active_power), 
     type = "l",
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     col = "black",
     yaxp = c(-2, 8, 5),
     lwd = 1,
     ylim=c(-0.01,max(as.numeric(hpc$Global_active_power))+1))

dev.off()








