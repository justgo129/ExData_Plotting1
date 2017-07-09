#Plot 2.R

#Preprocessing of data

#Read in Data to R
powerc<-read.csv ("household_power_consumption_subset.txt", header=TRUE, sep="")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)

png(file="plot2.png",width=480,height=480)

# Plot 2: Generate Plot
plot(powerc[,2], powerc[,3], type="l", main="Plot 2", 
     xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
lines(powerc[,2], powerc[,3], type="l", col = "black", lwd=2)
k=seq(1,2160,1.5)
axis(1, at=seq(k), labels=wday(powerc[k,1], label=TRUE))

dev.off()

