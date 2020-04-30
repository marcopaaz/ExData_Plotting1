library(dplyr)
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
text <- fread('household_power_consumption.txt')
text$Date <- as.Date(text$Date,format = "%d/%m/%Y")
data <- text[66637:69516]
data$Global_active_power <- as.numeric(data$Global_active_power)

## Plot of Data
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col='red'
     , main = 'Global Active Power'
     , xlab = 'Global Active Power (kilowatts)'
     , ylim = c(0,1200)
     , breaks = 20)
dev.off()