#Plot1.R


# Read in libraries and data frame:
library(lubridate); library(dplyr); library(graphics) 
powerc<-read.table("household_power_consumption.txt", 
   header=TRUE, sep=";")

#Begin processing data: (1) dates, and (2) item to be tracked:
powerc<-filter(powerc, Date == "1/2/2007" | Date == "2/2/2007")
powerc[,1]<-as.Date(powerc[,1], format = "%d/%m/%Y")

powerc[,3]<-as.numeric(as.character(powerc[,3]), na.rm=TRUE)
powerc[,3]<-as.numeric(powerc[,3],exclude = NULL) # So no 
                                                  # return error with "hist"

# Create plot1.png
 png(file="plot1.png",width=480,height=480)

hist(powerc[,3], breaks=10, col = "red", main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", ylim=c(0, 1200), xaxt="n")
axis(side=1, at=c(0, 2, 4, 6))  # sets non-default x-axis values
dev.off()
