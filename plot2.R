###################################### Plot 2 ###############################################################

# Loading data
data <- read.csv("./data/data.csv",header = TRUE)

# Converting Date column to class Date
data$Date <- as.Date(data$Date,format = "%Y-%m-%d")

# Combining Date and Time columns 
data$datetime <- paste(data$Date,data$Time)

# Creating a new dataset with only the important variables
data <- data[c("datetime","Global_active_power","Global_reactive_power",
               "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
               "Sub_metering_3")]

# Formatting datetime column to POSIXlt, POSIXt
data$datetime <- strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S")

########## Plotting ###########

# Opening graph device to save the plot
png("plot2.png",width = 480,height = 480)


with(data,plot(x = datetime,y = Global_active_power, 
               type = "l", 
               xlab = " ", 
               ylab = "Global Active Power (kilowatts)"))
               
# Closing graph device
dev.off()


