library(dplyr)
library(lubridate)
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
text <- fread('household_power_consumption.txt')
text$DateTime <- paste(text$Date,text$Time,sep = '-')
text$DateTime <- as.POSIXct(text$DateTime,format = "%d/%m/%Y-%H:%M:%S")
text$Global_active_power <- as.numeric(text$Global_active_power)
data <- text[66637:69516]

##Plot Data

png("plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type = 'l'
                , xlab =''
                , ylab = 'Global Active Power (kilowatts)'))
dev.off()