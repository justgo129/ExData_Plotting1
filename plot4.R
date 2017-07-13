#Plot 4.R

#Read in Data to R - needed for all plots
par(mar = c(5.1, 4.1, 4.1, 2.1))
powerc<-read.csv ("household_power_consumption.txt", header=TRUE, sep=";")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)


powerc<-filter(powerc, Date == "1/2/2007" | Date == "2/2/2007")
powerc[,1]<-as.Date(powerc[,1])   # -> change date from a factor to one of date

powerc<-cbind(powerc, paste(powerc[,1], powerc[,2])) # combine date and time: New col 10
powerc<-cbind(powerc, paste(powerc[,7], powerc[,8], powerc[,9]))  #Define new col 11: plotted area to include cols 7-9

# Change col class types from factors, to facilitate plotting
for (i in 3:5) {
  powerc[,i]<-as.numeric(powerc[,i])
}
  
for (i in 7:9) {
  powerc[,i]<-as.numeric(powerc[,i])
}


 png(file="plot4.png",width=480,height=480)

# 2*2 juxtaposition
 par(mfrow=c(2,2))

# TOP LEFT PLOT

plot(powerc[,10], powerc[,3], ylab="Global Active Power (kilowatts)", type="l", xaxt="n")
axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))
lines(powerc[,10], powerc[,3], type="l", lwd=1)


# TOP RIGHT PLOT

plot(powerc[,10], powerc[,5], type="l",
    xaxt="n", xlab="datetime",
    ylab="Voltage")
lines(powerc[,10], powerc[,5], type="l", lwd=2)
axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))


# BOTTOM LEFT PLOT

legendcolors<-c("black", "red", "blue")  # Prepare legend colors


plot(powerc[,10], powerc[,7], xlab="", type="l", ylab="Energy sub metering", 
     yaxt="n", xaxt="n")

lines(powerc[,10], powerc[,7], type="l", col = legendcolors[1], lwd=1)
lines(powerc[,10], powerc[,8], type="l", col = legendcolors[2], lwd=1)
lines(powerc[,10], powerc[,9], type="l", col = legendcolors[3], lwd=1)


axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))
axis(side = 2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))

legend("topright", legend = names(powerc[,7:9]), 
       lwd = 2, col = legendcolors, bty = "n")

# BOTTOM RIGHT PLOT
plot(powerc[,10], powerc[,4], type="l", 
     xlab="datetime", xaxt="n",
     ylab="Global_reactive_power")
lines(powerc[,10], powerc[,4], type="l", col = "black", lwd=1)

axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))


dev.off()
