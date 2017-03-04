## Course 4
## Load data
household <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, dec=".")
## Only these two days
household_Touse <- household[household$Date %in% c("1/2/2007","2/2/2007"),]

##Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(household_Touse$Global_active_power), col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
