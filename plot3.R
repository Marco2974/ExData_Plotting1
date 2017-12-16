# Coursera: Exploratory analysis - Assignement 1
# plot 3
# getting and cleaning data
if (!file.exists("household_power_consumption.txt")) {
     url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     download.file(url, "hpc.zip", method = "curl")
     unzip("hpc.zip")
     file.remove("hpc.zip")
}
hpc<-read.table("household_power_consumption.txt",
                sep = ";", 
                stringsAsFactors = FALSE,
                header = TRUE,
                na.strings = "?")
hpc$datetime<-as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc_sub<-subset(hpc, datetime >= "2007-02-01" & datetime < "2007-02-03")
rm("hpc")
# plotting of sub_metering-1-2-3 vs datetime
png("plot3.png")
with(hpc_sub, plot(datetime, Sub_metering_1,
                   type = "l",
                   xlab = "", ylab = ""))
with(hpc_sub, lines(datetime, Sub_metering_2,
                    type = "l",
                    col = "red",
                    xlab = "", ylab = ""))
with(hpc_sub, lines(datetime, Sub_metering_3,
                    type = "l",
                    col = "blue",
                    xlab = "", ylab = ""))
title(ylab = "Energy sub metering")
legend("topright",
       lty = 1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
dev.off()