
library(data.table)
library(dplyr)  
library(lubridate)

# read file
setwd(dir = "C:/Users/gaoem.PBS/Documents/R Files/DataScientistAssignments/Exploratory Data Analysis/exdata-data-household_power_consumption")
hpc = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hpc<-filter (hpc, as.Date(Date, "%d/%m/%Y") == as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y") )
hpc <- as.data.frame(hpc)
# hpc<-filter (hpc, !hpc$Sub_metering_1 == "\\?" )
# hpc<-filter (hpc, !hpc$Sub_metering_2 == "\\?" )
# hpc<-filter (hpc, !hpc$Sub_metering_3 == "\\?" )

# convert date and time to DateTime 
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), format ="%d/%m/%Y %H:%M:%S")

# specify png device
png(filename = "plot3.png", width = 480, height = 480,
    pointsize = 12, bg = "white",  res = NA)

# plot3 - Sub_metering over Datetime (weekdays)

plot(hpc$DateTime, as.numeric(hpc$Sub_metering_1), 
     type = "n",
     main = "",
     xaxt="n", 
     yaxt="n",
     xlab = "",
     ylab = "Energy sub metering",
     ylim=c(0,max(as.numeric(hpc$Sub_metering_3))+10)
     )
plot(hpc$DateTime, as.numeric(hpc$Sub_metering_1), 
     type = "l",
     col = "black",
     xlab = "",
     ylab = "", 
     yaxp = c(0, 30, 3),
     ylim=c(0,max(as.numeric(hpc$Sub_metering_1))+10)
     )

lines(hpc$DateTime, as.numeric(hpc$Sub_metering_2), 
    type = "l",
     col = "red")
lines(hpc$DateTime, as.numeric(hpc$Sub_metering_3), 
     type = "l",
     col = "blue")

legend("topright",  pch = "-",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()






