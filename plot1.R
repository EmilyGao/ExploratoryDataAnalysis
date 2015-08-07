
library(data.table)
library(dplyr)  

# read file
setwd(dir = "C:/Users/gaoem.PBS/Documents/R Files/DataScientistAssignments/Exploratory Data Analysis/exdata-data-household_power_consumption")
hpc = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hpc <- filter (hpc, as.Date(Date, "%d/%m/%Y") == as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y") )
hpc <- as.data.frame(hpc)

# specify png device
png(filename = "plot1.png", width = 480, height = 480,
    pointsize = 12, bg = "white",  res = NA)


# plot1 - the frequency of Global_active_power
hist(as.numeric(hpc$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "Red",
     xaxp = c(0, 6, 3),
     yaxp = c(0, 1200, 6))


dev.off()



