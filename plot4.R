#Plot 4.R

#Read in Data to R - needed for all plots
par(mar = c(2.1, 4.1, 4.1, 2.1))
powerc<-read.csv ("household_power_consumption_subset.txt", header=TRUE, sep="")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)

png(file="plot4.png",width=480,height=480)

# 2*2 juxtaposition
par(mfrow=c(2,2))

# TOP LEFT PLOT

plot(powerc[,2], powerc[,3], type="l",  
     xlab="", xaxt="n",
     ylab="Global Active Power")
lines(powerc[,2], powerc[,3], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))



# TOP RIGHT PLOT

plot(powerc[,2], powerc[,5], type="l",
    xaxt="n", xlab="datetime",
    ylab="Voltage")
lines(powerc[,2], powerc[,5], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k),  labels=wday(powerc[k,1], label=TRUE))



# BOTTOM LEFT PLOT

legendcolors<-c("green", "red", "blue")  # Prepare legend colors

plot(powerc[,2], powerc[,7], type="l", xlab="", ylab="Energy sub metering", 
     xaxt="n")

lines(powerc[,2], powerc[,7], type="l", col = legendcolors[1], lwd=1)
lines(powerc[,2], powerc[,8], type="l", col = legendcolors[2], lwd=1)
lines(powerc[,2], powerc[,9], type="l", col = legendcolors[3], lwd=1)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))

legend("topright", legend = names(powerc[,7:9]), lty=1,
       col = legendcolors)

# BOTTOM RIGHT PLOT
plot(powerc[,2], powerc[,4], type="l",
     xlab="datetime", xaxt="n",
     ylab="Global_reactive_power")
lines(powerc[,2], powerc[,4], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))


dev.off()
