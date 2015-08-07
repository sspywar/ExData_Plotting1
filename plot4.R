# This is the R script for Coursera Data Science course Exploratory Data Analysis
# course project 1, plot 4

plot4 <- function() {
        # Read the data and subset to the relevant dates
        df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        # Combine date and time, and convert to date
        df$Datetime <- paste(df$Date, df$Time)
        df$Datetime <- strptime(df$Datetime, "%d/%m/%Y %H:%M:%S")
        
        # Open the PNG device
        png(filename = "plot4.png", width = 480, height = 480, units = "px")
        
        # Modify mfcol parameter
        par(mfcol=c(2,2))
        
        # Create the plots
        plot(df$Datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        plot(df$Datetime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        lines(df$Datetime, df$Sub_metering_1, col="black")
        lines(df$Datetime, df$Sub_metering_2, col="red")
        lines(df$Datetime, df$Sub_metering_3, col="blue")
        legend("topright", bty="n", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(df$Datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage", col="black")
        plot(df$Datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", col="black")
        
        # Close the device
        dev.off()
}