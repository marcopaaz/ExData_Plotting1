packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
text <- fread('household_power_consumption.txt')
text$DateTime <- paste(text$Date,text$Time,sep = '-')
text$DateTime <- as.POSIXct(text$DateTime,format = "%d/%m/%Y-%H:%M:%S")
text$Sub_metering_1 <- as.numeric(text$Sub_metering_1)
text$Sub_metering_2 <- as.numeric(text$Sub_metering_2)
text$Sub_metering_3 <- as.numeric(text$Sub_metering_3)
data <- text[66637:69516]

png("plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type = 'l'
                , xlab =''
                , ylab = 'Energy Sub Metering'))
lines(data$DateTime,data$Sub_metering_2, type = 'l', col='red')
lines(data$DateTime,data$Sub_metering_3, type = 'l', col='blue')
legend("topright", 
       legend = c("Sub Metering 1", "Sub Metering 2"," Sub Metering 3")
       , col = c('black','red','blue')
       , lty = 1
       , lwd = 1
       , cex = 0.8)  

dev.off()