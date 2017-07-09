

#Plot 3.R

#Read in Data to R
powerc<-read.csv ("household_power_consumption_subset.txt", header=TRUE, sep="")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)

png(file="plot3.png",width=480,height=480)

#Now, let's plot
legendcolors<-c("green", "red", "blue")  # Prepare legend colors

plot(powerc[,2], powerc[,7], type="l", main= "Plot 3", xlab="", ylab="Energy sub metering", 
     xaxt="n")

lines(powerc[,2], powerc[,7], type="l", col = legendcolors[1], lwd=1)
lines(powerc[,2], powerc[,8], type="l", col = legendcolors[2], lwd=1)
lines(powerc[,2], powerc[,9], type="l", col = legendcolors[3], lwd=1)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=powerc[k,1])

#Adjust axes values, and generate .png

legend("topright", legend = names(powerc[,7:9]), lty=1,
       col = legendcolors, border="black")

dev.off()
