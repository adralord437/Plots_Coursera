###################################### Plot 3 ###############################################################

# Loading Data
data_time <- read.csv("./data/data_time.csv", header = TRUE)

# Converting datetime column to class POSIXlt, POSIXt
data_time$datetime <- strptime(data_time$datetime, format = "%Y-%m-%d %H:%M:%S")

################ Plotting #####################

# Setting graphics device
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#plot1
with(data_time,plot(x = datetime,y = Global_active_power, 
               type = "l", 
               xlab = " ", 
               ylab = "Global Active Power (kilowatts)"))

#plot2
with(data_time, plot(x = datetime, y = Voltage,
                     type = "l",
                     xlab = "datetime",
                     ylab = "Voltage"))

#plot3
plot(data_time$datetime,data_time$Sub_metering_1, type = "n", ylab = "Energy Sub metering", xlab = " " )
lines(y = data_time$Sub_metering_1, x = data_time$datetime, type = "l")
lines(y = data_time$Sub_metering_2, x = data_time$datetime, type = "l", col = "red")
lines(y = data_time$Sub_metering_3, x = data_time$datetime, type = "l", col = "blue")

# Adding legend to plot3
legend("topright", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = 1, 
       col = c("black","red","blue"),
       text.font = 1, 
       inset=0, 
       pt.cex = 3, 
       cex = 0.8,
       adj = 0.02,
       xjust = 1)

#plot4
with(data_time, plot(x = datetime, y = Global_reactive_power, 
                     type = "l", 
                     xlab = "datetime"))

## Closing graphics device
dev.off()