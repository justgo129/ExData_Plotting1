#Plot 2.R


#Read in Data to R
#Plot 2.R


#Read in Data to R
library(lubridate); library(dplyr); library(graphics);

powerc<-read.table("household_power_consumption.txt", 
                   header=TRUE, sep=" ")

# Begin processing
powerc<-filter(powerc, Date == "1/2/2007" | Date == "2/2/2007") 
powerc[,1]<-as.Date(powerc[,1])   # -> change date from a factor to one of date
powerc<-cbind(powerc, paste(powerc[,1], powerc[,2])) # combine date and time

powerc[,3]<-as.numeric(as.character(powerc[,3]), na.rm=TRUE)  
powerc[,3]<-as.numeric(powerc[,3],exclude = NULL) # So no return error with plotted

# Plot, using cutoffs for dates
png(file="plot2.png",width=480,height=480)
plot(powerc[,10], powerc[,3], ylab="Global Active Power (kilowatts)", type="l", xaxt="n")
lines(powerc[,10], powerc[,3], ty="l")

axis(1, at=c(1,1441, 2880), labels = c("Thurs", "Fri", "Sat"))


dev.off()

