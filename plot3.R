###################################### Plot 3 ###############################################################

# Loading data
data_time <- read.csv("./data/data_time.csv", header = TRUE)

# Formatting datetime column to POSIXlt, POSIXt
data_time$datetime <- strptime(data_time$datetime,format = "%Y-%m-%d %H:%M:%S")

# Opening graphics device
png("plot3.png", width = 480,height = 480)

# Plotting
plot(data_time$datetime,data_time$Sub_metering_1, type = "n", ylab = "Energy Sub metering", xlab = " " )
lines(y = data_time$Sub_metering_1, x = data_time$datetime, type = "l")
lines(y = data_time$Sub_metering_2, x = data_time$datetime, type = "l", col = "red")
lines(y = data_time$Sub_metering_3, x = data_time$datetime, type = "l", col = "blue")

# Adding legend
legend("topright", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = 1, 
       col = c("black","red","blue"),
       text.font = 1, 
       inset=0, 
       pt.cex = 3, 
       cex = 0.8,
       adj = 0.02,
       xjust = 1)

# Closing Device
dev.off()