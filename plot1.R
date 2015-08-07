# This is the R script for Coursera Data Science course Exploratory Data Analysis
# course project 1, plot 1

plot1 <- function() {
        # Read the data and subset to the relevant dates
        df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        # Open the PNG device
        png(filename = "plot1.png", width = 480, height = 480, units = "px")
        
        # Create the plot
        hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red", breaks=12)
        
        # Close the device
        dev.off()
}

