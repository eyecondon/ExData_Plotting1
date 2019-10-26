# read in data file
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset Date for the desired days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert character string to numeric for analysis
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plot frame
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# turn off plot device
dev.off()

