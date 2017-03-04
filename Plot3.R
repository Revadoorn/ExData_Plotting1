## Course 4
## Load data
household <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, dec=".")
## Only these two days
household_Touse <- household[household$Date %in% c("1/2/2007","2/2/2007"),]

##Plot 3
png("plot3.png", width=480, height=480)

datetime <- strptime(paste(household_Touse$Date, household_Touse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(household_Touse$Global_active_power)
subMetering1 <- as.numeric(household_Touse$Sub_metering_1)
subMetering2 <- as.numeric(household_Touse$Sub_metering_2)
subMetering3 <- as.numeric(household_Touse$Sub_metering_3)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()