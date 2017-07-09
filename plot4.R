#Plot 4.R

#Read in Data to R - needed for all plots

powerc<-read.csv ("household_power_consumption_subset.txt", header=TRUE, sep="")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)

png(file="plot4.png",width=480,height=480)

# 2*2 juxtaposition
par(mfrow=c(2,2))

# TOP LEFT PLOT

hist(powerc$Global_active_power, breaks=10,  col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# TOP RIGHT PLOT

plot(powerc[,2], powerc[,4], type="l", main="Plot 2", 
     xlab="", xaxt="n",
     ylab="Voltage")
lines(powerc[,2], powerc[,4], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))



# BOTTOM LEFT PLOT

legendcolors<-c("green", "red", "blue")  # Prepare legend colors

plot(powerc[,2], powerc[,7], type="l", main= "Plot 3", xlab="", ylab="Energy sub metering", 
     xaxt="n")

lines(powerc[,2], powerc[,7], type="l", col = legendcolors[1], lwd=1)
lines(powerc[,2], powerc[,8], type="l", col = legendcolors[2], lwd=1)
lines(powerc[,2], powerc[,9], type="l", col = legendcolors[3], lwd=1)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))

legend("topright", legend = names(powerc[,7:9]), lty=1,
       col = legendcolors)

# BOTTOM RIGHT PLOT
plot(powerc[,2], powerc[,3], type="l", main="Plot 4", 
     xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
lines(powerc[,2], powerc[,3], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))


dev.off()

