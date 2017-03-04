## Course 4
## Load data
household <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, dec=".")
## Only these two days
household_Touse <- household[household$Date %in% c("1/2/2007","2/2/2007"),]

##Plot 4
png("plot4.png", width=480, height=480)

datetime <- strptime(paste(household_Touse$Date, household_Touse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(household_Touse$Global_active_power)
globalReactivePower <- as.numeric(household_Touse$Global_reactive_power)
voltage <- as.numeric(household_Touse$Voltage)
subMetering1 <- as.numeric(household_Touse$Sub_metering_1)
subMetering2 <- as.numeric(household_Touse$Sub_metering_2)
subMetering3 <- as.numeric(household_Touse$Sub_metering_3)

# Create 2 rows and 2 columns
par(mfrow = c(2, 2)) 

# Upper left
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Upper right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Bottom left
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# Bottom right
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

