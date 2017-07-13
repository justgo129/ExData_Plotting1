

#Plot 3.R

#Read in Data to R
library(lubridate); library(dplyr); library(graphics);

powerc<-read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";")

# Begin processing
powerc<-filter(powerc, Date == "1/2/2007" | Date == "2/2/2007")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
powerc[,1]<-as.Date(powerc[,1])   # -> change date from a factor to one of date

powerc<-cbind(powerc, paste(powerc[,1], powerc[,2])) # combine date and time: New col 10
powerc<-cbind(powerc, paste(powerc[,7], powerc[,8], powerc[,9]))  #Define new col 11: plotted area to include cols 7-9

# Change col class types to facilitate plotting
for (i in 7:9) {
  powerc[,i]<-as.numeric(powerc[,i])
}

#Now, let's plot
 png(file="plot3.png",width=480,height=480)
legendcolors<-c("black", "red", "blue")  # Prepare legend colors


plot(powerc[,10], powerc[,7], xlab="", type="l", ylab="Energy sub metering", 
     yaxt="n", xaxt="n")

lines(powerc[,10], powerc[,7], type="l", col = legendcolors[1], lwd=1)
lines(powerc[,10], powerc[,8], type="l", col = legendcolors[2], lwd=1)
lines(powerc[,10], powerc[,9], type="l", col = legendcolors[3], lwd=1)


axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))
axis(side = 2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))

legend("topright", legend = names(powerc[,7:9]), lty=1,
       lwd = 2, col = legendcolors)

 dev.off()
