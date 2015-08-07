
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
png(filename = "plot4.png", width = 480, height = 480,
    pointsize = 12, bg = "white",  res = NA)

par(mfrow=c(2,2), mar = c(5, 5, 0.5, 0.5))


# plot2 - Global_active_power (kilowatts) over Datetime (weekdays)

plot(hpc$DateTime, as.numeric(hpc$Global_active_power), 
     type = "l",
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     col = "black",
     yaxp = c(-2, 8, 5),
     lwd = 1)


# plot4 - Voltage over Datetime
plot(hpc$DateTime, as.numeric(hpc$Voltage), 
     type = "l",
     main = "", 
     xlab = "DateTime",
     ylab = "Voltage",
     col = "black",
     yaxp = c(234, 246, 3),
     lwd = 1)


# plot5 - Global_reactive_power (kilowatts) over Datetime (weekdays)
plot(hpc$DateTime, as.numeric(hpc$Global_reactive_power), 
     type = "l",
     main = "", 
     xlab = "DateTime",
     ylab = "Global_reactive_power",
     col = "black",
     yaxp = c(0.0, 0.5, 5),
     lwd = 1)


# plot3 - Sub_metering over Datetime (weekdays)


plot(hpc$DateTime, as.numeric(hpc$Sub_metering_1), 
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     yaxp = c(0, 50, 5),
     ylim=c(0,max(as.numeric(hpc$Sub_metering_1))+15)
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









