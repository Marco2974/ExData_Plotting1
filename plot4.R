# Coursera: Exploratory analysis - Assignement 1
# plot 4
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
# 4 graphs (2x2) in a plot (vertical order)
png("plot4.png")
par(mfcol = c(2,2))
# plot4-1: global active power vs datetime
with(hpc_sub, plot(datetime, Global_active_power,
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power"))
# plot4-2: sub_metering-1-2-3 vs datetime
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
       col = c("black", "red", "blue"),
       bty = "n",
       cex = 0.9)
# plot 4-3: voltage vs datetime
with(hpc_sub, plot(datetime, Voltage,
                   type = "l"))
# plot4-4: global reative power vs datetime
with(hpc_sub, plot(datetime, Global_reactive_power,
                   type = "l"))
dev.off()