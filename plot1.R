#Plot1.R


#Preprocessing of data

#Read in Data to R
powerc<-read.csv ("household_power_consumption_subset.txt", header=TRUE, sep="")
powerc[powerc == "?"]<-NA   # replace all "?" fields with "NA"
library(lubridate); library(dplyr); library(tidyr); library(graphics)


# Create plot1.png

hist(powerc$Global_active_power, breaks=10,  col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save plot
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
