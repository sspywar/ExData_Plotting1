# This is the R script for Coursera Data Science course Exploratory Data Analysis
# course project 1, plot 3

plot3 <- function() {
        # Read the data and subset to the relevant dates
        df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        # Combine date and time, and convert to date
        df$Datetime <- paste(df$Date, df$Time)
        df$Datetime <- strptime(df$Datetime, "%d/%m/%Y %H:%M:%S")
        
        # Open the PNG device
        png(filename = "plot3.png", width = 480, height = 480, units = "px")
        
        # Create the plot
        plot(df$Datetime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        lines(df$Datetime, df$Sub_metering_1, col="black")
        lines(df$Datetime, df$Sub_metering_2, col="red")
        lines(df$Datetime, df$Sub_metering_3, col="blue")
        legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Close the device
        dev.off()
}