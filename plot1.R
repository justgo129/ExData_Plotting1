#Plot1.R


#Preprocessing of data

powerc<-read.csv ("household_power_consumption.txt", header=TRUE, sep=";")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr);library(tidyr); library(graphics)
powerc[,1]<-as.Date(powerc[,1])  # Convert dates so recognized as numeric
date1<-filter(powerc, Date == "0001-02-07", label=TRUE)
date2<-filter(powerc, Date == "0002-02-07", label=TRUE)
dates<-rbind(date1,date2)
rm(powerc)  # just to save space


# Create plot1.png
dates$Global_active_power<-as.numeric(dates[,3]) # In order to avoid "x must 
                                                # be numeric" errors 
                                                 # when drawing the histogram
hist(dates$Global_active_power, breaks=10,  col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save plot
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()