## Course 4
## Load data
household <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, dec=".")
## Only these two days
household_Touse <- household[household$Date %in% c("1/2/2007","2/2/2007"),]


##Plot 2
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(household_Touse$Date, household_Touse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, as.numeric(household_Touse$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
