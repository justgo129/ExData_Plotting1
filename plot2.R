#Plot 2.R

#Read in Data to R
powerc<-read.csv ("household_power_consumption.txt", header=TRUE, sep=";")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)
powerc[,1]<-as.Date(powerc[,1])  # Convert dates so recognized as numeric
date1<-filter(powerc, Date == "0001-02-07", label=TRUE)
date2<-filter(powerc, Date == "0002-02-07", label=TRUE)
dates<-rbind(date1,date2)
rm(powerc)  # just to save space

#Preprocess

# Plot2: Get day of week to use for x-axis labels
daysofweek<-wday(dates$Date, label=TRUE, abbr=TRUE)  # Convert dates to days of week
daysofweek<-factor(daysofweek, ordered = FALSE)
daysofweek<-lapply(daysofweek, as.character)

# Plot 2: Generate Plot
plot(dates$Global_active_power, type="l", col="black", 
     axes=T, ann=T, xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)", lwd=2)
axis(1, at=1:11520, labels=daysofweek)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()