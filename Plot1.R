###################################### Plot 1 ###############################################################

## Creating directory to download data
if(!dir.exists("./data")){dir.create("./data")}

## Downloading data
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url,destfile = "./data/electric_power_consumption.zip")

## Unziping data in the directory
unzip(zipfile = "./data/electric_power_Consumption.zip", exdir = "./data")

## Importing data to R
data <- read.table("./data/household_power_consumption.txt", sep = ";",header = TRUE)

## Converting Date to Date class 
data$Date<- with(data,as.Date(Date, format = "%d/%m/%Y"))

## Subsetting data to work faster and removing old dataset
data2 <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)                   

######### Plotting Global Active Power ############

# Setting the graphic device
png("plot1.png",width = 480,height = 480)


# Converting Global Active power to class numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

# Making the histogram
with(data2, hist(x = Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

# Closing Graphic Device
dev.off()  