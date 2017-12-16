# Coursera: Exploratory analysis - Assignement 1
# plot 2
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
# plotting of Global Active Power vs datetime
png("plot2.png")
with(hpc_sub, plot(datetime, Global_active_power,
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
dev.off()